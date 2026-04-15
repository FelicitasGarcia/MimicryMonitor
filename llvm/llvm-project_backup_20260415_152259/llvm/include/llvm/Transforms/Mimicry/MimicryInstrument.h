#ifndef LLVM_TRANSFORMS_UTILS_MIMICRYINSTRUMENT_H
#define LLVM_TRANSFORMS_UTILS_MIMICRYINSTRUMENT_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include <string>
#include <map>

namespace llvm {

// Structure to represent a node in the automaton
struct AutomatonNode {
  std::string id;                             // Node identifier
  std::string verdict; 
  std::string conditionName;                       // Node verdict (e.g. "VP, V", "IVP, IV")
  bool isTerminal;                            // Whether this is a terminal state
  std::map<std::string, std::string> transitions;  // Maps transition type to target node ID
};

// The main pass for instrumenting LLVM IR with automaton mimicry logic
class MimicryInstrumentPass : public PassInfoMixin<MimicryInstrumentPass> {
public:
  std::string currentFuncName;
  std::map<std::string, AutomatonNode> automaton;
  std::string initialNodeId;
  GlobalVariable* currentStateGV = nullptr;

  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);

  // Helper to create global string constants
  Value *createGlobalStringPtr(Module *module, const std::string &str, int uniqueId);
  
  // Parse the automaton from a dot file
  bool parseAutomatonFromDotFile(const std::string &filename);

  // Create global variables for the automaton state
  void createAutomatonGlobals(Module *module);
  
};

} // end namespace llvm

#endif // LLVM_TRANSFORMS_UTILS_MIMICRYINSTRUMENT_H