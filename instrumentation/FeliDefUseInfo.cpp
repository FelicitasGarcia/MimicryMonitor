#include "llvm/Transforms/Mimicry/FeliDefUseInfo.h"
#include "llvm/Transforms/Mimicry/MimicryInstrument.h"
#include "llvm/ADT/SetVector.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Instructions.h"
#include "llvm/DebugInfo/DIContext.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InstVisitor.h"
#include <map>
#include <string>

namespace llvm {

    std::string getVariableName(const Value *V) {
      if (!V)
        return "<unknown>";

      if (V->hasName())
        return V->getName().str();

      if (const Instruction *I = dyn_cast<Instruction>(V)) {
        const Function *F = I->getFunction();
        for (const BasicBlock &BB : *F) {
          for (const Instruction &Inst : BB) {
            for (DbgRecord &DR : Inst.getDbgRecordRange()) {
              if (auto *DVR = dyn_cast<DbgVariableRecord>(&DR)) {
                for (Value *Op : DVR->location_ops()) {
                  if (Op == V) {
                    if (const DILocalVariable *Var = DVR->getVariable())
                      return Var->getName().str();
                  }
                }
              }
            }
          }
        }
      }

//      std::string Name;
//      raw_string_ostream OS(Name);
//      V->printAsOperand(OS, false);
      return "";

    }

    void getReadWriteVars(const Instruction &I,
                          SmallVectorImpl<const Value *> &Reads,
                          SmallVectorImpl<const Value *> &Writes) {
      // Handle specific instructions first
      if (auto *SI = dyn_cast<StoreInst>(&I)) {
    //    errs() << "StoreInst: " << *SI << "\n";
        Writes.push_back(SI->getPointerOperand());
        if (SI->getValueOperand()->getType()->isPointerTy())
          Reads.push_back(SI->getValueOperand());
      } else if (auto *LI = dyn_cast<LoadInst>(&I)) {
    //    errs() << "LoadInst: " << *LI << "\n";
        Reads.push_back(LI->getPointerOperand());
      } else if (auto *CI = dyn_cast<CallInst>(&I)) {
    //    errs() << "CallInst: " << *CI << "\n";
        for (unsigned i = 0; i < CI->arg_size(); ++i) {
          Value *Arg = CI->getArgOperand(i);
          Reads.push_back(Arg);
          if (Arg->getType()->isPointerTy()) {
           Writes.push_back(Arg);
          }
        }
      }

      // For other instructions, only consider operands that aren't already handled
      if (!isa<StoreInst>(&I) && !isa<LoadInst>(&I) && !isa<CallInst>(&I)) {
    //    errs() << "Other Instruction: " << I << "\n";
        for (const Use &U : I.operands()) {
          Value *Op = U.get();
          if (Op->getType()->isPointerTy() && !isa<Constant>(Op) && !isa<BasicBlock>(Op))
            Reads.push_back(Op);
        }
      }
    }

    void reportAccess(const std::string &BBName, unsigned LineNo,
                     ArrayRef<const Value *> Reads, ArrayRef<const Value *> Writes,
                     AliasAnalysis &AA, ArrayRef<Value *> AllPtrs) {
      // Use sets to avoid duplicates
      DenseSet<const Value *> ReportedReads;
      DenseSet<const Value *> ReportedWrites;

      for (const Value *V : Reads) {
        if (ReportedReads.insert(V).second) {
          if (!getVariableName(V).empty()) {
                 errs() << BBName << "@" << LineNo << " | Variable: "
                 << getVariableName(V) << " | Action: R\n";
          }
        }
      }

      for (const Value *V : Writes) {
        if (ReportedWrites.insert(V).second) {
          if (!getVariableName(V).empty()) {
              errs() << BBName << "@" << LineNo << " | Variable: "
                     << getVariableName(V) << " | Action: W\n";
          }

          // Report aliases only once per write
          DenseSet<const Value *> ReportedAliases;
          for (Value *Other : AllPtrs) {
            if (Other == V || ReportedAliases.count(Other) || getVariableName(Other).empty())
              continue;

            AliasResult AR = AA.alias(V, Other);
            if (AR == AliasResult::MayAlias || AR == AliasResult::MustAlias) {
              if (ReportedAliases.insert(Other).second) {
                errs() << BBName << "@" << LineNo << " | Variable: "
                       << getVariableName(Other) << " | Action: W (via alias)\n";
              }
            }
          }
        }
      }
    }

    // Implementation of FeliDefUseInfo pass
    PreservedAnalyses FeliDU::run(Function &F, FunctionAnalysisManager &AM) {
      AliasAnalysis &AA = AM.getResult<AAManager>(F);
      SmallVector<Value *, 16> PointerValues;

      for (Instruction &I : instructions(F)) {
        for (Use &U : I.operands()) {
          Value *Op = U.get();
          if (Op->getType()->isPointerTy() && !isa<Constant>(Op))
            PointerValues.push_back(Op);
        }
      }

      for (BasicBlock &BB : F) {
        std::string BBName = BB.getName().str();
        if (BBName.empty())
          BBName = "entry";

        for (Instruction &I : BB) {
          if (isa<DbgInfoIntrinsic>(I) || I.isLifetimeStartOrEnd())
            continue;

          if (!I.getDebugLoc())
            continue;

          unsigned LineNo = I.getDebugLoc().getLine();
          SmallVector<const Value *, 8> Reads, Writes;
          errs() << "Processing instruction: " << I << "\n";
          getReadWriteVars(I, Reads, Writes);
          reportAccess(BBName, LineNo, Reads, Writes, AA, PointerValues);
        }
      }

      return PreservedAnalyses::all();
    }
}
