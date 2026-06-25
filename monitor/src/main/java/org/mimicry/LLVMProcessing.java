package org.mimicry;

import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.common.io.Files;

import java.nio.charset.StandardCharsets;
import java.util.*;


public class LLVMProcessing extends Automata {
    private DOTParser llvmCFG;
    private String dbgFilePath;
    private Map<String, Integer> llvmBreaks = new HashMap<>();
    private Map<Integer, String> locationsMap = new HashMap<>(); // Original Location -> Original Instructions
    private Map<String, Map<String, Node>> nodeMap = new HashMap<>(); // BasicBlock Label -> Original Instructions
    private Map<String, Node> locationsNode = new HashMap<>();
    // Pre-parsed metadata: !N -> source line in the C program (inlinedAt chains already resolved)
    private Map<Integer, Integer> metadataToLine = new HashMap<>();
    // (blockLabel + KEY_SEP + normalized instruction text) -> source line.
    // Built from the .ll itself so it is immune to the metadata-ID renumbering that
    // opt's dot-cfg printer applies when emitting the .dot (see buildInstrLineMap).
    private Map<String, Integer> instrLineMap = new HashMap<>();
    private static final String KEY_SEP = "\t";

    public LLVMProcessing(DOTParser llvmCFG, String dbgFilePath, String cProgramFilePath, String type)
            throws IOException, InterruptedException {
        this.llvmCFG = llvmCFG;
        this.dbgFilePath = dbgFilePath;
        // Map all og locations to instructions
        mapOgLocations(cProgramFilePath);

        // Pre-parse all !DILocation metadata entries once (handles inlinedAt chains)
        buildMetadataMap();

        // Build the (block, instruction-text) -> source line map from the .ll. This
        // replaces direct !dbg-ID lookups, which break because opt's dot-cfg printer
        // renumbers metadata in the .dot relative to the .ll.
        buildInstrLineMap();

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

    // Split Basic Blocks into multiple nodes, where each corresponds to an original
    // source code line. Empty LLVM blocks (only br/unreachable) are contracted away
    // via a fixed-point pass rather than a BFS skip-search.
    private void splitBasicBlocks() throws IOException {
        int nodeId = 0;
        int edgeId = 0;
        Node prevNode;
        String prevLocation;

        // Phase 1: Build per-block source nodes with intra-block edges (unchanged).
        for (Node block : llvmCFG.getNodes()) {
            prevNode = null;
            prevLocation = "";
            for (String instruction : block.instructions) {
                String location = getLocationFromDbg(block.basicBlockLabel, instruction);
                if (location != null
                        && !instruction.trim().startsWith("br")
                        && !instruction.trim().startsWith("unreachable")
                        && !instruction.contains("@llvm.dbg")
                        && !instruction.contains("@llvm.lifetime")) {
                    if (!location.equals(prevLocation)) {
                        Map<String, Node> blockMap = nodeMap.computeIfAbsent(block.basicBlockLabel, k -> new HashMap<>());
                        Node existingNode = blockMap.get(location);
                        Node node;
                        if (existingNode != null) {
                            existingNode.instructions.add(instruction);
                            node = existingNode;
                        } else {
                            node = new Node(nodeId++, location, block.basicBlockLabel + "@" + location, instruction);
                            blockMap.put(location, node);
                        }
                        if (prevNode != null) {
                            edges.add(new Edge(prevNode, node, "", edgeId++));
                        }
                        prevNode = node;
                        prevLocation = location;
                    } else {
                        nodeMap.get(block.basicBlockLabel).get(location).instructions.add(instruction);
                    }
                }
            }
            if (!nodeMap.containsKey(block.basicBlockLabel)) {
                block.basicBlockLabel = "";
            }
        }

        // Phase 2: Wire inter-block edges naively using 1:1 correspondence.
        // Non-empty source block → last source node; non-empty target block → first
        // source node. Empty blocks (basicBlockLabel == "") get a placeholder Node.
        Map<Node, Node> blockToPlaceholder = new HashMap<>();

        for (Edge llvmEdge : llvmCFG.getEdges()) {
            Node srcBlock = llvmEdge.getEdgeSource();
            Node tgtBlock = llvmEdge.getEdgeTarget();
            String label = llvmEdge.getEdgeLabel();

            Node sourceNode;
            if (!srcBlock.basicBlockLabel.isEmpty()) {
                sourceNode = getLastLoc(nodeMap.get(srcBlock.basicBlockLabel));
            } else {
                if (!blockToPlaceholder.containsKey(srcBlock)) {
                    blockToPlaceholder.put(srcBlock, new Node(nodeId++, "EMPTY_" + srcBlock.getNodeId()));
                }
                sourceNode = blockToPlaceholder.get(srcBlock);
            }

            Node targetNode;
            if (!tgtBlock.basicBlockLabel.isEmpty()) {
                targetNode = getFirstLoc(nodeMap.get(tgtBlock.basicBlockLabel));
            } else {
                if (!blockToPlaceholder.containsKey(tgtBlock)) {
                    blockToPlaceholder.put(tgtBlock, new Node(nodeId++, "EMPTY_" + tgtBlock.getNodeId()));
                }
                targetNode = blockToPlaceholder.get(tgtBlock);
            }

            if (!hasInterBlockEdge(sourceNode, targetNode, label)) {
                edges.add(new Edge(sourceNode, targetNode, label, edgeId++));
                sourceNode.addChild(targetNode);
                targetNode.addParent(sourceNode);
            }
        }

        // Phase 3: Fixed-point contraction.
        // Splice out placeholder blocks (LLVM blocks that produced no source nodes,
        // e.g. phi-only or br-only blocks like loop back-edge merge points).
        //
        // Single-successor placeholder: pred→ph→succ becomes pred→succ keeping pred's label.
        // Multi-successor placeholder (e.g. phi + conditional br with line:0): the phi
        // encodes which successor to take, so we wire pred→each-succ using the outgoing
        // edge labels (T/F) from ph. We defer a placeholder whose successor is itself a
        // placeholder so that chains resolve innermost-first.
        Set<Node> placeholders = new HashSet<>(blockToPlaceholder.values());
        boolean changed = true;
        while (changed) {
            changed = false;
            for (Node ph : new ArrayList<>(placeholders)) {
                List<Edge> outEdges = new ArrayList<>();
                for (Edge e : edges) {
                    if (e.getEdgeSource() == ph) outEdges.add(e);
                }
                if (outEdges.isEmpty()) continue;

                // Defer if any successor is itself still a placeholder (resolve chains first).
                boolean succIsPlaceholder = outEdges.stream()
                        .anyMatch(e -> placeholders.contains(e.getEdgeTarget()));
                if (succIsPlaceholder) continue;

                if (outEdges.size() == 1) {
                    Node succ = outEdges.get(0).getEdgeTarget();
                    if (succ == ph) continue; // self-loop guard

                    List<Edge> inEdges = new ArrayList<>();
                    for (Edge e : edges) {
                        if (e.getEdgeTarget() == ph) inEdges.add(e);
                    }

                    for (Edge inEdge : inEdges) {
                        Node pred = inEdge.getEdgeSource();
                        String inLabel = inEdge.getEdgeLabel();
                        if (!hasInterBlockEdge(pred, succ, inLabel)) {
                            edges.add(new Edge(pred, succ, inLabel, edgeId++));
                            if (!pred.getChildren().contains(succ)) pred.addChild(succ);
                            if (!succ.getParents().contains(pred)) succ.addParent(pred);
                        }
                        pred.getChildren().remove(ph);
                    }
                    succ.getParents().remove(ph);
                    edges.removeAll(inEdges);
                    edges.remove(outEdges.get(0));
                    placeholders.remove(ph);
                    changed = true;
                } else {
                    // Multi-successor: use outgoing edge labels (the branch T/F labels).
                    List<Edge> inEdges = new ArrayList<>();
                    for (Edge e : edges) {
                        if (e.getEdgeTarget() == ph) inEdges.add(e);
                    }
                    if (inEdges.isEmpty()) continue; // entry placeholder with no predecessors — skip

                    for (Edge inEdge : inEdges) {
                        Node pred = inEdge.getEdgeSource();
                        for (Edge outEdge : outEdges) {
                            Node succ = outEdge.getEdgeTarget();
                            if (succ == ph) continue;
                            String succLabel = outEdge.getEdgeLabel();
                            if (!hasInterBlockEdge(pred, succ, succLabel)) {
                                edges.add(new Edge(pred, succ, succLabel, edgeId++));
                                if (!pred.getChildren().contains(succ)) pred.addChild(succ);
                                if (!succ.getParents().contains(pred)) succ.addParent(pred);
                            }
                        }
                        pred.getChildren().remove(ph);
                    }
                    for (Edge outEdge : outEdges) {
                        outEdge.getEdgeTarget().getParents().remove(ph);
                    }
                    edges.removeAll(inEdges);
                    edges.removeAll(outEdges);
                    placeholders.remove(ph);
                    changed = true;
                }
            }
        }

        // Remove any edges that still involve unreachable placeholder nodes
        // (zero-successor cases or self-loops that couldn't be contracted).
        final Set<Node> remaining = placeholders;
        edges.removeIf(e -> remaining.contains(e.getEdgeSource()) || remaining.contains(e.getEdgeTarget()));

        // Phase 4: Collect all real source nodes.
        for (Map<String, Node> sameLocIns : nodeMap.values()) {
            nodes.addAll(sameLocIns.values());
        }
    }

    private boolean hasInterBlockEdge(Node source, Node target, String label) {
        for (Edge e : edges) {
            if (e.getEdgeSource() == source && e.getEdgeTarget() == target
                    && Objects.equals(e.getEdgeLabel(), label)) {
                return true;
            }
        }
        return false;
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

    // Matches "!N = [distinct] !DILocation(...)" — handles both LLVM 16 and LLVM 19 formats.
    private static final Pattern DILOCATION_PATTERN =
            Pattern.compile("^!(\\d+)\\s*=\\s*(?:distinct\\s*)?!DILocation\\((.+)\\)\\s*$");
    private static final Pattern INLINED_AT_PATTERN = Pattern.compile("inlinedAt:\\s*!(\\d+)");
    private static final Pattern LINE_NUM_PATTERN   = Pattern.compile("line:\\s*(\\d+)");

    // Pre-parse the .ll file once: build a map from metadata ID to resolved source line.
    // Handles two formats:
    //   !N = !DILocation(line: X, ...)              → line X (LLVM 16/Mac)
    //   !N = !DILocation(line: Y, ..., inlinedAt: !M) → follow !M (LLVM inlined, Linux)
    //   !N = distinct !DILocation(...)              → same, both forms
    private void buildMetadataMap() throws IOException {
        // Pass 1: collect raw DILocation content strings keyed by metadata ID
        Map<Integer, String> rawEntries = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(dbgFilePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                Matcher m = DILOCATION_PATTERN.matcher(line.trim());
                if (m.matches()) {
                    rawEntries.put(Integer.parseInt(m.group(1)), m.group(2));
                }
            }
        }

        // Pass 2: resolve each entry, following inlinedAt chains to the root call site
        for (Map.Entry<Integer, String> entry : rawEntries.entrySet()) {
            int lineNum = resolveLineNumber(entry.getValue(), rawEntries, 0);
            if (lineNum > 0) {
                String ogLine = locationsMap.get(lineNum);
                if (ogLine != null && !ogLine.isEmpty()) {
                    metadataToLine.put(entry.getKey(), lineNum);
                }
            }
        }
    }

    // Recursively follow inlinedAt until we reach a DILocation whose line maps to the
    // C source file. depth guards against malformed circular metadata.
    private int resolveLineNumber(String content, Map<Integer, String> rawEntries, int depth) {
        if (depth > 32) return -1;

        Matcher inlinedAt = INLINED_AT_PATTERN.matcher(content);
        if (inlinedAt.find()) {
            int targetId = Integer.parseInt(inlinedAt.group(1));
            String targetContent = rawEntries.get(targetId);
            if (targetContent != null) {
                return resolveLineNumber(targetContent, rawEntries, depth + 1);
            }
            return -1;
        }

        Matcher lineNum = LINE_NUM_PATTERN.matcher(content);
        if (lineNum.find()) {
            return Integer.parseInt(lineNum.group(1));
        }
        return -1;
    }

    // Matches a function definition header: "define ... @name(<params>) ... {".
    private static final Pattern FUNC_DEFINE_PATTERN =
            Pattern.compile("^define\\b.*?@[\\w.$]+\\(([^)]*)\\)");
    // Matches a basic-block label line, e.g. "40:" or "40:    ; preds = %38".
    private static final Pattern BLOCK_LABEL_PATTERN = Pattern.compile("^(\\d+):");
    // The CFG (.dot) is always the 'main' function (analyze.sh copies .main.dot).
    private static final String CFG_FUNCTION = "main";

    // Walk the .ll once and build (blockLabel + KEY_SEP + normalized text) -> source line.
    //
    // Why text instead of metadata IDs: opt's dot-cfg printer assigns its own metadata
    // slot numbers when it emits the .dot, so an instruction's "!dbg !N" in the .dot does
    // NOT match the same instruction's "!dbg !M" in the .ll (and the offset is not stable
    // across LLVM versions/platforms). But the *instruction text* is printed identically in
    // both, modulo metadata IDs, attribute-group IDs, DOT escaping and line-wrapping — all
    // of which normalizeInstruction() strips. The .ll resolves each instruction's line via
    // its own metadata (always self-consistent), keyed by block so that identical statements
    // in different blocks (e.g. repeated "show_nonprinting = true;" switch cases) stay
    // distinct. Only the 'main' function is parsed, matching the .dot's scope.
    private void buildInstrLineMap() throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(dbgFilePath))) {
            String line;
            boolean inFunction = false;
            String currentBlock = null;
            while ((line = reader.readLine()) != null) {
                String trimmed = line.trim();

                Matcher def = FUNC_DEFINE_PATTERN.matcher(trimmed);
                if (def.find()) {
                    inFunction = trimmed.contains("@" + CFG_FUNCTION + "(");
                    // LLVM numbers unnamed values: params %0..%(p-1), then the entry block
                    // gets slot %p. So the entry block's label equals the parameter count,
                    // which is what the .dot uses for the entry node (e.g. "2" for main).
                    currentBlock = Integer.toString(countParams(def.group(1)));
                    continue;
                }
                if (!inFunction) continue;
                if (trimmed.equals("}")) {
                    inFunction = false;
                    currentBlock = null;
                    continue;
                }
                Matcher lbl = BLOCK_LABEL_PATTERN.matcher(trimmed);
                if (lbl.find()) {
                    currentBlock = lbl.group(1);
                    continue;
                }
                int debugTag = getDebugTag(trimmed);
                if (debugTag == -1) continue;
                Integer lineNum = metadataToLine.get(debugTag);
                if (lineNum != null) {
                    instrLineMap.put(currentBlock + KEY_SEP + normalizeInstruction(trimmed), lineNum);
                }
            }
        }
    }

    private int countParams(String params) {
        String p = params.trim();
        if (p.isEmpty()) return 0;
        return p.split(",").length;
    }

    // Canonicalize an instruction so the .ll form and the .dot form compare equal:
    // drop DOT line-wraps (\l, \l...), un-escape DOT record special chars, strip metadata
    // attachments (!dbg, !tbaa, ...) and attribute-group refs (#12), then collapse spaces.
    private String normalizeInstruction(String s) {
        s = s.replace("\\l...", " ").replace("\\l", " ");
        s = s.replace("\\{", "{").replace("\\}", "}")
             .replace("\\<", "<").replace("\\>", ">")
             .replace("\\|", "|");
        s = s.replaceAll("![\\w.]+", "");   // metadata names and ids: !dbg, !351, !tbaa ...
        s = s.replaceAll("#\\d+", "");        // attribute-group references: #12
        s = s.replaceAll("\\s+", " ").trim();
        while (s.endsWith(",")) {
            s = s.substring(0, s.length() - 1).trim();
        }
        return s;
    }

    // Resolve the original source line for a .dot instruction by matching it (within its
    // basic block) against the .ll-derived instrLineMap.
    private String getLocationFromDbg(String blockLabel, String instruction) {
        if (instruction == null) return null;
        Integer lineNum = instrLineMap.get(blockLabel + KEY_SEP + normalizeInstruction(instruction));
        return lineNum != null ? String.valueOf(lineNum) : null;
    }

    // Matches "!dbg !N" with optional dot-file line-wrap (\l + any whitespace) between
    // "!dbg" and "!N", handling whatever indentation LLVM uses after the wrap.
    private static final Pattern DBG_TAG_PATTERN = Pattern.compile("!dbg\\s*(?:\\\\l\\s*)?!(\\d+)");

    private int getDebugTag(String instruction) {
        Matcher m = DBG_TAG_PATTERN.matcher(instruction);
        if (m.find()) {
            return Integer.parseInt(m.group(1));
        }
        return -1;
    }

    public Set<Edge> getEdges() {
        return edges;
    }
}
