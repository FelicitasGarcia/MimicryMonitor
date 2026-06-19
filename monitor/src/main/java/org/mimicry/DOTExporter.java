package org.mimicry;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

import static com.google.common.base.Ascii.truncate;

public class DOTExporter {
    String dotFilePath;
    String destination;
    String type;

    // Constructor for the LLVM DOTEXPORTER
    public DOTExporter(String type, Collection<Node> nodes, Collection<Edge> edges, String destination) throws IOException {
        this.type = type;
        this.destination = destination;
        if (type.equals("MM")) {
            dotFilePath = "work/outputs/" + destination + ".dot";
        } else {
            dotFilePath = "work/dots/" + destination + "_DOT.dot";
        }
        ensureParentDir(dotFilePath);
        OutputStreamWriter writer = new OutputStreamWriter( new FileOutputStream(dotFilePath), StandardCharsets.UTF_8);
        writer.write("digraph " + type + " {\n");
        if (type.equals("LLVMOG")){
            exportLLVMOG(writer, nodes, edges);
        } else if (type.equals("MM")) {
            exportCommon(writer, nodes, edges);
        } else {
            exportPretty(writer, nodes, edges);
        }
        writer.write("}");
        writer.close();
    }

    private void exportLLVMOG(OutputStreamWriter writer, Collection<Node> nodes, Collection<Edge> edges) throws IOException {
        for (Node node : nodes) {
            String content = node.getContent();
            String color;
            if (node.nodeLabel.contains("entry")) {
                color = "lightpink1";
            } else  if (node.nodeLabel.contains("return")) {
                content = "return";
                color = "honeydew3";
            } else {
                color = "papayawhip";
            }

            writer.write( node.getNodeId() + " [shape = record, label=\"" + node.getNodeId()+ escape(content)  + " | " + node.printVariableActions() + "\", style=filled, fillcolor=\"" + color + "\"];\n");
        }
        for (Edge edge : edges) {
            writer.write(edge.getEdgeSource().getNodeId() + " -> " + edge.getEdgeTarget().getNodeId() + " [label=\"" + escape(edge.getEdgeLabel()) + "\", id= " + edge.getEdgeId()+ "];\n");
        }
    }

    private String escape(String edgeLabel) {
        StringBuilder escapedLabel = new StringBuilder();
        for (char c : edgeLabel.toCharArray()) {
            if (c == '\"') {
                escapedLabel.append("\\");
            } else if (c == '\\') {
                escapedLabel.append("\\\\");
            } else if (c == '<') {
                escapedLabel.append("\\<");
            } else if (c == '>') {
                escapedLabel.append("\\>");
            } else {
                escapedLabel.append(c);
            }
        }
        return escapedLabel.toString();
    }

    private void exportCommon(OutputStreamWriter writer, Collection<Node> nodes, Collection<Edge> edges) throws IOException {
        int max = -1;

        if (nodes.size() == 1) {
            Node node = nodes.iterator().next();
            writer.write(String.format(
                    "  %s [label=\"%s\"];\n",
                    "1",
                    escape(node.getNodeLabel())
            ));
            return;
        }

        HashMap<Integer, Integer> mapNegativos = new HashMap<>();
        for (Node node : nodes) {
            if (node.getNodeId() > max) {
                max = node.getNodeId();
            }
        }

        max = max + 1;

        for (Node node : nodes) {
            if (node.getNodeId() < 0) {
                node.setNodeId(max);
                mapNegativos.put(node.getNodeId(), max);
                max = max + 1;
            }
            // Add node with styling
            writer.write(String.format(
                    "  %s [label=\"%s\"];\n",
                    node.getNodeId(),
                    escape(node.getNodeLabel())
            ));
        }

        writer.write("\n"); // Separate nodes and edges

        for (Edge edge : edges) {
            // Add edge with optional arrowhead styling
            Integer sourceId = edge.getEdgeSource().getNodeId();
            Integer targetId = edge.getEdgeTarget().getNodeId();
            if (mapNegativos.containsKey(sourceId)) {
                sourceId = mapNegativos.get(sourceId);
            }
            if (mapNegativos.containsKey(targetId)) {
                targetId = mapNegativos.get(targetId);
            }
            writer.write(String.format(
                    "  %s -> %s [label=\"%s\", id=%s];\n",
                    sourceId,
                    targetId,
                    escape(edge.getEdgeLabel()),
                    edge.getEdgeId()
            ));
        }
    }
    private void exportPretty(OutputStreamWriter writer, Collection<Node> nodes, Collection<Edge> edges) throws IOException {
        // Add graph-wide styling properties
        writer.write("  rankdir=TB; // Top to bottom layout\n");
        writer.write("  rank=min;\n");
        writer.write("  nodesep=0.5; // Increase node separation\n");
        writer.write("  ranksep=0.8; // Increase rank separation\n");
        // writer.write("  splines=ortho; // Straight line edges\n");
        writer.write("edge [curvature=0.3];");
        writer.write("  node [fontname=\"Helvetica\", fontsize=10];\n");
        writer.write("  edge [fontname=\"Helvetica\", fontsize=9];\n\n");

        for (Node node : nodes) {
            String color, shape;

            // Determine color and shape based on node type
            if (node.getVerdict().equals("V")) {
                color = "darkolivegreen3";
                shape = "diamond";
            } else if (node.getVerdict().equals("IV")) {
                color = "lightcoral";
                shape = "diamond";
            } else {
                color = "lightcyan2";
                shape = "ellipse";
            }

            if (node.nodeLabel.equals("START") || node.getNodeId() == 1) {
                color = "lightgoldenrod2";
                shape = "diamond";
            }
            if (node.nodeLabel.equals("RETURN")) {
                color = "lightblue4";
                shape = "diamond";
            }

            if (node.nodeLabel.equals("valid")) {
                color = "darkolivegreen3";
                shape = "diamond";
            } else if (node.nodeLabel.equals("invalid")) {
                color = "coral2";
                shape = "diamond";
            }


            // Add node with styling
            writer.write(String.format(
                    "  %s [label=\"%s\", style=filled, fillcolor=\"%s\", shape=%s, margin=\"0.15,0.15\"];\n",
                    node.getNodeId(),
                    escape(node.getNodeLabel()),
                    color,
                    shape
            ));
        }

        // Force the initial node (golden diamond) to the top rank
        for (Node node : nodes) {
            if (node.nodeLabel.equals("START") || node.getNodeId() == 1) {
                writer.write(String.format("  { rank=source; %s }\n", node.getNodeId()));
                break;
            }
        }

        writer.write("\n"); // Separate nodes and edges

        for (Edge edge : edges) {
            // Add edge with optional arrowhead styling
            String arrowhead = edge.getEdgeLabel().contains("then") ? "vee" :
                    edge.getEdgeLabel().contains("else") ? "dot" : "normal";

            writer.write(String.format(
                    "  %s -> %s [label=\"%s\", id=%s, arrowhead=%s, penwidth=1.2];\n",
                    edge.getEdgeSource().getNodeId(),
                    edge.getEdgeTarget().getNodeId(),
                    escape(truncate(edge.getEdgeLabel(), 30)),
                    edge.getEdgeId(),
                    arrowhead
            ));
        }
    }

    private String truncate(String edgeLabel, int i) {
        if (edgeLabel == null) return "";
        if (edgeLabel.contains(": then")) {
            return edgeLabel.length() > i ? edgeLabel.substring(0, i) + "...: then" : edgeLabel;
        } else if (edgeLabel.contains(": else")) {
            return edgeLabel.length() > i ? edgeLabel.substring(0, i) + "...: else" : edgeLabel;
        }
        return edgeLabel.length() > i ? edgeLabel.substring(0, i) + "..." : edgeLabel;
    }

    // Create the parent directory for an output path if it doesn't exist yet.
    // work/ is gitignored and regenerated, so the subdir scaffolding can't be
    // committed — the exporter creates it on demand.
    private static void ensureParentDir(String path) {
        File parent = new File(path).getParentFile();
        if (parent != null) {
            parent.mkdirs();
        }
    }

    public void render() {
        try {
            File outputFile = new File(type.equals("MM") ?
                    "work/outputs/" + destination + ".png" :
                    "work/renders/" + destination + ".png");
            ensureParentDir(outputFile.getPath());

            // Render with the Graphviz `dot` CLI directly. Going through graphviz-java's
            // SVG rasterizer emits "Could not create font Helvetica,sans-Serif" warnings:
            // its kitfox backend can't resolve that SVG font name through Java AWT. The
            // dot binary does its own font substitution, so the PNG renders cleanly.
            ProcessBuilder pb = new ProcessBuilder(
                    "dot", "-Tpng", dotFilePath, "-o", outputFile.getPath());
            pb.redirectErrorStream(true);
            Process process = pb.start();
            try (InputStream out = process.getInputStream()) {
                out.readAllBytes(); // drain so dot never blocks on a full pipe
            }
            if (!process.waitFor(5, TimeUnit.MINUTES)) {
                process.destroyForcibly();
                System.err.println("dot render timed out for " + dotFilePath);
            } else if (process.exitValue() != 0) {
                System.err.println("dot render failed (exit " + process.exitValue() + ") for " + dotFilePath);
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
