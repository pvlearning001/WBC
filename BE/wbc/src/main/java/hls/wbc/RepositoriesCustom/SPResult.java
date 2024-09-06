package hls.wbc.RepositoriesCustom;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SPResult {
    boolean execResult;
    List<SPParameter> outValues = new ArrayList<SPParameter>();
    List<Object> table = new ArrayList<Object>();

    public SPResult(){
        execResult = false;
        outValues = new ArrayList<SPParameter>();
        table = new ArrayList<Object>();
    }

    public void addOutValue(SPParameter outValue){
        outValues.add(outValue);
    }
    public void addOutValueList(List<SPParameter> outValueList){
        if (this.outValues == null)
            outValues = new ArrayList<SPParameter>();
        if (outValueList != null)
            this.outValues.addAll(outValueList);
    }
    public void addTableData(List<Object> tableData){
        if (this.table == null)
            table = new ArrayList<Object>();
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
