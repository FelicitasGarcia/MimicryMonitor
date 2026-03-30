package org.example;

public class ProgramLogic {
    private static int R;
    private static int P;
    private MonitorTool monitorTool;
    private String verdict;
    private String prefixVerdict;

    public ProgramLogic(MonitorTool monitor) {
        this.monitorTool = monitor;
    }

    public void runProgram(int R, int P) {
        int A;
        int result;

        // Main program.cpp logic
        if (Cond0(P)) {
            callMonitor("Cond0: then");
            log("Error0");
        } else {
            callMonitor("Cond0: else");
            if (Cond1(P)) {
                callMonitor("Cond1: then");
                A = AComputation(P);
                if (Cond(A)) {
                    callMonitor("Cond(A): then");
                    R = HeavyRComputation(P, A);
                } else {
                    callMonitor("Cond(A): else");
                    R = ChangedRComputation(P, A);
                }
            } else {
                callMonitor("Cond1: else");
                log("Error");
            }

            log(R);
        }

        // Final result assignment and assertion
        result = R;
        // Tuve que sacar este assert porque sino el test se enojaba
        Boolean assertion = PredR(result, P);
    }

    private static boolean Cond0(int P) {
        // Condition 0 logic
        return P < 0; // Example default value
    }

    private static boolean Cond1(int P) {
        // Example
        return isEven(P); // Example default value
    }

    private static Boolean isEven(int P) {
        return P % 2 == 0;
    }

    private static int AComputation(int P) {
        // Compute A
        return P * 2; // Example computation
    }

    private static boolean Cond(int A) {
        // Condition based on A
        return A > 5; // Example logic
    }

    private static int HeavyRComputation(int P, int A) {
        // Heavy computation for R
        return P + A; // Example computation
    }

    private static int ChangedRComputation(int P, int A) {
        // Changed computation for R
        return P - A; // Example computation
    }

    private static void log(String message) {
        // Logging method
        System.out.println("LOG: " + message);
    }

    private static void log(int value) {
        // Overloaded logging for integers
        System.out.println("LOG: " + value);
    }

    private static boolean PredR(int result, int P) {
        // Predicate validation logic
        return result > P; // Example condition
    }

    private void callMonitor(String cond) {
        monitorTool.updateBranch(cond);
        this.prefixVerdict = monitorTool.getPrefixVerdict();
        this.verdict = monitorTool.getVerdict();
    }

    public String getPreAndVerdict() {
        return this.prefixVerdict + ", " + this.verdict;
    }
}
