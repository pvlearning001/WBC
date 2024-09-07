package hls.wbc.RepositoriesCustom;

import jakarta.persistence.Entity;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder
public class SPResult {
    boolean execResult;
    List<SPParameter> outValues;
    List table;

    public void addOutValue(SPParameter outValue){
        outValues.add(outValue);
    }
    public void addOutValueList(List<SPParameter> outValueList){
        if (this.outValues == null)
            outValues = new ArrayList<SPParameter>();
        if (outValueList != null)
            this.outValues.addAll(outValueList);
    }
    public void addTableData(List tableData){
        if (this.table == null)
            table = new ArrayList();
        if (tableData != null)
            this.table.addAll(tableData);
    }

    public Object getOutValue(String paramName){
        for(SPParameter item: outValues){
            if (item.getName().equals(paramName))
                return item.getValue();
        }
        return null;
    }

}
