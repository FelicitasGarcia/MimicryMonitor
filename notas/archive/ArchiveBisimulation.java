package org.example;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

class ArchiveBisimulation extends Automata {
    Set<Node> minimizedStates = new HashSet<>();
    Set<Edge> minimizedEdges = new HashSet<>();
    Node initialNode;

    private static class Block {
        Set<Node> nodes;
        int id;
        String signature = "";

        Block(int id) {
            this.id = id;
            nodes = new HashSet<>();
        }

        int getId() {
            return id;
        }

        void add(Node node) {
            nodes.add(node);
        }

        Set<Node> getNodes() {
            return nodes;
        }

        public boolean contains(Node node) {
            return nodes.contains(node);
        }

        protected String getSignature() {
            return signature;
        }

        protected void setSignature(String signature) {
            this.signature = signature;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Block block = (Block) o;
            return id == block.id && nodes.equals(block.nodes);
        }

        @Override
        public int hashCode() {
            return id + 31 * nodes.hashCode();
        }

    }

    public ArchiveBisimulation(Automata Automata) throws IOException {
        super(Automata.nodes, Automata.edges);
        findInitialNode();
        hideLabels();
        minimize();

        // Render
        generateRender("Minimized_Monitor", "llvmBasedResults/Minimized_Monitor");
    }

    private void findInitialNode() {
        for (Node node : nodes) {
            if (node.getParents().isEmpty()) {
                node.setNodeId(1);
                initialNode = node;
            }
        }
    }

    private void hideLabels() {
        for (Edge edge : edges) {
            if (!edge.isConditionOrBranch() || edge.isUnlabelled()) {
                edge.setEdgeLabel("");
                edge.setUnlabelled(true);
            }
        }
    }

    public void minimize() throws IOException {
        Set<Block> partition = initializePartition();
        refine(partition);
        constructMinimizedAutomata(partition);
        edges = minimizedEdges;
        nodes = minimizedStates;
    }

    private Set<Block> initializePartition() {
        // Initialize partition grouping together nodes with the same label (same verdicts)
        Map<String, Block> groups = new HashMap<>();
        AtomicInteger blockId = new AtomicInteger();
        for (Node node : nodes) {
            groups.computeIfAbsent(node.getNodeLabel(), k -> new Block(blockId.getAndIncrement())).add(node);
        }
        return new HashSet<>(groups.values());
    }

    private void refine(Set<Block> partition) throws IOException {
        // Iterate until no more changes appear
        boolean changed;
        do {
            changed = false;
            Set<Block> newPartition = new HashSet<>();

            // For each block in the partition
            AtomicInteger newBlocksId = new AtomicInteger(2);
            for (Block block : partition) {
                Set<Node> blockNodes = block.getNodes();
                // Split states that do not go to the same blocks for each label
                Map<String, Block> splitBlocks = new HashMap<>();
                for (Node node : blockNodes) {
                    // Computes signature and add to map
                    String signature = getTransitionSignature(node, partition);
                    Block newBlock = new Block(newBlocksId.getAndIncrement());
                    newBlock.setSignature(signature);
                    splitBlocks.computeIfAbsent(signature, k -> newBlock).add(node);
                }
                newPartition.addAll(splitBlocks.values());
                if (splitBlocks.size() > 1) changed = true;
            }
            partition.clear();
            partition.addAll(newPartition);

        } while (changed);
    }


    // Computes the signature of a state based on the blocks it transitions to for each label
    private String getTransitionSignature(Node node, Set<Block> partition) {
        Map<String, Integer> signatureMap = new HashMap<>();
        computeSignatureRecursively(node, partition, signatureMap, new HashSet<>());
        String signature = generateString(signatureMap);
        return signature;
    }

    private void computeSignatureRecursively(Node node, Set<Block> partition, Map<String, Integer> signatureMap, Set<Node> visited) {
        // Avoid revisiting nodes to prevent infinite loops
        if (visited.contains(node)) {
            return;
        }
        visited.add(node);

        // Process all edges from the current node
        for (Edge edge : edges) {
            if (edge.getEdgeSource().equals(node)) {
                if (edge.isUnlabelled()) {
                    // Recursively process unlabeled transitions
                    computeSignatureRecursively(edge.getEdgeTarget(), partition, signatureMap, visited);
                } else {
                    // Process labeled transitions
                    Block targetBlock = findBlock(edge.getEdgeTarget(), partition);
                    if (targetBlock == null) {
                        System.err.println("Error: Target block not found");
                    }
                    int blockId = targetBlock.getId();
                    signatureMap.put(edge.getEdgeLabel(), blockId);
                }
            }
        }
    }


    // Finds the block that contains a given node
    private Block findBlock(Node node, Set<Block> partition) {
        return partition.stream().filter(block -> block.contains(node)).findFirst().orElse(null);
    }

    // Constructs the minimized automata based on the partition
    private void constructMinimizedAutomata(Set<Block> partition) throws IOException {
        Map<Block, Node> blockToState = new HashMap<>();
        int id = 2;
        int initId = 1;

        for (Block block : partition) {
            Node rep = block.getNodes().iterator().next();
            Node minimizedState = new Node(id++, rep.getPrefixVerdict(), rep.getVerdict());
            // Check if this blokck contains the entry point
            for (Node node : block.getNodes()) {
                if (node.getNodeId() == 1) {
                    minimizedState = new Node(initId, rep.getPrefixVerdict(), rep.getVerdict());
                }
            }
            blockToState.put(block, minimizedState);
            minimizedStates.add(minimizedState);
        }
        System.out.println("Partition: \n");
        for (Block block : partition) {
            System.out.println(blockToState.get(block).getNodeId() + ": " + block.getSignature());

            Node sourceState = blockToState.get(block);
            for (Node original : block.getNodes()) {
                for (Edge edge : edges) {
//                    if (edge.getEdgeSource().equals(original) && !edge.isUnlabelled()) {
                    if (edge.getEdgeSource().equals(original)) {
                        Block targetBlock = findBlock(edge.getEdgeTarget(), partition);
                        Node minimizedTarget = blockToState.get(targetBlock);
                        Edge newEdge = createOrRetrieveEdge(minimizedEdges, sourceState, minimizedTarget, edge);
                        sourceState.getChildren().add(minimizedTarget);
                        minimizedTarget.getParents().add(sourceState);
                        minimizedEdges.add(newEdge);
                    }
                }
            }
        }
    }

    private Edge createOrRetrieveEdge(Set<Edge> edgeSet, Node sourceState, Node minimizedTarget, Edge edge) {
        for (Edge e : edgeSet) {
            if (e.getEdgeSource().equals(sourceState) && e.getEdgeTarget().equals(minimizedTarget) && e.getEdgeLabel().equals(edge.getEdgeLabel())) {
                return e;
            }
        }
        sourceState.addChild(minimizedTarget);
        minimizedTarget.addParent(sourceState);
        return new Edge(sourceState, minimizedTarget, edge);
    }


    private String generateString(Map<String, Integer> signatureMap) {
        return signatureMap.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue,
                        (e1, e2) -> e1,
                        LinkedHashMap::new))
                .toString();
    }

}