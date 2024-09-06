package hls.wbc.RepositoriesCustom;

import hls.wbc.enums.SQLTypes;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SPParameter {
    String name;
    SQLTypes type;
    Object value;
    ParameterMode mode;

    void addToQuery(StoredProcedureQuery query){
        switch (this.type){
            case SQLTypes.Int:
                query.registerStoredProcedureParameter(name, Integer.class, this.mode);
                if (this.mode != ParameterMode.OUT) {
                    int valueInt = (this.value != null)
                            ? (Integer) this.value
                            : 0;
                    query.setParameter(name, valueInt);
                }
                break;
            case SQLTypes.Boolean:
                query.registerStoredProcedureParameter(name, Boolean.class, this.mode);
                if (this.mode != ParameterMode.OUT) {
                    boolean valueBoolean = (this.value != null)
                            ? (Boolean) this.value
                            : false;
                    query.setParameter(name, valueBoolean);
                }
                break;
            case SQLTypes.Float:
                query.registerStoredProcedureParameter(name, Float.class, this.mode);
                if (this.mode != ParameterMode.OUT) {
                    float valueFloat = (this.value != null)
                            ? (Float) this.value
                            : 0;
                    query.setParameter(name, valueFloat);
                }
                break;
            default:
                query.registerStoredProcedureParameter(name, String.class, this.mode);
                if (this.mode != ParameterMode.OUT) {
                    String valueString = (this.value != null)
                            ? this.value.toString()
                            : null;
                    query.setParameter(name, valueString);
                }
                break;
        }
    }

    public Object getOutValue(StoredProcedureQuery query){
        if (this.mode != ParameterMode.IN)
            return query.getOutputParameterValue(this.name);
        return null;
    }
}
