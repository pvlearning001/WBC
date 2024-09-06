package hls.wbc.RepositoriesCustom;

import hls.wbc.constants.AppContants;
import hls.wbc.enums.SQLTypes;
import jakarta.persistence.Entity;
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

    StoredProcedureQuery addToQuery(StoredProcedureQuery query){
        switch (this.type){
            case SQLTypes.Int:
                int valueInt = (Integer) this.value;
                query.registerStoredProcedureParameter(name, Integer.class, this.mode);
                if (this.mode != ParameterMode.OUT)
                    query.setParameter(name, valueInt);
                break;
            case SQLTypes.Boolean:
                boolean valueBoolean = (Boolean) this.value;
                query.registerStoredProcedureParameter(name, Boolean.class, this.mode);
                if (this.mode != ParameterMode.OUT)
                    query.setParameter(name, valueBoolean);
                break;
            case SQLTypes.Float:
                float valueFloat = (Float) this.value;
                query.registerStoredProcedureParameter(name, Float.class, this.mode);
                if (this.mode != ParameterMode.OUT)
                    query.setParameter(name, valueFloat);
                break;
            default:
                String valueString = this.value.toString();
                query.registerStoredProcedureParameter(name, String.class, this.mode);
                if (this.mode != ParameterMode.OUT)
                    query.setParameter(name, valueString);
                break;
        }
        return query;
    }

    public Object getOutValue(StoredProcedureQuery query){
        if (this.mode != ParameterMode.IN)
            return query.getOutputParameterValue(this.name);
        return null;
    }
}
