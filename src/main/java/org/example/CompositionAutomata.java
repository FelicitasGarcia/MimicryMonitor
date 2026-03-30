package org.example;

import java.io.IOException;
import java.util.*;

public class CompositionAutomata extends Automata {
    private final LabeledCFG op;
    private final LabeledCFG pua;
    private final Map<String, DataFlowTrackingAutomata> OPdftas;
    private final Map<String, DataFlowTrackingAutomata> PUAdftas;

    Queue<Node> pending = new LinkedList<>();

    int id = 0;

    // Constructor
    public CompositionAutomata(LabeledCFG op, LabeledCFG pua, Map<String, DataFlowTrackingAutomata> opDFTAs, Map<String, DataFlowTrackingAutomata> puaDFTAs) throws IOException {
        // Define class automata
        this.op = op;
        this.pua = pua;
        this.OPdftas = opDFTAs;
        this.PUAdftas = puaDFTAs;

        this.alphabet = joinAlphabets();

        // Initial state
        generateInitialState();

        // Explore states
        exploreStates();

        // Render
        generateRender("Composition", "llvmBasedResults/Composition");

    }

    private void generateInitialState() {
        // Find OP and PUA start Nodes
        Node opInitialNode = op.getStartNode();
        Node puaInitialNode = pua.getStartNode();

        // Create initial state var consistencies
        Map<String, int[]> variableConsistencies = new HashMap<>();
        for (String variable : op.getSharedVariables()) {
            variableConsistencies.put(variable, new int[]{0, 0});
        }

        // Create Composed Node and add to pending and states
        Node initialState = new Node(id, opInitialNode.getNodeId(), puaInitialNode.getNodeId(), variableConsistencies);
        nodes.add(initialState);
        id++;
        pending.add(initialState);
    }

    private void exploreStates() {
        while (!pending.isEmpty()) {
            Node current = pending.poll();
            
            for (String label : alphabet.keySet()) {
                // If transition is valid create new state
                int currentOpId = current.getOPNodeId();
                int currentPUAId = current.getPUANodeId();
                int newOpId = getPartOfNextState(op, currentOpId, label);
                int newPUAId = getPartOfNextState(pua, currentPUAId, label);
                if (currentOpId != newOpId || currentPUAId != newPUAId) {
                    Map<String, int[]> variableConsistencies = new HashMap<>();
                    for (String variable : op.getSharedVariables()) {

                        DataFlowTrackingAutomata opDFTA = OPdftas.get(variable);
                        DataFlowTrackingAutomata puaDFTA = PUAdftas.get(variable);

                        int newVarConsistencyOP = getPartOfNextState(opDFTA, current.getVarConsistency(variable, "OP"), label);
                        int newVarConsistencyPUA = getPartOfNextState(puaDFTA, current.getVarConsistency(variable, "PUA"), label);
                        variableConsistencies.put(variable, new int[]{newVarConsistencyOP, newVarConsistencyPUA});
                    }

                    // Create or retrieve comoposed State
                    createOrRetrieveState(newOpId, newPUAId, variableConsistencies, label, current);
                }
            }
        }
    }

    private void createOrRetrieveState(int newOpId, int newPUAId, Map<String,int[]> variableConsistencies, String label, Node current) {
        Node newState = new Node(id++, newOpId, newPUAId, variableConsistencies);
        // Check if the new state is valid (i.e. the transition is synchronised if shared)
        if (allValid(newState)) {
            Node existingState = containsState(newState);
            // Retrieve state, if existing, else create it and add to pending
            if (!(existingState == null)) {
                 newState = existingState;
                 id--;
            } else {
                checkFinal(newState);
                nodes.add(newState);
                pending.add(newState);
            }
            // Add child and parent realtionships
            newState.addParent(current);
            current.addChild(newState);
            // Add transition
            // Because of working with labels, some attributes have to be set manually
            Edge newEdge = new Edge(current, newState, alphabet.get(label));
            edges.add(newEdge);
        }
    }

    private void checkFinal(Node newState) {
        Node OPNode = Automata.getNodeById(newState.getOPNodeId(), op.getNodes());
        Node PUANode = Automata.getNodeById(newState.getPUANodeId(), pua.getNodes());

        if (OPNode != null && PUANode != null) {
            if (OPNode.isFinal() && PUANode.isFinal()) {
                newState.setCompExit(true);
            }
        } else {
            throw new IllegalArgumentException("OP or PUA Node not found");
        }
    }

    // Check that transitions are synchronised
    private boolean allValid(Node newState) {
        if (newState.getOPNodeId() == -1 || newState.getPUANodeId() == -1) {
            return false;
        }
        for (String variable : op.getSharedVariables()) {
            if (newState.getVarConsistency(variable, "OP") == -1 || newState.getVarConsistency(variable, "PUA") == -1) {
                return false;
            }
        }
        return true;
    }

    private Node containsState(Node newState) {
        for (Node state : nodes) {
            if (equalStates(state, newState)) {
                return state;
            }
        }
        return null;
    }

    private boolean equalStates(Node current, Node newState) {
        return current.getOPNodeId().equals(newState.getOPNodeId()) &&
                current.getPUANodeId().equals(newState.getPUANodeId()) &&
                (equalConsistencies(current, newState));
    }

    private boolean equalConsistencies(Node newState, Node state) {
        for (String variable : op.getSharedVariables()) {
            if (newState.getVarConsistency(variable, "OP") != state.getVarConsistency(variable, "OP") ||
                    newState.getVarConsistency(variable, "PUA") != state.getVarConsistency(variable, "PUA")) {
                return false;
            }
        }
        return true;
    }

    private int getPartOfNextState(Automata automata, int currentStateId, String label) {
        int nextState = automata.getNextState(currentStateId, label);

        // Tiene transicion con esa label, pero no desde ese nodo
        if (nextState == -1 ) {
            // Si es sin etiqueta, la dejamos transicionar igual.
            // Ojo porue ahora las unlabelled son OPi o PUAj
            if (isUnlabelled(label)) {
                return currentStateId;
            } else {
                return -1;
            }
        // No tiene transición en esta label, se queda en su estado actual
        } else if (nextState == -2) {
            return currentStateId;
        // Tiene transicion en esa label, desde ese estado
        } else {
            return nextState;
        }
    }

    private boolean isUnlabelled(String label) {
        for (Edge edge : edges) {
            if (edge.getEdgeLabel().equals(label)) {
                return edge.isUnlabelled();
            }
        }
        return false;
    }

    private Map<String, Edge> joinAlphabets() {
        Map<String, Edge> alphabets = new HashMap<>();
        alphabets.putAll(op.getAlphabet());
        // PUA PREVALENCE BECAUSE OF LOCATIONS IDS
        alphabets.putAll(pua.getAlphabet());
        return alphabets;
    }

}



