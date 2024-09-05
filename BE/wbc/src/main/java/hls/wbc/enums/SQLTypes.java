package hls.wbc.enums;

public enum SQLTypes {
    Int("Int"),
    String("String"),
    Boolean("Boolean")
    ;

    SQLTypes(String typeName) {
        this.typeName = typeName;
    }
    private String typeName;
}
