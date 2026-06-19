package org.mimicry;
import java.io.IOException;
import java.util.*;

public class DataFlowTrackingAutomata extends Automata{
    private String type;
    private final String variable;
    private final LabeledCFG cfg;
    private final Node validState = new Node(0, "valid");
    private final Node invalidState = new Node(1, "invalid");

    // Constructor
    public DataFlowTrackingAutomata(LabeledCFG labeledCFG, String variableName, String type) throws IOException {
        // Add nodes (states)
        nodes.add(validState);
        nodes.add(invalidState);

        // Set attrs
        setType(type);
        variable = variableName;
        cfg = labeledCFG;

        // Add edges to the DFTA, new IDs because edges may appear twice
        addEdges();

        // Get alphabet
        getAlphabet();

        // Render
        generateRender("DFTA", "llvmBasedResults/" + type + "_DFTA_" + variable);
    }

    // Add edges that change valid state
    private void addEdges() {
        Set<Edge> edgeMap = cfg.getEdges();
        // For each edge in the map that operates on the shared variable:
        for (Edge edge : edgeMap) {
            for (String var : edge.getedgeVariables()) {
                if (var.equals(variable)) {
                    // Check and handle each case
                    if (edge.getEdgeActions().get(var).contains("Read") && edge.getEdgeActions().get(var).contains("Write")) {
                        // Paired Write and Read
                        handleRW(edge);
                    }
                    else if (edge.getEdgeActions().get(var).contains("Read")) {
                            handleRead(edge);
                    }
                    else if (edge.getEdgeActions().get(var).contains("Write")) {
                        if (edge.isSigmaPaired()) {
                            handlePairedWrite(edge);
                        } else {
                            handleUnpairedWrite(edge);
                        }
                    }
                }
            }
        }
    }

    private void handleRW(Edge edge) {
        if (edge.isSigmaPaired()) {
            handleRead(edge);
        } else {
            edges.add(new Edge(validState, invalidState, edge));
        }

    }

    // Case "Paired Write"
    private void handlePairedWrite(Edge edge) {
        edges.add(new Edge(validState, validState, edge));
        edges.add(new Edge(invalidState, validState, edge));
    }

    // Case "Unpaired Write"
    private void handleUnpairedWrite(Edge edge) {
        edges.add(new Edge(validState, invalidState, edge));
        edges.add(new Edge(invalidState, invalidState, edge));
    }

    // Case "Read"
    private void handleRead(Edge edge) {
        edges.add(new Edge(validState, validState, edge));
    }

    // Set type of DFTA
    private void setType(String cfgType) {
        if (cfgType.equals("OP") || cfgType.equals("PUA") || cfgType.equals("Verdict")) {
            type = cfgType;
        } else {
            throw new IllegalArgumentException("Invalid CFG type");
        }
    }

}
