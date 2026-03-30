package org.example;

public class MonitorTool {
    static Automata mimicryMonitor = null;
    String filePath;
    static String prefixVerdict;
    static String verdict;
    static Node currentNode;


    public MonitorTool(Automata monitor, String pathPUA) {
        mimicryMonitor = monitor;
        this.filePath = pathPUA;
        for (Node node : mimicryMonitor.getNodes()) {
            if (node.getNodeId() == 0) {
                currentNode = node;
                break;
            }
        }
    }

    public void updateBranch(String branchLabel) {
        boolean found = false;
        for (Edge branch : mimicryMonitor.getEdges()) {
            if (branch.getEdgeLabel().equals(branchLabel)) {
                found = true;
                currentNode = branch.getEdgeTarget();
                break;
            }
        }

        if (!found) {
            System.err.println("Error: Edge not found");
            return;
        }

        prefixVerdict = currentNode.getPrefixVerdict();
        verdict = currentNode.getVerdict();
    }

    protected String getVerdict() {
        return verdict;
    }

    protected String getPrefixVerdict() {
        return prefixVerdict;
    }

}