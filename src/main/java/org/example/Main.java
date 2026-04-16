package org.example;

import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException, InterruptedException {
        String inputFilePath = "llvm/feli";

        // Given by user
        String programPathOPC = inputFilePath + "/inputs/programOP.c"; // LLVM INPUT
        String programPathPUAC = inputFilePath + "/inputs/programPUA.c"; // LLVM INPUT
        String sigmaFilePath = inputFilePath + "/inputs/sigma.txt"; // SIGMA PAIRS

        // Check if the number of arguments is correct
        if (args.length >= 3) {
            programPathOPC = args[0];
            programPathPUAC = args[1];
            sigmaFilePath = args[2];
        } else {
            System.out.println("Using default paths");
        }

        // Pre existing Files
        String dotFilePathOP = inputFilePath + "/cfgs/mainOP.dot"; // LLVM OUTPUT
        String dotFilePathPUA = inputFilePath + "/cfgs/mainPUA.dot"; // LLVM OUTPUT

        String llvmAnalysisPathOP = inputFilePath + "/temps/defUseOP.txt"; // LLVM OUTPUT
        String llvmAnalysisPathPUA = inputFilePath + "/temps/defUsePUA.txt"; // LLVM OUTPUT

        String llvmIRPathOP = inputFilePath + "/temps/programOP.ll"; // LLVM OUTPUT
        String llvmIRPUA = inputFilePath + "/temps/programPUA.ll"; // LLVM OUTPUT

        // Files that will be created during the process
        String OPvariableDataPath = inputFilePath + "/temps/OP_defUseInfoParsed.txt";
        String PUAvariableDataPath = inputFilePath + "/temps/PUA_defUseInfoParsed.txt";

        // PUA Processing
        DOTParser llvmPUAParsed = new DOTParser(dotFilePathPUA, llvmAnalysisPathPUA, "PUA");
        LLVMProcessing transformedPUA = new LLVMProcessing(llvmPUAParsed, llvmIRPUA, programPathPUAC, "PUA");

        // OP Processing
        DOTParser llvmOPParsed = new DOTParser(dotFilePathOP, llvmAnalysisPathOP, "OP");
        LLVMProcessing transformedOP = new LLVMProcessing(llvmOPParsed, llvmIRPathOP, programPathOPC, "OP");

        // Construct monitor and run program.cpp
        Automata mimicryMonitor = new MonitorConstructor(transformedOP, transformedPUA, sigmaFilePath,
                OPvariableDataPath, PUAvariableDataPath);
        mimicryMonitor.generateRender("MM", "monitor");
    }
}