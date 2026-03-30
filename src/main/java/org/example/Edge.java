package org.example;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Edge {
    private final Node edgeSource;
    private final Node edgeTarget;
    // Note: Edge ID up to Composition, refers to ID on original CFG
    private final int edgeId;
    private String edgeLabel;
    private Set<String> edgeVariables = new HashSet<>();
    private final Map<String, Set<String>> edgeActions = new HashMap<>();
    private Boolean sigmaPaired;
    private Boolean isUnlabelled = false;
    private Boolean isConditionOrBranch = false;

    // Constructor
    public Edge(Node source, Node target, String label, int id) {
        // Initialize unmod attributes
        edgeSource = source;
        edgeTarget = target;
        edgeId = id;

        // Initialize other attributes
        setEdgeLabel(label);
        setSigmaPaired(false);

    }

    // Copy Constructor
    public Edge(Node source, Node target, Edge edge) {
        // Initialize unmod attributes
        edgeSource = source;
        edgeTarget = target;
        edgeId = edge.getEdgeId();

        // Initialize other attributes
        copyEdgeAttrs(edge);
    }

    // Hash and equals
    @Override
    public int hashCode() {
        return edgeId;
    }

    @Override
    public boolean equals(Object obj) {
        boolean result = false;
        if (obj instanceof Edge) {
            result =  edgeId == ((Edge) obj).getEdgeId();
            if(result) {
                result = result && edgeTarget.equals(((Edge) obj).getEdgeTarget());
                result = result && edgeSource.equals(((Edge) obj).getEdgeSource());
                result = result && edgeLabel.equals(((Edge) obj).getEdgeLabel());
            }
        }
        return result;
    }

    // Attributes that cannot be changed

    public int getEdgeId() {
        return edgeId;
    }

    public Node getEdgeSource() {
        return edgeSource;
    }

    public Node getEdgeTarget() {
        return edgeTarget;
    }

    // Attributes that may be changed after initialization (In LabeledCFG Analysis)

    public String getEdgeLabel() {
        return edgeLabel;
    }

    public void setEdgeLabel(String newLabel) { edgeLabel = newLabel; }

    public Set<String> getedgeVariables() {
        return edgeVariables;
    }

    public void setedgeVariables(Set<String> variables) {
        edgeVariables = variables;
    }

    public void addEdgeVariableAndAction(String variable, String action) {
        if (action.equals("Read") || action.equals("Write")) {
            if (edgeVariables != null) {
                edgeVariables.add(variable);
            }
            edgeActions.computeIfAbsent(variable, k -> new HashSet<>()).add(action);
        }
    }

    public Map<String, Set<String>> getEdgeActions() {
        return edgeActions;
    }

    public void setEdgeActions(Map<String, Set<String>> actions) {
        edgeActions.putAll(actions);
    }

    public Boolean isSigmaPaired() {
        return sigmaPaired;
    }

    public void setSigmaPaired(Boolean paired) {
        sigmaPaired = paired;
    }

    public Boolean isConditionOrBranch() {
        return isConditionOrBranch;
    }

    public void setEdgeConditionOrBranch(boolean b) {
        isConditionOrBranch = b;
    }

    public Boolean isUnlabelled() {
        return isUnlabelled;
    }

    public void setUnlabelled(Boolean unlabelled) {
        isUnlabelled = unlabelled;
    }

    // Copy the attributes of the template edge to the current edge
    public void copyEdgeAttrs(Edge templateEdge) {
        if (templateEdge.getEdgeLabel() != null) {
            setEdgeLabel(templateEdge.getEdgeLabel());
        }
        if (templateEdge.getedgeVariables() != null) {
            setedgeVariables(templateEdge.getedgeVariables());
        }
        if (templateEdge.getEdgeActions() != null) {
            setEdgeActions(templateEdge.getEdgeActions());
        }
        if (templateEdge.isSigmaPaired() != null) {
            setSigmaPaired(templateEdge.isSigmaPaired());
        }
        if (templateEdge.isUnlabelled() != null) {
            setUnlabelled(templateEdge.isUnlabelled());
        }
        if (templateEdge.isConditionOrBranch() != null) {
            setEdgeConditionOrBranch(templateEdge.isConditionOrBranch());
        }
    }

}
