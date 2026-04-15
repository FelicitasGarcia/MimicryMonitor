//===- FeliDefUseInfo.h - Custom Def Use Info Analysis -------===//

//===----------------------------------------------------------------------===//

#ifndef LLVM_ANALYSIS_FELIDEFUSEINFO_H
#define LLVM_ANALYSIS_FELIDEFUSEINFO_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class FeliDU : public PassInfoMixin<FeliDU> {
    public:
        PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
    };

}


#endif
