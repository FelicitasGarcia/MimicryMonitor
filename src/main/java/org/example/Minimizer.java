package org.example;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

class Minimizer extends VerdictAutomata {
    Set<Node> minimizedStates = new HashSet<>();
    Set<Edge> minimizedEdges = new HashSet<>();
    Automata closure = new Automata();
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

    public Minimizer(Automata Automata) throws IOException {
        super(Automata.nodes, Automata.edges);
        findInitialNode();
        hideLabels();

        // Compute Closure of Original Automaton to Bisimulate
        computeClosure();

        // Minimize to reduce size
        minimize();

        // Compute closure of minimized Automaton
        computeClosure();

        // Determinize
        determinize();

        // Compact IV and V Nodes
        compactFinalStates(minimizedStates, minimizedEdges);

        // Propagate IV verdicts again and Prune
        IVPropagation();
        Node initialNode = retrieveInitialNode();
        prune(initialNode);


        // Compact IV and V Nodes
        Set<Node> copyNodes = new HashSet<>(nodes);
        Set<Edge> copyEdges = new HashSet<>(edges);
        compactFinalStates(copyNodes, copyEdges);

        System.out.println("Minimized: nodes=" + nodes.size() + " edges=" + edges.size());
        for (Node n : nodes) System.out.println("  node: id=" + n.getNodeId() + " label=" + n.getNodeLabel() + " verdict=" + n.getVerdict());
        for (Edge e : edges) System.out.println("  edge: " + e.getEdgeSource().getNodeId() + "->" + e.getEdgeTarget().getNodeId() + " label='" + e.getEdgeLabel() + "'");
        generateRender("Minimized_Monitor", "llvmBasedResults/Minimized_Monitor");
    }

    private Node retrieveInitialNode() {
        for (Node node : nodes) {
            if (node.getNodeId() == 1) return node;
        }
        return null;
    }

    private void determinize() {
        Set<Set<Node>> powerSet = new HashSet<>();
        Set<Node> initialSet = new HashSet<>();
        initialSet.add(initialNode);
        powerSet.add(initialSet);

        Map<Set<Node>, Node> powerSetToNode = new HashMap<>();
        minimizedStates = new HashSet<>();
        minimizedEdges = new HashSet<>();

        // Create initial node for minimized automata
        Node newInitialNode = new Node(1, initialNode.getPrefixVerdict(), initialNode.getVerdict());
        minimizedStates.add(newInitialNode);
        powerSetToNode.put(initialSet, newInitialNode);

        // Process each set in power set
        Set<Set<Node>> unprocessedSets = new HashSet<>();
        unprocessedSets.add(initialSet);

        while (!unprocessedSets.isEmpty()) {
            Set<Node> currentSet = unprocessedSets.iterator().next();
            unprocessedSets.remove(currentSet);

            // Get or create node corresponding to current set
            Node currentNode = powerSetToNode.get(currentSet);

            // Find all possible transitions from current set
            Map<String, Set<Node>> transitions = new HashMap<>();
            for (Node node : currentSet) {
                for (Edge edge : closure.edges) {
                    if (edge.getEdgeSource().equals(node) && !edge.isUnlabelled()) {
                        transitions.computeIfAbsent(edge.getEdgeLabel(), k -> new HashSet<>())
                                .add(edge.getEdgeTarget());
                    }
                }
            }

            // Create new nodes and edges for each transition
            for (Map.Entry<String, Set<Node>> entry : transitions.entrySet()) {
                String label = entry.getKey();
                Set<Node> targetSet = entry.getValue();

                if (!powerSet.contains(targetSet)) {
                    powerSet.add(targetSet);
                    unprocessedSets.add(targetSet);

                    // Create new node for target set
                    Node representative = chooseRepresentative(targetSet);
                    Node newNode = new Node(minimizedStates.size() + 1,
                            representative.getPrefixVerdict(),
                            representative.getVerdict());
                    minimizedStates.add(newNode);
                    powerSetToNode.put(targetSet, newNode);
                }

                // Create edge between current node and target node
                Node targetNode = powerSetToNode.get(targetSet);
                Edge newEdge = new Edge(currentNode, targetNode, label, minimizedEdges.size());
                minimizedEdges.add(newEdge);
            }
        }
    }

    // Orden de "pesimismo", IV --> VP --> V
    // Un conjunto de nodos solo puede ser V si todos sus nodos son V
    private Node chooseRepresentative(Set<Node> targetSet) {
        Node representative = null;
        String representativeLabel = "";
        for (Node node : targetSet) {
            if (!node.getVerdict().isEmpty() && node.getVerdict().equals("IV")) {
                representative = node;
                representativeLabel = "IV";
            } else if ( !representativeLabel.equals("IV") &&
                        !node.getVerdict().isEmpty() && node.getPrefixVerdict().equals("VP")) {
                representative = node;
            } else if ( representative == null)  {
                representative = node;
            }
        }
        return representative;
    }

    private void computeClosure() {
        // Initialize closure automata with the same nodes as the original
        closure.nodes = new HashSet<>(nodes);
        closure.edges = new HashSet<>(edges);

        // Step 1: Add reflexive transitions - each node has a transition to itself
        for (Node node : nodes) {
            Edge selfEdge = new Edge(node, node, "", closure.edges.size());
            selfEdge.setUnlabelled(true);
            closure.edges.add(selfEdge);
        }

        // Step 2: Compute transitive closure of unlabeled transitions
        Map<Node, Set<Node>> unlabeledReachability = computeUnlabeledReachability();

        // Step 3: Add combined labeled transitions
        // For each node, find all nodes reachable via unlabeled transitions,
        // then for each labeled transition from those nodes, add a direct labeled transition
        Set<Edge> newEdges = new HashSet<>();

        for (Node source : nodes) {
            // Get all nodes reachable from source via unlabeled transitions
            Set<Node> reachableFromSource = unlabeledReachability.get(source);

            // For each reachable node, check its outgoing labeled transitions
            for (Node intermediate : reachableFromSource) {
                for (Edge labeledEdge : edges) {
                    // If it's a labeled edge from the intermediate node
                    if (labeledEdge.getEdgeSource().equals(intermediate) && !labeledEdge.isUnlabelled()) {
                        Node target = labeledEdge.getEdgeTarget();

                        // For the target node, get all nodes reachable via unlabeled transitions
                        Set<Node> reachableFromTarget = unlabeledReachability.get(target);

                        // Create direct labeled edges from source to all nodes reachable from target
                        for (Node finalTarget : reachableFromTarget) {
                            Edge newEdge = new Edge(source, finalTarget, labeledEdge.getEdgeLabel(), newEdges.size());
                            newEdge.setUnlabelled(false);
                            newEdges.add(newEdge);
                        }
                    }
                }
            }
        }

        // Add all new edges to the closure
        closure.edges.addAll(newEdges);
        nodes = closure.nodes;
        edges = closure.edges;
    }

    // Compute the transitive closure of unlabeled transitions
    private Map<Node, Set<Node>> computeUnlabeledReachability() {
        // For each node, store the set of nodes reachable via unlabeled transitions
        Map<Node, Set<Node>> reachability = new HashMap<>();

        // Initialize with reflexive transitions (each node can reach itself)
        for (Node node : nodes) {
            Set<Node> reachable = new HashSet<>();
            reachable.add(node);
            reachability.put(node, reachable);
        }

        // Add direct unlabeled transitions
        for (Edge edge : edges) {
            if (edge.isUnlabelled()) {
                reachability.get(edge.getEdgeSource()).add(edge.getEdgeTarget());
            }
        }

        // Compute transitive closure using Floyd-Warshall algorithm
        boolean changed;
        do {
            changed = false;
            for (Node source : nodes) {
                Set<Node> reachableFromSource = new HashSet<>(reachability.get(source));

                // For each node currently reachable from source
                for (Node intermediate : new HashSet<>(reachableFromSource)) {
                    // Add all nodes reachable from intermediate to the set of nodes reachable from source
                    Set<Node> reachableFromIntermediate = reachability.get(intermediate);
                    int originalSize = reachableFromSource.size();
                    reachableFromSource.addAll(reachableFromIntermediate);

                    if (reachableFromSource.size() > originalSize) {
                        changed = true;
                    }
                }

                reachability.put(source, reachableFromSource);
            }
        } while (changed);

        return reachability;
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
        Map<String, Set<Integer>> signatureMap = new HashMap<>();
        computeSignature(node, partition, signatureMap);
        return generateString(signatureMap);
    }

    private void computeSignature(Node node, Set<Block> partition, Map<String, Set<Integer>> signatureMap) {
        // Process all edges from the current node
        for (Edge edge : closure.edges) {
            if (edge.getEdgeSource().equals(node)) {
    //          if (!edge.isUnlabelled()) {
                  // Process labeled transitions
                  Block targetBlock = findBlock(edge.getEdgeTarget(), partition);
                  if (targetBlock == null) {
                      System.err.println("Error: Target block not found");
                  }
                  int blockId = targetBlock.getId();
                  signatureMap.computeIfAbsent(edge.getEdgeLabel(), k -> new HashSet<>()).add(blockId);
      //        }
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
            // Check if this block contains the entry point
            for (Node node : block.getNodes()) {
                if (node.getNodeId() == 1) {
                    minimizedState = new Node(initId, rep.getPrefixVerdict(), rep.getVerdict());
                }
            }
            blockToState.put(block, minimizedState);
            minimizedStates.add(minimizedState);
        }
        for (Block block : partition) {
            Node sourceState = blockToState.get(block);
            for (Node original : block.getNodes()) {
                for (Edge edge : edges) {
 //                   if (edge.getEdgeSource().equals(original) && !edge.isUnlabelled()) {
                     if (edge.getEdgeSource().equals(original)) {
                        Block targetBlock = findBlock(edge.getEdgeTarget(), partition);
                        Node minimizedTarget = blockToState.get(targetBlock);
                        if (minimizedTarget.equals(sourceState)) {
                            continue;
                        }
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


    private String generateString(Map<String, Set<Integer>> signatureMap) {
        return signatureMap.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> entry.getValue().stream()
                                .sorted()
                                .collect(Collectors.toCollection(LinkedHashSet::new)),
                        (e1, e2) -> e1,
                        LinkedHashMap::new))
                .toString();
    }

}