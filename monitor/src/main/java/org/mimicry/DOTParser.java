package org.mimicry;

import java.io.*;
import java.util.*;
import java.util.regex.*;

public class DOTParser {
    private final Map<String, Node> nodeMap = new HashMap<>();
    public Set<Node> parsedNodes = new HashSet<>();
    public final Set<Edge> parsedEdges = new HashSet<>();
    private final Map<String, Integer> temporaryNodeNameToNodeId = new HashMap<>();
    protected Map<Integer, Set<String>> readsPerLocation = new HashMap<>();
    protected Map<Integer, Set<String>> writesPerLocation = new HashMap<>();
    private String type = "";

    public DOTParser(String filepath, String analysisFilePath, String type) {
        try {
            this.type = type;
            parseLLVMDotFile(filepath);
            variableAccesAnalysis(analysisFilePath);
            printDefUseInfo();
        } catch (IOException e) {
            System.err.println("Error reading File: " + e.getMessage());
        }
    }

    private void parseLLVMDotFile(String filepath) throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(filepath));
        String line;

        Pattern edgePattern = Pattern.compile(
                "^(Node0x([A-Za-z0-9]+)" + // Source Node Id
                        "(:\\s*s(\\d+)){0,1}" + // :s0 or :s1 if exists
                        "\\s*->\\s*" + // ->
                        "(Node0x([A-Za-z0-9]+)))" + // Target Node Id
                        "(\\s*\\[[^\\]]*\\])?" + // Optional bracket attributes e.g. tooltip
                        "\\s*;");

        Pattern switchCasePattern = Pattern.compile("<(s\\d+)>([^|\\}]*)");

        // **First pass: Parse nodes**
        // We extract each node by locating the label="{...}" attribute directly, so we
        // are not sensitive to the order or presence of other attributes (color, style,
        // fontname, tooltip, ...) that differ between LLVM versions.
        int nodeNumber = 0;
        while ((line = br.readLine()) != null) {
            line = line.trim();

            if (!line.startsWith("Node0x") || !line.contains("[shape=record,") || !line.contains("label=\"{")) {
                continue;
            }

            // Extract the LLVM hex node ID from "Node0x<HEX> [..."
            int idStart = "Node0x".length();
            int idEnd = idStart;
            while (idEnd < line.length() && Character.isLetterOrDigit(line.charAt(idEnd))) {
                idEnd++;
            }
            String llvmNodeId = "n" + line.substring(idStart, idEnd);

            // Locate label="{...}" — the content ends with }"];
            int labelOpen = line.indexOf("label=\"{");
            int labelClose = line.lastIndexOf("}\"];");
            if (labelOpen < 0 || labelClose <= labelOpen) continue;

            // inner = everything between the opening { and closing }
            String inner = line.substring(labelOpen + "label=\"{".length(), labelClose);

            // Split on ":\l|" to separate the basic-block label from the instruction body
            int sep = inner.indexOf(":\\l|");
            if (sep < 0) continue;

            String basicBlockLabel = inner.substring(0, sep);
            String instructionBody = inner.substring(sep + ":\\l|".length());

            // Switch cases appear as "|{<s0>T|<s1>F}" at the end of the instruction body
            String casesPart = null;
            int switchSep = instructionBody.lastIndexOf("|{<");
            if (switchSep >= 0) {
                casesPart = instructionBody.substring(switchSep + 1);
                instructionBody = instructionBody.substring(0, switchSep);
            }

            Node newNode = new Node(nodeNumber++, llvmNodeId, basicBlockLabel, instructionBody);

            if (casesPart != null) {
                Matcher switchMatcher = switchCasePattern.matcher(casesPart);
                Map<String, String> slotMap = new LinkedHashMap<>();
                while (switchMatcher.find()) {
                    slotMap.put(switchMatcher.group(1), switchMatcher.group(2));
                }
                newNode.setSwitchCases(slotMap);
            }

            nodeMap.put(basicBlockLabel, newNode);
        }
        // **Reset the reader to reprocess the file**

        br.close();
        br = new BufferedReader(new FileReader(filepath));

        // **Second pass: Parse edges**
        while ((line = br.readLine()) != null) {
            line = line.trim();
            Matcher edgeMatcher = edgePattern.matcher(line);

            if (edgeMatcher.matches()) {
                String sourceLabel = "n" + edgeMatcher.group(2); // Extracted from "source:sX"
                String targetLabel = "n" + edgeMatcher.group(6); // Target node label
                String branch = edgeMatcher.group(3);
                String branchLabel = "";

                Node source = Automata.getNodeByLLVMId(sourceLabel, nodeMap.values());
                Node target = Automata.getNodeByLLVMId(targetLabel, nodeMap.values());

                if (branch != null) {
                    branch = branch.substring(1);
                    branchLabel = source.switchCases.get(branch);
                }

                Edge edge = new Edge(source, target, branchLabel, parsedEdges.size());
                parsedEdges.add(edge);
                source.addChild(target);
                target.addParent(source);
            }
        }
        br.close();
    }

    protected void variableAccesAnalysis(String analysisFilePath) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(analysisFilePath));
            String line;
            String currentBlock = "";

            while ((line = reader.readLine()) != null) {
                line = line.trim();

                // Identify new basic block
                if (line.startsWith("Basic Block:")) {
                    currentBlock = line.substring("Basic Block: ".length()).trim();
                }

                // Process instruction lines containing variable access info
                Pattern recordPattern = Pattern
                        .compile("((.*)@([0-9]+))\\s\\|\\sVariable:\\s(.*)\\|\\sAction:\\s(R|W|RW)(\\s)*");
                Matcher recordMatcher = recordPattern.matcher(line);
                if (recordMatcher.matches()) {
                    Integer originalLineNumb = Integer.parseInt(recordMatcher.group(3).trim());
                    String variable = recordMatcher.group(4).trim();
                    String action = recordMatcher.group(5).trim();

                    // Record read-write information
                    if (!variable.isEmpty() && !action.isEmpty()) {
                        if (action.contains("R")) {
                            readsPerLocation.computeIfAbsent(originalLineNumb, k -> new HashSet<>()).add(variable);
                        } else if (action.contains("W")) {
                            writesPerLocation.computeIfAbsent(originalLineNumb, k -> new HashSet<>()).add(variable);
                        }
                    }
                }
            }

            for (Node node : nodeMap.values()) {
                parsedNodes.add(node);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Map<Integer, Set<String>> printDefUseInfo() throws IOException {
        OutputStreamWriter output = new OutputStreamWriter(
                new FileOutputStream("work/temps/" + type + "_defUseInfoParsed.txt"));
        for (Map.Entry<Integer, Set<String>> entry : readsPerLocation.entrySet()) {
            for (String variable : entry.getValue()) {
                output.write("(" + entry.getKey() + ", " + variable + ", Read) \n");
            }
        }

        for (Map.Entry<Integer, Set<String>> entry : writesPerLocation.entrySet()) {
            for (String variable : entry.getValue()) {
                output.write("(" + entry.getKey() + ", " + variable + ", Write) \n");
            }
        }
        output.close();
        return null;
    }

    public Set<Node> getNodes() {
        return parsedNodes;
    }

    public Set<Edge> getEdges() {
        return parsedEdges;
    }
}
