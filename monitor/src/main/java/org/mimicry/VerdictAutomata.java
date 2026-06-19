package org.mimicry;

import java.io.IOException;
import java.util.*;

public class VerdictAutomata extends Automata {

    public VerdictAutomata(Set<Node> inputNodes, Set<Edge> inputEdges) {
        super(inputNodes, inputEdges);
    }
    public VerdictAutomata(CompositionAutomata composedAut) throws IOException {
        super(composedAut.getNodes(), composedAut.getEdges());

        // Label nodes with initial verdicts
        labelWithVerdicts();
        System.out.println("Verdicts Labeled");
        generateRender("Verdicts_Labeled", "llvmBasedResults/Verdicts_Labeled");

        // Propagate those verdicts
        verdictPropagation();
        System.out.println("Verdicts Propagated");
        generateRender("Verdicts_Propagated", "llvmBasedResults/Verdicts_Propagated");

        // Prune the automata
        Node initalNode = findInitialNode();
        prune(initalNode);

        // Compact
        Set<Node> propagatedNodes = Set.copyOf(nodes);
        Set<Edge> propagatedEdges = Set.copyOf(edges);
        compactFinalStates(propagatedNodes, propagatedEdges);
        System.out.println("Verdicts Compacted");
        generateRender("Verdicts_Compacted", "llvmBasedResults/Verdicts_Compacted");

    }


    private void verdictPropagation() {
        IVPropagation();
        VPropagation();
    }

    protected void IVPropagation() {
        Set<Node> visited = new HashSet<>();
        // Find first IV node
        for (Node node : this.nodes) {
            if (node.getVerdict().equals("IV")) {
                // Call recursive function for LFP
                IVPropagationRecursive(node, visited);
            }
        }
    }

    private void IVPropagationRecursive(Node node, Set<Node> visited) {
        if (visited.contains(node)) {
            return;
        }
        visited.add(node);
        for (Node parent : node.getParents()) {
            if (allChildrenIV(parent) || ivReachableByUnlabelled(parent)) {
                // If all children are IV, then parent is IV, call recursion
                parent.setPrefixVerdict("");
                parent.setVerdict("IV");
                IVPropagationRecursive(parent, visited);
            }
        }
    }


    private boolean ivReachableByUnlabelled(Node parent) {
        for (Node child : parent.getChildren()) {
            for (Edge edge : edges) {
                if (edge.getEdgeSource().equals(parent) && edge.getEdgeTarget().equals(child)) {
                    if (edge.isUnlabelled()) {
                        if (!(child.getVerdict().isEmpty()) && child.getVerdict().equals("IV")) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    private boolean allChildrenIV(Node parent) {
        for (Node child : parent.getChildren()) {
            if ((child.getVerdict().isEmpty() ) || (!child.getVerdict().equals("IV"))) {
                return false;
            }
        }
        return true;
    }

    private void VPropagation() {
        List<Node> nonIV = new ArrayList<>();
        // Find all nonIV nodes
        for (Node node : nodes) {
            if (node.getVerdict().isEmpty() || node.getVerdict().equals("V")) {
                nonIV.add(node);
            }
        }
        // Call recursive function
        VPropagationRecursive(nonIV);
    }

    private void VPropagationRecursive(List<Node> nonIV) {
        List<Node> nonIVCopy = new ArrayList<>(nonIV);
        // Create next iteration of nonIV nodes by removing nodes with children not in nonIV
        for (Node node : nonIV) {
            for (Node nChild : node.getChildren()) {
                if (!nonIV.contains(nChild)) {
                    nonIVCopy.remove(node);
                }
            }
        }

        // If GFP has not yet been reached, call recursive function
        if (!nonIV.equals(nonIVCopy)) {
            VPropagationRecursive(nonIVCopy);
        } else {
            // If GFP has been reached, label all remaining nodes in nonIV as V
            for (Node vNode : nonIV) {
                vNode.setVerdict("V");
            }
        }
    }

    private void labelWithVerdicts() {
        for (Node node : nodes) {
            // Use labelling criteria to determine inital markings
            if (!node.getChildren().isEmpty()) {
                node.setVerdict("");
                node.setPrefixVerdict("NV");
            } else {
                // if (!(node.isConsistentNode() && node.isCompExit())) {
                if (!node.isCompExit()) {
                    node.setPrefixVerdict("IVP");
                    node.setVerdict("IV");
                } else {
                    node.setVerdict("V");
                    node.setPrefixVerdict("");
                }
            }
        }
    }

    private Node findInitialNode() {
        for (Node node : nodes) {
            if (node.getParents().isEmpty()) {
                return node;
            }
        }
        return null;
    }
}