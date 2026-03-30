package org.example;

import com.kitfox.svg.A;
import org.javatuples.Tuple;
import javax.lang.model.type.ArrayType;
import java.lang.reflect.Array;
import java.util.*;
import java.util.stream.Collectors;

// TODO: Distintas Clases de nodos? Que extiendan nodo, no sé
public class Node {
    // Fields from all Nodes
    private Integer nodeId;
    private String type;
    protected String nodeLabel;
    private ArrayList<Node> children = new ArrayList<>();
    private ArrayList<Node> parents = new ArrayList<>();
    private Boolean isFinal = false;

    // Fields from LLVM Nodes
    protected String llvmId = "undef";
    protected ArrayList<String> instructions = new ArrayList<>();
    protected String basicBlockLabel = "undef";
    protected Set<String> variableReads = new HashSet<>();
    protected Set<String> variableWrites = new HashSet<>();
    protected Map<String, String> switchCases = new HashMap<>();

    // Fields from Composed Nodes
    private Integer OPNodeId = -1;
    private Integer PUANodeId = -1;
    private Map<String, int[]> variableConsistencies = new HashMap<>();
    private Boolean isConsistent = false;
    private Boolean isCompExit = false;

    // Fields from Composed Verdict Nodes
    private String prefixVerdict = "";
    private String verdict = "";

    // Constructor for llvm generated Nodes
    public Node(Integer id, String llvmId, String basicBlocklabel, String instructions) {
        this.nodeId = id;
        this.llvmId = llvmId;
        this.basicBlockLabel = basicBlocklabel;
        this.instructions = new ArrayList<>(Arrays.asList(instructions.split("\\\\l ")));
        this.nodeLabel = basicBlocklabel;
        this.type = "LLVM";
    }

    // Constructor for classic single-state nodes
    public Node(Integer id, String label) {
        this.nodeId = id;
        this.nodeLabel = label;
        this.variableConsistencies = new HashMap<>();
        this.type = "Single";
        if (label.equals("RETURN")) {
            isFinal = true;
        }
    }

    // Constructor to replace CompNode functionality
    public Node(Integer id, int OPNodeId, int PUANodeId, Map<String, int[]> variableConsistenciesMap) {
        this.nodeId = id;
        this.OPNodeId = OPNodeId;
        this.PUANodeId = PUANodeId;
        this.variableConsistencies = variableConsistenciesMap;

        // Generate label dynamically to include synchronization details
        this.nodeLabel = OPNodeId + ", " + PUANodeId + ", " + variableConsistenciesMap.entrySet()
                .stream()
                .map(entry -> entry.getKey() + "=" + Arrays.toString(entry.getValue()))
                .collect(Collectors.joining(", "));

        this.type = "Composed";

        // Check if variable consistencies are intact
        boolean consistentCompNode = true;
        for (int[] varConsistency : variableConsistenciesMap.values()) {
            if (varConsistency[0] != 0 || varConsistency[1] != 0) {
                consistentCompNode = false;
                break;
            }
        }
        isConsistent = consistentCompNode;
    }

    // Constructor for Verdict Nodes
    public Node(Integer id, String prefixVer, String ver) {
        this.nodeId = id;
        this.type = "Verdict";
        setPrefixVerdict(prefixVer);
        setVerdict(ver);
    }


    // Functions for all nodes
    public Boolean isFinal() {
        return isFinal;
    }

    public String getNodeLabel() {
        return nodeLabel;
    }

    public void setNodeLabel(String label) {
        nodeLabel = label;
    }

    public Integer getNodeId () {
        return nodeId;
    }


    // Composed node functions
    public boolean isConsistentNode() {
        return isConsistent;
    }

    public void setCompExit(Boolean exit) {
        isCompExit = exit;
    }

    public boolean isCompExit() {
        return isCompExit;
    }

    public Integer getOPNodeId() {
        if (type.equals("Composed")) {
            return OPNodeId;
        } else throw new IllegalArgumentException("Node is not composed");
    }

    public Integer getPUANodeId() {
        if (type.equals("Composed")) {
            return PUANodeId;
        } else throw new IllegalArgumentException("Node is not composed");
    }

    public int getVarConsistency(String variable, String CFGtype) {
        if (type.equals("Composed")) {
            if (!variableConsistencies.containsKey(variable)) {
                throw new IllegalArgumentException("Variable not found: " + variable);
            } else {
                return variableConsistencies.get(variable)[CFGtype.equals("PUA") ? 1 : 0];
            }
        } else throw new IllegalArgumentException("Node is not composed");
    }


    // Verdict functions
    public String getVerdictLabel() {
        if (type.equals("Verdict")) {
            if (prefixVerdict.isEmpty()) {
                if (verdict.isEmpty()) {
                    return "";
                } else {
                    return verdict;
                }
            } else {
                if (verdict.isEmpty()) {
                    return prefixVerdict;
                } else {
                    return prefixVerdict + ", " + verdict;
                }
            }
        }
        throw new IllegalArgumentException("Node is not Verdict");
    }

    public String getPrefixVerdict() {
        return prefixVerdict;
    }

    public void setPrefixVerdict(String prefixVer) {
        if (type.equals("Composed") || type.equals("Verdict") && isValidPrefix(prefixVer)) {
            prefixVerdict = prefixVer;
            type = "Verdict";
            nodeLabel = getVerdictLabel();
        } else throw new IllegalArgumentException("Wrong type or invalid prefix");
    }

    public String getVerdict() {
        return verdict;
    }

    public void setVerdict(String ver) {
        if ((type.equals("Composed") || type.equals("Verdict")) && isValidVer(ver)) {
            verdict = ver;
            type = "Verdict";
            nodeLabel = getVerdictLabel();
        } else throw new IllegalArgumentException("Wrong type or invalid ver");
    }

    public String printVariableActions() {
        StringBuilder actions = new StringBuilder();

        if (!variableReads.isEmpty()) {
            actions.append("Reads: [")
                    .append(String.join(" ; ", variableReads))
                    .append("]");
        }

        if (!variableWrites.isEmpty()) {
            if (!variableReads.isEmpty()) actions.append(" \\l "); // Ensures spacing if reads exist
            actions.append("Writes: [")
                    .append(String.join(" : ", variableWrites))
                    .append("]");
        }

        return actions.toString();
    }

    public String getContent() {
        StringBuilder content = new StringBuilder();
        for (String inst : instructions) {
            if (inst != null) {
            String instParsed = inst.replace("\\l...", "");
            content.append(instParsed + "\\l");
            }
        }
        return content.toString();
    }

    public Integer getLocation() {
        return Integer.parseInt(this.llvmId);
    }

    // Parent-child relationships
    public void addChild(Node child) {
        children.add(child);
    }

    public ArrayList<Node> getChildren() {
        return children;
    }

    public void addParent(Node parent) {
        parents.add(parent);
    }

    public ArrayList<Node> getParents() {
        return parents;
    }

    // Override equals to compare all synchronization properties
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Node that = (Node) o;
        return Objects.equals(OPNodeId, that.OPNodeId) &&
                Objects.equals(PUANodeId, that.PUANodeId) &&
                Objects.equals(variableConsistencies, that.variableConsistencies) &&
                Objects.equals(prefixVerdict, that.prefixVerdict) &&
                Objects.equals(verdict, that.verdict) &&
                Objects.equals(nodeLabel, that.nodeLabel) &&
                Objects.equals(type, that.type) &&
                Objects.equals(nodeId, that.nodeId) &&
                Objects.equals(isConsistent, that.isConsistent) &&
                Objects.equals(isCompExit, that.isCompExit);
    }

    @Override
    public int hashCode() {
        return Objects.hash(OPNodeId, PUANodeId, variableConsistencies);
    }

    // Auxiliary
    private boolean isValidVer(String ver) {
        return ver != null && (ver.isEmpty() || ver.equals("V") || ver.equals("IV"));
    }

    private boolean isValidPrefix(String ver) {
        return ver != null && (ver.isEmpty() || ver.equals("NV") || ver.equals("IVP"));
    }

    public void setNodeId(int newId) {
        nodeId = newId;
    }

    public void setSwitchCases(Map<String, String> cases) {
        switchCases = cases;
    }
}