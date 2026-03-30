{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red103\green107\blue114;\red23\green23\blue26;}
{\*\expandedcolortbl;;\csgenericrgb\c40392\c41961\c44706;\csgenericrgb\c9020\c9020\c10196;}
\paperw11900\paperh16840\margl1440\margr1440\vieww12200\viewh15420\viewkind1
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \cb3 //using namespace llvm;\
//\
//std::string retrieveAllocaVariableName(Instruction &I) \{\
//    std::string VarName = "unknown";\
//\
//    int i = 0;\
//    if (I.mayWriteToMemory()) \{\
//        i = 1;\
//    \}\
//    Value *operand = I.getOperand(i);\
//    VarName = operand->getName();\
//\
//    // If no variable name was found, print the default\
//    return VarName;\
//\}\
//\
//std::string retrieveLocation(Instruction &I, bool ReadsMemory, bool WritesMemory) \{\
//        std::string location = "NOT FOUND";\
//        if (const DebugLoc &debugLoc = I.getDebugLoc()) \{\
//            unsigned line = debugLoc.getLine();\
//            location = Twine(line).str();\
//            // StringRef file = debugLoc->getFilename();\
//            // StringRef directory = debugLoc->getDirectory();\
//            //location = (directory + "/" + file + ":" + Twine(line)).str();\
//        \}\
//    return location;\
//\}\
//\
//std::string retrieveAccesType(bool ReadsMemory, bool WritesMemory) \{\
//    std::string AccessType = " ";\
//    if (ReadsMemory && WritesMemory) \{\
//      AccessType = "RW";\
//    \} else if (WritesMemory) \{\
//      AccessType = "W";\
//    \} else if (ReadsMemory) \{\
//      AccessType = "R";\
//    \}\
//    return AccessType;\
//\}\
//\
//PreservedAnalyses FeliDU::run(Function &F, FunctionAnalysisManager &AM) \{\
//    if (F.getName() == "main") \{\
//        errs() << "Function: " << F.getName() << "\\n";\
//\
//        for (auto &BB : F) \{\
//            errs() << "\\nBasic Block: " << BB.getName() << "\\n";\
//\
//            for (auto &I : BB) \{\
//                bool ReadsMemory = I.mayReadFromMemory();\
//                bool WritesMemory = I.mayWriteToMemory();\
//\
//                if (ReadsMemory || WritesMemory) \{\
//\
//                    // Attempt to retrieve the locaation\
//                    std::string location = retrieveLocation(I, ReadsMemory, WritesMemory);\
//\
//                    // Attempt to retrieve the variable name\
//                    std::string VarName = retrieveAllocaVariableName(I);\
//\
//                    // Determine the access type\
//                    std::string AccessType = retrieveAccesType(ReadsMemory, WritesMemory);\
//\
//                    // Print the result\
//                    // errs() << VarName << ", " << AccessType << ", " << I << "\\n";\
//                    errs() <<  BB.getName() <<  "@" << location << " | Variable : "<<  VarName << " | Action: " << AccessType << " \\n";\
//                \}\
//            \}\
//        \}\
//    \}\
//    return PreservedAnalyses::all();\
//\}\
\
}