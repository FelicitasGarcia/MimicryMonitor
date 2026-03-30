package org.example;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.*;

public class LabeledCFG extends Automata {
    private String type;
    private ArrayList<String> sharedVariables = new ArrayList<>();

    // Constructor for OP and PUA
    public LabeledCFG(Automata parsedDot, String variableDataPath, Map<Integer, Integer> sigmaPairs, String cfgType) throws IOException {
        // Get edges and nodes from DOT Parser
        super(parsedDot.getNodes(), parsedDot.getEdges());

        // Set type accordingly
        setType(cfgType);

        // Check relevant attributes for each edge (Write or Read of shared vars)
        edgeSharedVariablesAnalysis(variableDataPath);

        // Check if edges are sigma paired
        edgeSigmaPairingAnalysis(sigmaPairs);

        // Check Condition or branch status
        edgeConditionCheck();

        // Determine shared variables
        sharedVariables = identifySharedVariables();
        // sharedVariables.add("monitored_pid");

        // Labeling edges according paper criteria 1.
        edgeLabeling();

        // Render
        generateRender("CFG", "llvmBasedResults/" + cfgType + "_CFG");

    }

    // In the OP and PUA cfgs, conditions and branches fill the criteria:
    // - Branches have source nodes with multiple children
    // - Conditions have target nodes with multiple children
    // We label them now as conditions or not, because later in the process a node may have multiple children for other reasons (Composition)
    // And a check of children number may not be accurate
    private void edgeConditionCheck() {
        for (Edge edge: edges) {
            if (isCondition(edge) || isBranch(edge)) {
                edge.setEdgeConditionOrBranch(true);
            }
        }
    }


    // Check relevant attributes for each edge, and tag edges accordingly:
    //  - Write/Read
    //  - Variable (variable written)
    private void edgeSharedVariablesAnalysis(String VariableDataPath) {
        // Read Shared Variable Use Info ile
        try (BufferedReader br = new BufferedReader(new FileReader(VariableDataPath))) {
            String line;

            // Read lines
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (!line.startsWith("(")) continue;
                line = line.substring(1, line.length() - 1);

                // Read tuple data (EDGE ID, VARIABLE, ACTION) and find edge
                String[] parts = line.split(",\\s*");
                if (parts.length == 3) {
                    try {
                        // Check if data is in valid format
                        int number = Integer.parseInt(parts[0]);
                        String variable = parts[1];
                        String action = parts[2];
                        List<Edge> matchedEdges= this.getEdgesById(number, edges);
                        for (Edge edge : matchedEdges) {
                            if ((edge == null) || (!(action.equals("Write")) && !(action.equals("Read")))) {
                                System.err.println("Invalid action format in line: " + line + " or edge number not found");
                            } else {
                                // Modify edges, adding use data to eedge
                                edge.addEdgeVariableAndAction(variable, action);
                                // Add variable to list of shared variables
//                                if (!sharedVariables.contains(variable)) {
//                                sharedVariables.add(variable);
//                            }
                            }
                        }
                    } catch (NumberFormatException e) {
                        System.err.println("Invalid tuple format in line: " + line);
                    }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // Set sigmaPaired attribute to true in paired edges
    private void edgeSigmaPairingAnalysis(Map<Integer, Integer> sigmaPairs) {
        if (type.equals("OP")) {
            for (int opIndex : sigmaPairs.keySet()) {
                List<Edge> opEdge = this.getEdgesById(opIndex, edges);
                // If there are multiple edges with the same ID, set all of them as sigma paired
                for (Edge edge : opEdge) {
                    edge.setSigmaPaired(true);
                }
            }
        } else if (type.equals("PUA")) {
            for (int opIndex : sigmaPairs.keySet()) {
                Integer puaIndex = sigmaPairs.get(opIndex);
                List<Edge> puaEdge = this.getEdgesById(puaIndex, edges);
                // If there are multiple edges with the same ID, set all of them as sigma paired
                for (Edge edge : puaEdge) {
                    edge.setSigmaPaired(true);
                }
            }
        }
    }

    // Label edges according to paper criteria 1
    private void edgeLabeling() {
        int unlabelledIDs = 0;
        for (Edge edge : edges) {
            // Edges that remain unlabelled: Edges that do not correspond to a sigma paired instruction &&
            // don't Write Shared Variables &&
            // are not PUA conditions
            if (!edge.isSigmaPaired()) {
                if ((type.equals("PUA") && edge.isConditionOrBranch()) || edge.getEdgeLabel().equals("Exit")) {
                    edge.setUnlabelled(false);
                } else {
                    edge.setUnlabelled(true);
                    edge.setEdgeLabel(type + unlabelledIDs++);
                    for (String variable : edge.getedgeVariables()) {
                        if (edge.getEdgeActions().get(variable).contains("Write")) {
                            if (sharedVariables.contains(variable)) {
                                if (edge.isUnlabelled()) {
                                    edge.setEdgeLabel(unlabelledIDs++ + ": " + variable + " ! " + type);
                                } else {
                                    edge.setEdgeLabel(variable + " , " + edge.getEdgeLabel());
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Get attributes

    public ArrayList<String> getSharedVariables() {
        return sharedVariables;
    }

    public String getType() {
        return type;
    }

    public Node getStartNode() {
        for (Node node : this.getNodes()) {
            if (node.getParents().isEmpty()) {
                return node;
            }
        }
        return null;
    }

    // Set type of CFG
    private void setType(String cfgType) {
        if (cfgType.equals("OP") || cfgType.equals("PUA") || cfgType.equals("Verdict")) {
            type = cfgType;
        } else {
            throw new IllegalArgumentException("Invalid CFG type");
        }
    }

    // Add and Remove operations

    public void removeEdge (Edge edge) {
        if (this.getEdges().contains(edge)) {
            this.getEdges().remove (edge);
        }
    }

    // Check if the edge is a Branch
    public boolean isBranch(Edge edge) {
        // If the source has multiple children, then the edge is a branch (THEN / ELSE)
        return edge.getEdgeSource().getChildren().size() > 1;
    }

    // Check if the edge is a Condition
    public boolean isCondition(Edge edge) {
        // If the target node of a transition has more than one child, then it is a condition (IF xxx)
        return edge.getEdgeTarget().getChildren().size() > 1;
    }

    // Auxiliary
    public String toString(String number, String variable, String action) {
        return "(" + number + ", " + variable + ", " + action + ")";
    }

    public ArrayList<String> identifySharedVariables() {
        Set<String> writtenOutsideSigma = new HashSet<>();
        Set<String> readInsideSigma = new HashSet<>();

        for (Edge edge : this.getEdges()) {
            Map<String, Set<String>> varActions = edge.getEdgeActions();

            for (Map.Entry<String, Set<String>> entry : varActions.entrySet()) {
                String variable = entry.getKey();
                Set<String> actions = entry.getValue();

                if (!edge.isSigmaPaired() && actions.contains("Write")) {
                    writtenOutsideSigma.add(variable);
                }

                if (edge.isSigmaPaired() && actions.contains("Read")) {
                    readInsideSigma.add(variable);
                }
            }
        }


        ArrayList<String> sharedVars = new ArrayList<>(writtenOutsideSigma);
        sharedVars.retainAll(readInsideSigma);

        return sharedVars;
    }

}

