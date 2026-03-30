package org.example;

import java.io.IOException;
import java.util.*;

public class Automata {
    protected Set<Node> nodes = new HashSet<>();
    protected Set<Edge> edges = new HashSet<>();
    protected Map<String, Edge> alphabet = new HashMap<>();
    protected static boolean ivPresent = false;
    protected static boolean vPresent = false;

    // Empty Constructor
    public Automata() { }

    // Constructor
    public Automata(Set<Node> nodes, Set<Edge> edges) {
        this.nodes = nodes;
        this.edges = edges;
        getAlphabet();
    }

    // Get methods
    Set<Node> getNodes() {
        return nodes;
    }

    Set<Edge> getEdges() {
        return edges;
    }

    Map<String, Edge> getAlphabet() {
        // Rechecks alphabet because some labels may have changed
        alphabet.clear();
        for (Edge edge : edges) {
            alphabet.put(edge.getEdgeLabel(), edge);
        }

        return alphabet;
    }

    // Get Methods By ID
    public int getNextState(int state, String label) {
        for (Edge edge : this.edges) {
            if (edge.getEdgeSource().getNodeId().equals(state) && edge.getEdgeLabel().equals(label)) {
                return edge.getEdgeTarget().getNodeId();
            }
        }
        if (getAlphabet().containsKey(label)) {
            return -1;
        } else {
            return -2;
        }
    }

    public static Node getNodeById(Integer nodeId, Set<Node> nodeSet) {
        for (Node node : nodeSet) {
            if (node.getNodeId().equals(nodeId)) {
                return node;
            }
        }
        return null;
    }

    public List<Edge> getEdgesById(int edgeId, Set<Edge> edgeSet) {
        ArrayList<Edge> edges = new ArrayList<>();
        for (Edge edge : edgeSet) {
            if (edge.getEdgeId() == edgeId) {
                edges.add(edge);
            }
        }
        return edges;
    }

    public static Node getNodeByLLVMId(String llvmID, Collection<Node> nodes) {
        for (Node node : nodes) {
            if ((node.llvmId.trim()).equals(llvmID)) {
                return node;
            }
        }
        return null;
    }

    // Renderer
    protected void generateRender(String graphName, String destination) throws IOException {
        DOTExporter dotExporter = new DOTExporter(graphName, this.nodes, this.edges, destination);
        dotExporter.render();
    }

    // Compactation Methods
    protected void prune(Node initialNode) {
        if (initialNode == null) return;

        Set<Node> reachableNodes = new HashSet<>();
        Set<Edge> reachableEdges = new HashSet<>();
        Stack<Node> stack = new Stack<>();

        stack.push(initialNode);
        while (!stack.isEmpty()) {
            Node current = stack.pop();

            if (reachableNodes.contains(current)) continue;
            reachableNodes.add(current);

            if (current.getVerdict().equals("V") || current.getVerdict().equals("IV")) {
                continue;
            }

            for (Edge edge : edges) {
                if (edge.getEdgeSource().equals(current)) {
                    Node target = edge.getEdgeTarget();
                    reachableEdges.add(edge);
                    stack.push(target);
                }
            }
        }

        nodes = reachableNodes;
        edges = reachableEdges;
    }

    public static void checkVandIvPresent(Set<Node> states) {
        for (Node node : states) {
            if (node.getVerdict().equals("IV")) {
                ivPresent = true;
            } else if (node.getVerdict().equals("V")) {
                vPresent = true;
            }
        }
    }

    protected void compactFinalStates(Set<Node> ogNodes, Set<Edge> ogEdges) {
        // Create V/IV Compact Nodes
        nodes.clear();
        edges.clear();
        checkVandIvPresent(ogNodes);
        HashMap<Integer, Node> nodeMap = new HashMap<>();
        Node vNode = new Node(-2, "", "V");
        Node ivNode = new Node(-1, "", "IV");
        if (vPresent) {
            nodes.add(vNode);
            nodeMap.put(-2, vNode);
        }
        if (ivPresent) {
            nodes.add(ivNode);
            nodeMap.put(-1, ivNode);
        }


        // Add nonIV and nonV nodes
        for (Node node : ogNodes) {
            if (node.getVerdict().isEmpty()) {
                Node compactNode = new Node(node.getNodeId(), node.getPrefixVerdict(), "");
                nodes.add(compactNode);
                nodeMap.put(node.getNodeId(), compactNode);
            } else {
                if (node.getVerdict().equals("V")) {
                    nodeMap.put(node.getNodeId(), vNode);
                } else if (node.getVerdict().equals("IV")) {
                    nodeMap.put(node.getNodeId(), ivNode);
                }
            }
        }

        for (Edge edge : ogEdges) {
            Node source = edge.getEdgeSource();
            Node target = edge.getEdgeTarget();
            Node compactSource = nodeMap.get(source.getNodeId());
            Node compactTarget = nodeMap.get(target.getNodeId());
            if (compactSource != compactTarget) {
                edges.add(new Edge(compactSource, compactTarget, edge));
                compactSource.addChild(compactTarget);
                compactTarget.addParent(compactSource);
            }
        }
    }
}
