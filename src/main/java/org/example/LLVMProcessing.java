package org.example;

import java.io.*;

import com.google.common.io.Files;

import java.nio.charset.StandardCharsets;
import java.util.*;

import static java.lang.Thread.sleep;

public class LLVMProcessing extends Automata {
    private DOTParser llvmCFG;
    private String dbgFilePath;
    private Map<String, Integer> llvmBreaks = new HashMap<>();
    private Map<Integer, String> locationsMap = new HashMap<>(); // Original Location -> Original Instructions
    private Map<String, Map<String, Node>> nodeMap = new HashMap<>(); // BasicBlock Label -> Original Instructions
    private Map<String, Node> locationsNode = new HashMap<>();

    public LLVMProcessing(DOTParser llvmCFG, String dbgFilePath, String cProgramFilePath, String type)
            throws IOException, InterruptedException {
        this.llvmCFG = llvmCFG;
        this.dbgFilePath = dbgFilePath;
        // Map all og locations to instructions
        mapOgLocations(cProgramFilePath);

        // Parse the LLVM CFG
        splitBasicBlocks();

        convertToOgSourceCode();

        addDefUseInfo(llvmCFG.readsPerLocation, llvmCFG.writesPerLocation);

        // Render the LLVM CFG before dual version
        generateRender("LLVMOG", "llvm/" + type + "_llvmAnalyzed");

        castDualVersion();
    }

    // TODO: Refactorear esta cosa horrible
    // Transform CFG to Dual Version
    private void castDualVersion() throws IOException {
        Set<Edge> newEdges = new HashSet<>();
        Set<Node> newNodes = new HashSet<>();

        // Create START and RETURN nodes
        Node startNode = new Node(0, "START");
        Node retNode = new Node(1, "RETURN");
        newNodes.add(startNode);
        newNodes.add(retNode);

        Integer nodeId = 2;

        // Map to store the new node for each original node
        Map<Node, Node> nodeToNode = new HashMap<>();
        // Map to store intermediate nodes for branching nodes
        Map<Node, Node> branchingNodeToIntermediate = new HashMap<>();

        // Build node to node mapping first
        for (Node node : nodes) {
            Node dualNode = new Node(nodeId++, "Node" + (nodeId - 1));
            nodeToNode.put(node, dualNode);
            newNodes.add(dualNode);
        }

        // Build edge maps for the original graph
        Map<Node, List<Edge>> outgoingEdges = new HashMap<>();
        Map<Node, List<Edge>> incomingEdges = new HashMap<>();

        for (Edge edge : edges) {
            outgoingEdges.computeIfAbsent(edge.getEdgeSource(), k -> new ArrayList<>()).add(edge);
            incomingEdges.computeIfAbsent(edge.getEdgeTarget(), k -> new ArrayList<>()).add(edge);
        }

        // Identify branching nodes and create intermediate nodes
        for (Node node : nodes) {
            if (outgoingEdges.getOrDefault(node, Collections.emptyList()).size() > 1) {
                // This is a branching node, create an intermediate node
                Node intermediateNode = new Node(nodeId++, "Node" + (nodeId - 1));
                branchingNodeToIntermediate.put(node, intermediateNode);
                newNodes.add(intermediateNode);
            }
        }

        // Connect START node to the entry nodes
        for (Node node : nodes) {
            if (!incomingEdges.containsKey(node) || incomingEdges.get(node).isEmpty()) {
                // This is an entry node, connect START to its dual node
                Integer location = node.getLocation();
                Edge edge = new Edge(startNode, nodeToNode.get(node), "Entry", location);
                newEdges.add(edge);
                startNode.addChild(nodeToNode.get(node));
                nodeToNode.get(node).addParent(startNode);
            }
        }

        // Connect exit nodes to RETURN node
        for (Node node : nodes) {
            if (!outgoingEdges.containsKey(node) || outgoingEdges.get(node).isEmpty()) {
                // This is an exit node, connect its dual node to RETURN
                Integer location = node.getLocation();
                newEdges.add(new Edge(nodeToNode.get(node), retNode, node.getContent(), location));
                nodeToNode.get(node).addChild(retNode);
                retNode.addParent(nodeToNode.get(node));
            }
        }

        // Process regular node connections and handle branching nodes specially
        for (Edge originalEdge : edges) {
            Node sourceNode = originalEdge.getEdgeSource();
            Node targetNode = originalEdge.getEdgeTarget();
            String edgeLabel = originalEdge.getEdgeLabel();
            Integer location = sourceNode.getLocation();

            // Get the corresponding dual nodes
            Node dualSourceNode = nodeToNode.get(sourceNode);
            Node dualTargetNode = nodeToNode.get(targetNode);

            // If this is a branching node (has multiple children)
            if (branchingNodeToIntermediate.containsKey(sourceNode)) {
                Node intermediateNode = branchingNodeToIntermediate.get(sourceNode);

                // If this is the first edge we're processing for this node, connect dual ->
                // intermediate
                if (!newEdges.stream().anyMatch(e -> e.getEdgeSource().equals(dualSourceNode) &&
                        e.getEdgeTarget().equals(intermediateNode))) {
                    newEdges.add(new Edge(dualSourceNode, intermediateNode, sourceNode.getContent() + "?", location));
                    dualSourceNode.addChild(intermediateNode);
                    intermediateNode.addParent(dualSourceNode);
                }

                // Then connect intermediate -> target with branch label
                String branchContent;
                if (edgeLabel != null && edgeLabel.equals("T")) {
                    branchContent = sourceNode.getContent() + ": then";
                } else if (edgeLabel != null && edgeLabel.equals("F")) {
                    branchContent = sourceNode.getContent() + ": else";
                } else {
                    branchContent = sourceNode.getContent() + (edgeLabel != null ? ": " + edgeLabel : "");
                }
                newEdges.add(new Edge(intermediateNode, dualTargetNode, branchContent, location));
                intermediateNode.addChild(dualTargetNode);
                dualTargetNode.addParent(intermediateNode);
            } else {
                // Normal case - direct connection with original node content or edge label
                String edgeContent = sourceNode.getContent();
                newEdges.add(new Edge(dualSourceNode, dualTargetNode, edgeContent, location));
                dualSourceNode.addChild(dualTargetNode);
                dualTargetNode.addParent(dualSourceNode);
            }
        }

        // Update the graph with the new nodes and edges
        edges = newEdges;
        nodes = newNodes;
    }

    private void addDefUseInfo(Map<Integer, Set<String>> readsPerLocation, Map<Integer, Set<String>> writesPerLocation)
            throws FileNotFoundException {
        for (Node node : nodes) {
            // Get location
            String location = node.llvmId;
            try {
                if (!location.equals("NOLOC")) {
                    int locInt = Integer.parseInt(location);
                    // Get the original instruction
                    if (readsPerLocation.containsKey(locInt)) {
                        node.variableReads.addAll(readsPerLocation.get(locInt));
                    }
                    if (writesPerLocation.containsKey(locInt)) {
                        node.variableWrites.addAll(writesPerLocation.get(locInt));
                    }
                }
            } catch (Exception e) {
                System.err.println("Error converting: " + node.basicBlockLabel);
            }
        }

    }

    private void mapOgLocations(String cProgramFilePath) {
        try {
            File cProgramFile = new File(cProgramFilePath);
            String content = Files.toString(cProgramFile, StandardCharsets.UTF_8);

            String[] statements = content.split("\n");

            int counter = 0;
            for (String statement : statements) {
                counter++;
                statement = statement.replace("{", "");
                statement = statement.replace("}", "");
                statement = statement.replace("else", "");
                statement = statement.replace("\"", "'");
                statement = statement.trim();

                locationsMap.put(counter, statement);
            }
        } catch (IOException e) {
            System.err.println("Error reading C program file: " + e.getMessage());
        }
    }

    private void convertToOgSourceCode() {
        for (Node node : nodes) {
            // Get location
            String location = node.basicBlockLabel.split("@")[1];
            try {
                // If it is an instruction with a location in og source code
                if (!location.equals("NOLOC")) {
                    // Get the original instruction
                    int locInt = Integer.parseInt(location);
                    String ogInst = locationsMap.get(locInt);
                    // Remove IR instructions
                    ArrayList<String> ogInstList = new ArrayList<>();
                    ogInstList.add(ogInst);
                    node.instructions = ogInstList;
                }
            } catch (Exception e) {
                System.err.println("Error converting: " + node.basicBlockLabel);
            }

        }
    }

    // Split Basic Blocks into multiple nodes, wher each corresponds to an original
    // source code lines
    private void splitBasicBlocks() throws IOException {
        int nodeId = 0;
        int edgeId = 0;
        Node prevNode;
        String prevLocation;
        for (Node block : llvmCFG.getNodes()) {
            prevNode = null;
            prevLocation = "";
            for (String instruction : block.instructions) {
                String location = getLocationFromDbg(instruction);
                // If it is an instruction with a location in og source code
                // Avoid processing branches and unreachable code
                if (location != null
                        && !instruction.trim().startsWith("br")
                        && !instruction.trim().startsWith("unreachable")) {
                    // and a new source code Instruction
                    // Same original lines are obv in the same bb and adjacent NOT SO OBVIOUS
                    if (!location.equals(prevLocation)/* && !visitedLocations.contains(locationInt) */) {
                        Map<String, Node> blockMap = nodeMap.computeIfAbsent(block.basicBlockLabel, k -> new HashMap<>());
                        Node existingNode = blockMap.get(location);
                        Node node;
                        if (existingNode != null) {
                            // Location already seen non-consecutively — reuse the existing node
                            // instead of replacing it (which would orphan it in edges)
                            existingNode.instructions.add(instruction);
                            node = existingNode;
                        } else {
                            node = new Node(nodeId++, location, block.basicBlockLabel + "@" + location, instruction);
                            blockMap.put(location, node);
                        }

                        // Add edges in between same block instructions
                        if (prevNode != null) {
                            edges.add(new Edge(prevNode, node, "", edgeId++));
                        }

                        prevNode = node;
                        prevLocation = location;

                    } else {
                        // If this is not the first instruction in the location, just append it
                        nodeMap.get(block.basicBlockLabel).get(location).instructions.add(instruction);
                    }
                }
            }

            // Some blocks dont have real code insts, so we just make a dummy one for
            // clarity
            if (!nodeMap.containsKey(block.basicBlockLabel)) {
                block.basicBlockLabel = "";
            }
        }

        // Now, add edges between different block instructions
        for (Edge edge : llvmCFG.getEdges()) {
            // Get closest non empty blocks
            List<String> previousNonEmptyBlocks = getPreviousNonEmptyBlock(edge.getEdgeSource());
            List<String> nextNonEmptyBlocks = getNextNonEmptyBlock(edge.getEdgeTarget());

            // From: Last instruction from source block
            for (String previousLabel : previousNonEmptyBlocks) {
                for (String nextLabel : nextNonEmptyBlocks) {
                    // From: Last instruction from source block
                    Node source = getLastLoc(nodeMap.get(previousLabel));
                    // To: First instruction from target block
                    Node target = getFirstLoc(nodeMap.get(nextLabel));

                    // If the target is already a child of the source, skip it
                    if (!shouldAddEdge(source, target, edge.getEdgeLabel())) {
                        continue;
                    }

                    // Else add edge
                    source.getChildren().add(target);
                    target.getParents().add(source);
                    edges.add(new Edge(source, target, edge.getEdgeLabel(), edgeId++));
                }
            }
        }

        // Put all nodes in one collection
        for (Map<String, Node> sameLocIns : nodeMap.values()) {
            nodes.addAll(sameLocIns.values());
        }
    }

    private boolean shouldAddEdge(Node source, Node target, String label) {
        if (source.getChildren().contains(target)) {
            for (Edge edge : edges) {
                if (edge.getEdgeSource().equals(source) &&
                        edge.getEdgeTarget().equals(target) &&
                        (edge.getEdgeLabel().equals(label) || label.isEmpty())) {
                    return false;
                }
            }
        }
        return true;
    }

    // Get all next non-empty blocks at the closest distance from the given edge
    // target node
    private List<String> getNextNonEmptyBlock(Node edgeTarget) {
        Queue<Node> nodesToVisit = new ArrayDeque<Node>();
        nodesToVisit.add(edgeTarget);
        List<String> results = new ArrayList<>();
        int currentDepth = 0;
        int minDepthWithContent = -1;

        while (!nodesToVisit.isEmpty()) {
            int levelSize = nodesToVisit.size();

            for (int i = 0; i < levelSize; i++) {
                Node currentNode = nodesToVisit.poll();
                if (currentNode == null)
                    continue;

                String blockLabel = currentNode.basicBlockLabel;

                // Check if block is not empty
                if (!blockLabel.isEmpty()) {
                    // If this is the first non-empty block found, record its depth
                    if (minDepthWithContent == -1) {
                        minDepthWithContent = currentDepth;
                        results.add(blockLabel);
                    }
                    // If this block is at the same depth as the first non-empty block
                    else if (currentDepth == minDepthWithContent) {
                        results.add(blockLabel);
                    }
                } else {
                    // Add all children to the queue
                    nodesToVisit.addAll(currentNode.getChildren());
                }
            }

            // Move to the next depth level
            currentDepth++;

            // If we've found content and processed all nodes at that depth, we can stop
            if (minDepthWithContent != -1 && currentDepth > minDepthWithContent) {
                break;
            }
        }
        return results;
    }

    // Get all previous non-empty blocks at the closest distance from the given edge
    // source node
    private List<String> getPreviousNonEmptyBlock(Node edgeSource) {
        Queue<Node> nodesToVisit = new ArrayDeque<Node>();
        nodesToVisit.add(edgeSource);
        List<String> results = new ArrayList<>();
        int currentDepth = 0;
        int minDepthWithContent = -1;

        while (!nodesToVisit.isEmpty()) {
            int levelSize = nodesToVisit.size();

            for (int i = 0; i < levelSize; i++) {
                Node currentNode = nodesToVisit.poll();
                if (currentNode == null)
                    continue;

                String blockLabel = currentNode.basicBlockLabel;

                // Check if block is not empty
                if (!blockLabel.isEmpty()) {
                    // If this is the first non-empty block found, record its depth
                    if (minDepthWithContent == -1) {
                        minDepthWithContent = currentDepth;
                        results.add(blockLabel);
                    }
                    // If this block is at the same depth as the first non-empty block
                    else if (currentDepth == minDepthWithContent) {
                        results.add(blockLabel);
                    }
                    // If we've moved beyond the minimum depth, stop searching
                    else if (currentDepth > minDepthWithContent) {
                        return results;
                    }
                } else {
                    // Add all parents to the queue
                    nodesToVisit.addAll(currentNode.getParents());
                }
            }

            // Move to the next depth level
            currentDepth++;

            // If we've found content and processed all nodes at that depth, we can stop
            if (minDepthWithContent != -1 && currentDepth > minDepthWithContent) {
                break;
            }
        }
        return results;
    }

    // Get first ll instruction of a group of ll instructions that map to the same C
    // instruction
    private Node getFirstLoc(Map<String, Node> sameBlockIns) {
        int min = Integer.MAX_VALUE;
        for (String location : sameBlockIns.keySet()) {
            int intLoc = Integer.parseInt(location);
            if (intLoc < min) {
                min = intLoc;
            }
        }
        String minS = Integer.toString(min);
        return sameBlockIns.get(minS);
    }

    // Get last ll instruction of a group of ll instructions that map to the same C
    // instruction
    private Node getLastLoc(Map<String, Node> sameBlockIns) {
        int max = Integer.MIN_VALUE;
        for (String location : sameBlockIns.keySet()) {
            int intLoc = Integer.parseInt(location);
            if (intLoc > max) {
                max = intLoc;
            }
        }
        String maxS = Integer.toString(max);
        return sameBlockIns.get(maxS);
    }

    // Use debug tag and location information to get the original source code line
    private String getLocationFromDbg(String instruction) throws IOException {
        if (instruction != null) {
            int debugTag = getDebugTag(instruction);
            if (debugTag == -1) {
                return null;
            }

            try (BufferedReader reader = new BufferedReader(new FileReader(dbgFilePath))) {
                String line;
                String matcher = "!" + debugTag + " = !DILocation(line:";
                while ((line = reader.readLine()) != null) {
                    if (line.contains(matcher)) {
                        String[] parts = line.split("line:|,");
                        String lineNumber = parts[1].trim();
                        int lineInt = Integer.parseInt(lineNumber);
                        if (lineInt == 0 || locationsMap.get(lineInt).equals("")) {
                            return null;
                        }
                        return lineNumber;
                    }
                }
            }
        }
        return null;
    }

    // Extract the debug tag from the instruction
    private int getDebugTag(String instruction) {
        String[] parts = instruction.split("!dbg(\\\\l...){0,1} !");
        if (parts.length < 2) {
            return -1;
        }
        try {
            parts[1] = parts[1].replaceAll("[^0-9]", "");
            return Integer.parseInt(parts[1]);
        } catch (NumberFormatException e) {
            System.err.println(instruction);
            throw new IllegalArgumentException("Invalid debug tag format.");
        }
    }

    public Set<Edge> getEdges() {
        return edges;
    }
}
