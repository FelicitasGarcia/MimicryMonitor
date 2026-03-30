package org.example;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MonitorConstructor extends Automata{

    private static final Map<Integer, Integer> sigmaPairs = new HashMap<>();

    // INPUT: Sigma File Path
    // OUTPUT: ArrayList of Sigma Pairs
    private static void parseSigma(String sigmaFilePath) {
        try (BufferedReader br = new BufferedReader(new FileReader(sigmaFilePath))) {
            String line;
            while ((line = br.readLine()) != null) { // <-- move reading here
                line = line.trim();

                // Use commas as dividers
                String[] pairStrings = line.split("\\), \\(");

                for (String pairString : pairStrings) {
                    pairString = pairString.replace("(", "").replace(")", "").trim();

                    String[] values = pairString.split(",");
                    int OPedge = Integer.parseInt(values[0].trim());
                    int PUAedge = Integer.parseInt(values[1].trim());

                    sigmaPairs.put(OPedge, PUAedge);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    // INPUT: OP, PUA and Sigma Filepaths
    // OUTPUT: MimicryMonitor Automata
    public MonitorConstructor(Automata opDot, Automata puaDot, String sigmaFilePath, String OPvariableDataPath, String PUAvariableDataPath) throws IOException {
        //Parse Sigma File into pairs
        parseSigma(sigmaFilePath);

        // Get info on shared variables

        getSharedVariables();

        // CFG Construction
        System.out.println("Constructing CFGs");
        LabeledCFG OPcfg = new LabeledCFG(opDot, OPvariableDataPath, sigmaPairs, "OP");
        LabeledCFG PUAcfg = new LabeledCFG(puaDot, PUAvariableDataPath, sigmaPairs, "PUA");


        ArrayList<String> trackedVars = new ArrayList<>();
        trackedVars = OPcfg.getSharedVariables();
        trackedVars.addAll(PUAcfg.getSharedVariables());

        // For each shared Variable (OP and PUA shared variables are the same)
        Map<String, DataFlowTrackingAutomata> OPdftas = new HashMap<>();

        Map<String, DataFlowTrackingAutomata> PUAdftas = new HashMap<>();

        System.out.println("Creating DFTAs");
        for (String variable : trackedVars) {
            // Create the DFTAs
            DataFlowTrackingAutomata opDfta = new DataFlowTrackingAutomata(OPcfg, variable, "OP");
            DataFlowTrackingAutomata puaDfta = new DataFlowTrackingAutomata(PUAcfg, variable, "PUA");
            OPdftas.put(variable, opDfta);
            PUAdftas.put(variable, puaDfta);
        }

        // Compose OP and PUA with DFTAs
        System.out.println("Composing Automata");
        CompositionAutomata composedAutomata = new CompositionAutomata(OPcfg, PUAcfg, OPdftas, PUAdftas);

        // Label and propagate verdicts
        System.out.println("Labeling and Propagating verdicts");
        VerdictAutomata verdictAutomata = new VerdictAutomata(composedAutomata);

        // Compact Automata
        System.out.println("Minimizing Automata");
        Minimizer compactAutomata = new Minimizer(verdictAutomata);

        nodes = compactAutomata.getNodes();
        edges = compactAutomata.getEdges();
    }

    private void getSharedVariables() {

    }

}
