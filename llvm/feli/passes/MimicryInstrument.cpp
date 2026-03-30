// Archivo adaptado para instrumentar en los edges en lugar de los bloques
#include "llvm/Transforms/Mimicry/MimicryInstrument.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/Mimicry/FeliDefUseInfo.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"
#include <map>
#include <string>
#include <regex>
#include <fstream>

using namespace llvm;

// Command line option to specify the dot file
static cl::opt<std::string> DotFile(
    "dot-file",
    cl::desc("Specify the dot file representing the automaton"),
    cl::value_desc("filename"));

static cl::opt<std::string> MonitorPolicy(
       "monitor-policy",
       cl::desc("Policy for monitoring (stop-v, stop-iv, or empty)"),
       cl::value_desc("policy"), cl::init("n"));

std::map<std::string, AutomatonNode> automaton;
std::string initialNodeId = "1";
GlobalVariable* currentStateGV = nullptr;
bool automatonParsed = false;

Value *MimicryInstrumentPass::createGlobalStringPtr(Module *module, const std::string &str, int uniqueId) {
  LLVMContext &context = module->getContext();
  Constant *strConstant = ConstantDataArray::getString(context, str);

  // Create a unique name for the global variable
  std::string gvName = ".str." + std::to_string(uniqueId);

  // Create or get the global variable
  GlobalVariable *gv = new GlobalVariable(
    *module,
    strConstant->getType(),
    true,                          // isConstant
    GlobalValue::PrivateLinkage,   // Linkage
    strConstant,                   // Initializer
    gvName                         // Name
  );

  // Create a GEP instruction to get a pointer to the string
  Constant *zero = ConstantInt::get(Type::getInt32Ty(context), 0);
  Constant *indices[] = {zero, zero};
  Constant *strPtr = ConstantExpr::getInBoundsGetElementPtr(
    strConstant->getType(), gv, indices);

  return strPtr;
}

bool MimicryInstrumentPass::parseAutomatonFromDotFile(const std::string &filename) {
  std::ifstream file(filename);
  if (!file.is_open()) {
    errs() << "Error: Could not open dot file: " << filename << "\n";
    return false;
  }

  std::string line;
  std::regex nodeRegex("^\\s*(-?\\d+)\\s*\\[label=\"([^\"]+)\"");
  std::smatch matches;

  // Clear previous automaton if any
  automaton.clear();

  // Keep track of all node IDs to determine the initial one
  std::vector<std::string> nodeIds;

  // Parse the dot file
  while (std::getline(file, line)) {
    // Parse node definitions
    if (std::regex_search(line, matches, nodeRegex)) {
      std::string nodeId = matches[1].str();
      std::string nodeLabel = matches[2].str();

      // Debug output
      errs() << "DEBUG: Found node " << nodeId << " with label '" << nodeLabel << "'\n";

      // Keep track of node IDs
      nodeIds.push_back(nodeId);

      // Create node and set properties
      automaton[nodeId].id = nodeId;
      automaton[nodeId].verdict = nodeLabel;
      automaton[nodeId].conditionName = ""; // Initialize empty
      automaton[nodeId].isTerminal = (nodeLabel == "V" || nodeLabel == "IV");
    }

    // Updated regex to recognize any word/identifier after the colon
    std::regex edgeRegex(R"(^\s*(-?\d+)\s*->\s*(-?\d+)\s*\[label="([^"]*?)(?:\\l:\s*([a-zA-Z_][a-zA-Z0-9_]*|-?\d+))?",\s*id=\s*(\d+)\];)");

    // In the edge parsing section, update the logic accordingly:
    if (std::regex_search(line, matches, edgeRegex)) {
        std::string fromNode = matches[1].str();
        std::string toNode = matches[2].str();
        std::string label = matches[3].str();
        std::string branchValue = matches[4].str(); // This can now be any word or number

        // Debug output
        errs() << "DEBUG: Found edge from " << fromNode << " to " << toNode
               << " with label '" << label << "', branch value '" << branchValue << "'\n";

        // Determine the transition type
        std::string transitionType;
        if (!branchValue.empty()) {
            // Check if it's a number (for switch cases)
            if (std::regex_match(branchValue, std::regex(R"(-?\d+)"))) {
                transitionType = "case_" + branchValue; // e.g., "case_4" for switch case 4
            } else {
                // It's a word/identifier - use it directly
                if (branchValue == ("def")) {
                    branchValue =  "default";
                }
                transitionType = branchValue; // e.g., "then", "else", "error", "success", etc.
            }
        } else if (!label.empty()) {
            transitionType = "cond"; // generic condition when no specific branch value
        } else {
            transitionType = "default"; // fallback
        }

        automaton[fromNode].transitions[transitionType] = toNode;
    }
  }

  if (automaton.empty()) {
    errs() << "Error: Failed to parse automaton from dot file\n";
    return false;
  }

  // Set initial node ID to the first node found, or "1" if available
  if (!nodeIds.empty()) {
    // Try to find node "1" first, otherwise use the first node
    bool foundOne = false;
    for (const auto& id : nodeIds) {
      if (id == "1") {
        initialNodeId = "1";
        foundOne = true;
        break;
      }
    }
    if (!foundOne) {
      initialNodeId = nodeIds[0];
    }
  } else {
    initialNodeId = "1"; // fallback
  }

  errs() << "DEBUG: Set initial node ID to: '" << initialNodeId << "'\n";
  errs() << "DEBUG: Parsed " << automaton.size() << " nodes\n";

  return true;
}

void MimicryInstrumentPass::createAutomatonGlobals(Module *module) {
  LLVMContext &context = module->getContext();

  // Create a global variable to hold the current state of the automaton
  if (!currentStateGV) {
    // Initialize with the initial state ID
    Constant *initialState = ConstantInt::get(Type::getInt32Ty(context), std::stoi(initialNodeId));

    currentStateGV = new GlobalVariable(
      *module,
      Type::getInt32Ty(context),
      false, // Not constant - will be updated at runtime
      GlobalValue::ExternalLinkage,
      initialState,
      "automatonCurrentState"
    );
  }
}

Value* createAutomatonArray(Module* module, const std::map<std::string, AutomatonNode>& automaton) {
    LLVMContext& context = module->getContext();

    // First create a struct type for Transition
    StructType* transitionType = StructType::create(context, "AutomatonTransition");
    transitionType->setBody({
        PointerType::getUnqual(context), // transition type (e.g., "then", "else", "case_4")
        PointerType::getUnqual(context)  // target node ID
    });

    // Then create the main node type
    StructType* nodeType = StructType::create(context, "AutomatonNode");
    nodeType->setBody({
        PointerType::getUnqual(context),       // id
        PointerType::getUnqual(context),       // verdict
        PointerType::getUnqual(context),       // conditionName
        Type::getInt1Ty(context),              // isTerminal
        PointerType::getUnqual(transitionType), // transitions array
        Type::getInt32Ty(context)              // numTransitions
    });

    // Create initializer for each node
    std::vector<Constant*> nodes;
    for (const auto& [id, node] : automaton) {
        // Create strings for basic fields
        Constant* idStr = ConstantDataArray::getString(context, id);
        Constant* verdictStr = ConstantDataArray::getString(context, node.verdict);
        Constant* conditionStr = ConstantDataArray::getString(context, node.conditionName);

        // Create global variables for basic fields
        GlobalVariable* gvId = new GlobalVariable(
            *module, idStr->getType(), true,
            GlobalValue::PrivateLinkage, idStr, "id.str." + id);

        GlobalVariable* gvVerdict = new GlobalVariable(
            *module, verdictStr->getType(), true,
            GlobalValue::PrivateLinkage, verdictStr, "verdict.str." + id);

        GlobalVariable* gvCondition = new GlobalVariable(
            *module, conditionStr->getType(), true,
            GlobalValue::PrivateLinkage, conditionStr, "condition.str." + id);

        // Create GEPs for basic fields
        Constant* gepId = ConstantExpr::getInBoundsGetElementPtr(
            gvId->getValueType(),
            gvId,
            ArrayRef<Constant*>({
                ConstantInt::get(Type::getInt32Ty(context), 0),
                ConstantInt::get(Type::getInt32Ty(context), 0)
            })
        );

        Constant* gepVerdict = ConstantExpr::getInBoundsGetElementPtr(
            gvVerdict->getValueType(),
            gvVerdict,
            ArrayRef<Constant*>({
                ConstantInt::get(Type::getInt32Ty(context), 0),
                ConstantInt::get(Type::getInt32Ty(context), 0)
            })
        );

        Constant* gepCondition = ConstantExpr::getInBoundsGetElementPtr(
            gvCondition->getValueType(),
            gvCondition,
            ArrayRef<Constant*>({
                ConstantInt::get(Type::getInt32Ty(context), 0),
                ConstantInt::get(Type::getInt32Ty(context), 0)
            })
        );

        // Create transitions array
        std::vector<Constant*> transitions;
        for (const auto& [transType, targetId] : node.transitions) {
            // Create strings for transition type and target
            Constant* typeStr = ConstantDataArray::getString(context, transType);
            Constant* targetStr = ConstantDataArray::getString(context, targetId);

            GlobalVariable* gvType = new GlobalVariable(
                *module, typeStr->getType(), true,
                GlobalValue::PrivateLinkage, typeStr, "trans.type." + id + "." + transType);

            GlobalVariable* gvTarget = new GlobalVariable(
                *module, targetStr->getType(), true,
                GlobalValue::PrivateLinkage, targetStr, "trans.target." + id + "." + transType);

            Constant* gepType = ConstantExpr::getInBoundsGetElementPtr(
                gvType->getValueType(),
                gvType,
                ArrayRef<Constant*>({
                    ConstantInt::get(Type::getInt32Ty(context), 0),
                    ConstantInt::get(Type::getInt32Ty(context), 0)
                })
            );

            Constant* gepTarget = ConstantExpr::getInBoundsGetElementPtr(
                gvTarget->getValueType(),
                gvTarget,
                ArrayRef<Constant*>({
                    ConstantInt::get(Type::getInt32Ty(context), 0),
                    ConstantInt::get(Type::getInt32Ty(context), 0)
                })
            );

            transitions.push_back(ConstantStruct::get(transitionType, {gepType, gepTarget}));
        }

        // Create transitions array constant
        ArrayType* transitionsArrayType = ArrayType::get(transitionType, transitions.size());
        Constant* transitionsArrayInit = ConstantArray::get(transitionsArrayType, transitions);

        GlobalVariable* transitionsArrayGV = new GlobalVariable(
            *module, transitionsArrayType, true,
            GlobalValue::PrivateLinkage, transitionsArrayInit, "transitions.array." + id);

        Constant* gepTransitions = ConstantExpr::getInBoundsGetElementPtr(
            transitionsArrayType,
            transitionsArrayGV,
            ArrayRef<Constant*>({
                ConstantInt::get(Type::getInt32Ty(context), 0),
                ConstantInt::get(Type::getInt32Ty(context), 0)
            })
        );

        nodes.push_back(ConstantStruct::get(nodeType, {
            gepId,
            gepVerdict,
            gepCondition,
            ConstantInt::get(Type::getInt1Ty(context), node.isTerminal),
            gepTransitions,
            ConstantInt::get(Type::getInt32Ty(context), node.transitions.size())
        }));
    }

    ArrayType* arrayType = ArrayType::get(nodeType, nodes.size());
    Constant* arrayInit = ConstantArray::get(arrayType, nodes);

    GlobalVariable* automatonArray = new GlobalVariable(
        *module, arrayType, true,
        GlobalValue::InternalLinkage, arrayInit, "automatonArray");

    // Return pointer to the array
    return ConstantExpr::getInBoundsGetElementPtr(
        arrayType,
        automatonArray,
        ArrayRef<Constant*>({
            ConstantInt::get(Type::getInt32Ty(context), 0),
            ConstantInt::get(Type::getInt32Ty(context), 0)
        })
    );
}

void createAutomatonInitializer(Module* module, Value* automatonArray, const std::string& initialNodeId, size_t automatonSize, const std::string& policy) {
    LLVMContext& context = module->getContext();

    // Get init function
    FunctionType* initType = FunctionType::get(
        Type::getVoidTy(context),
        {PointerType::getUnqual(context), Type::getInt32Ty(context), PointerType::getUnqual(context)},
        false);

    FunctionCallee initFunc = module->getOrInsertFunction("initAutomaton", initType);

    // Get setMonitorPolicy function
    FunctionType* setPolicyType = FunctionType::get(
        Type::getVoidTy(context),
        {PointerType::getUnqual(context)},
        false);

    FunctionCallee setPolicyFunc = module->getOrInsertFunction("setMonitorPolicy", setPolicyType);

    // Create global constructor
    FunctionType* ctorType = FunctionType::get(Type::getVoidTy(context), false);
    Function* ctor = Function::Create(
        ctorType, GlobalValue::InternalLinkage,
        "automaton.init", module);

    BasicBlock* block = BasicBlock::Create(context, "entry", ctor);
    IRBuilder<> Builder(block);

    // Set the monitor policy first
    Builder.CreateCall(setPolicyFunc, {
        Builder.CreateGlobalStringPtr(policy)
    });

    // Pass automaton size and initial node ID
    Builder.CreateCall(initFunc, {
        Builder.CreateBitCast(automatonArray, PointerType::getUnqual(context)),
        ConstantInt::get(Type::getInt32Ty(context), automatonSize),
        Builder.CreateGlobalStringPtr(initialNodeId)
    });

    // Add terminator instruction
    Builder.CreateRetVoid();

    // Add to global constructors
    appendToGlobalCtors(*module, ctor, 0);
}

// Modify the run method to handle PHI nodes correctly
PreservedAnalyses MimicryInstrumentPass::run(Function &F, FunctionAnalysisManager &FAM) {
  if (F.getInstructionCount() == 0 || F.isDeclaration()) return PreservedAnalyses::all();
  if (!F.getName().contains("main") || F.getName().contains("monitor") || F.getName().contains("automaton"))
    return PreservedAnalyses::all();

  Module *module = F.getParent();
  LLVMContext &context = F.getContext();

  FunctionCallee monitorFunc = module->getOrInsertFunction(
    "monitorAction",
    Type::getVoidTy(context),
    PointerType::getUnqual(context)
  );

  if (!automatonParsed) {
    if (!parseAutomatonFromDotFile(DotFile)) {
      errs() << "Failed to parse automaton, instrumentation aborted\n";
      return PreservedAnalyses::all();
    }
    Value* automatonArray = createAutomatonArray(module, automaton);
    createAutomatonInitializer(module, automatonArray, initialNodeId, automaton.size(), MonitorPolicy);
    automatonParsed = true;
  }

  bool modified = false;
  static int globalCounter = 0;

  for (auto &BB : llvm::make_early_inc_range(F)) {
    Instruction *TI = BB.getTerminator();
    if (!TI || TI->getNumSuccessors() < 2) continue; // Only conditional branches/switches

    modified = true;

    // Insert monitorAction("cond") before the branch/switch
    IRBuilder<> PreBuilder(TI);
    Value *condStr = createGlobalStringPtr(module, "cond", ++globalCounter);
    PreBuilder.CreateCall(monitorFunc, {condStr});

    if (auto *BI = dyn_cast<BranchInst>(TI)) {
      SmallVector<BasicBlock *, 2> trampolines;
      SmallVector<BasicBlock *, 2> successors;

      // Store the original successors
      for (unsigned i = 0; i < BI->getNumSuccessors(); ++i) {
        successors.push_back(BI->getSuccessor(i));
      }

      // Create trampolines
      for (unsigned i = 0; i < BI->getNumSuccessors(); ++i) {
        BasicBlock *succ = BI->getSuccessor(i);
        std::string transType = (i == 0) ? "then" : "else";

        BasicBlock *trampoline = BasicBlock::Create(context, "monedge." + transType, &F);
        IRBuilder<> TB(trampoline);
        Value *str = createGlobalStringPtr(module, transType, ++globalCounter);
        TB.CreateCall(monitorFunc, {str});
        TB.CreateBr(succ);

        trampolines.push_back(trampoline);
      }

      // Create the new branch instruction
      IRBuilder<> Builder(TI);
      if (BI->isConditional())
        Builder.CreateCondBr(BI->getCondition(), trampolines[0], trampolines[1]);
      else
        Builder.CreateBr(trampolines[0]);

      // Update PHI nodes in the successors
      for (unsigned i = 0; i < successors.size(); ++i) {
        BasicBlock *succ = successors[i];
        BasicBlock *trampoline = trampolines[i];

        // Update PHI nodes to use the trampoline instead of BB
        for (PHINode &PHI : succ->phis()) {
          int blockIdx = PHI.getBasicBlockIndex(&BB);
          if (blockIdx != -1) {
            Value *incomingValue = PHI.getIncomingValue(blockIdx);
            PHI.setIncomingBlock(blockIdx, trampoline);
          }
        }
      }

      TI->eraseFromParent();

    } else if (auto *SI = dyn_cast<SwitchInst>(TI)) {
      std::map<BasicBlock *, std::string> labels;
      std::map<BasicBlock *, BasicBlock *> trampMap;

      // Record all case successors and their labels
      for (auto Case : SI->cases()) {
        int64_t val = Case.getCaseValue()->getSExtValue();
        BasicBlock *succ = Case.getCaseSuccessor();
        labels[succ] = "case_" + std::to_string(val);
      }
      labels[SI->getDefaultDest()] = "default";

      // Create trampolines for each successor
      for (auto &[succ, label] : labels) {
        BasicBlock *trampoline = BasicBlock::Create(context, "monedge." + label, &F);
        IRBuilder<> TB(trampoline);
        Value *str = createGlobalStringPtr(module, label, ++globalCounter);
        TB.CreateCall(monitorFunc, {str});
        TB.CreateBr(succ);
        trampMap[succ] = trampoline;

        // Update PHI nodes in the successor
        for (PHINode &PHI : succ->phis()) {
          int blockIdx = PHI.getBasicBlockIndex(&BB);
          if (blockIdx != -1) {
            Value *incomingValue = PHI.getIncomingValue(blockIdx);
            PHI.setIncomingBlock(blockIdx, trampoline);
          }
        }
      }

      // Create new switch instruction pointing to trampolines
      SwitchInst *newSI = SwitchInst::Create(SI->getCondition(), trampMap[SI->getDefaultDest()], labels.size(), TI);
      for (auto Case : SI->cases()) {
        BasicBlock *target = Case.getCaseSuccessor();
        ConstantInt *val = Case.getCaseValue();
        newSI->addCase(val, trampMap[target]);
      }

      TI->eraseFromParent();
    }
  }

  return modified ? PreservedAnalyses::none() : PreservedAnalyses::all();
}


extern "C" ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "MimicryMonitor", "v0.1",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name, FunctionPassManager &FPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (Name == "mimicry-instrument") {
            FPM.addPass(MimicryInstrumentPass());
            return true;
          }
          if (Name == "defuse") {
            FPM.addPass(FeliDU());
            return true;
          }
          return false;
        });
    }
  };
}