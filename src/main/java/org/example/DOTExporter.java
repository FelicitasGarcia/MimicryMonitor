package org.example;

import guru.nidi.graphviz.engine.Engine;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.engine.GraphvizCmdLineEngine;

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
            dotFilePath = "llvm/feli/outputs/" + destination + ".dot";
        } else {
            dotFilePath = "exampleFiles/dots/" + destination + "_DOT.dot";
        }
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

    public void render() {
        try {
            File dotFile = new File(dotFilePath);
            // Use neato engine for better node distribution
            GraphvizCmdLineEngine engine =  new GraphvizCmdLineEngine();
            engine.timeout(5, TimeUnit.MINUTES);

            File outputFile = new File(type.equals("MM") ?
                    "llvm/feli/outputs/" + destination + ".png" :
                    "exampleFiles/renders/" + destination + ".png");

            Graphviz.useEngine(engine);
            Graphviz.fromFile(dotFile)
                    .totalMemory(1024*1024*1024) // 1GB memory for large graphs
                    .render(Format.PNG)
                    .toFile(outputFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
