package hls.wbc.utilities;

import java.util.List;

public class TableUtils {
    public static Object getValueCellObject(Object[] row, int colIndex){
        if (colIndex > (row.length - 1))
            return null;
        return row[colIndex];
    }

    public static Object getValueCellObject(List table, int rowIndex, int colIndex){
        if (table == null)
            return null;
        List<Object[]> tempTable = table;
        if (rowIndex > (tempTable.size() - 1))
            return null;
        Object[] row = tempTable.get(rowIndex);
        return getValueCellObject(row, colIndex);
    }
    public static String getValueCellString(Object[] row, int colIndex){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? obj.toString() : null;
    }
    public static String getValueCellString(Object[] row, int colIndex, String defaultValue){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? obj.toString() : defaultValue;
    }

    public static String getValueCellString(List table, int rowIndex, int colIndex, String defaultValue){
        Object obj = getValueCellObject(table, rowIndex, colIndex);
        return (obj != null) ? obj.toString() : defaultValue;
    }

    public static Integer getValueCellInt(Object[] row, int colIndex){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? (Integer) obj : null;
    }

    public static Integer getValueCellInt(Object[] row, int colIndex, int defaultValue){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? (Integer) obj : defaultValue;
    }

    public static Integer getValueCellInt(List table, int rowIndex, int colIndex){
        Object obj = getValueCellObject(table, rowIndex, colIndex);
        return (obj != null) ? (Integer) obj : null;
    }

    public static Integer getValueCellInt(List table, int rowIndex, int colIndex, int defaultValue){
        Object obj = getValueCellObject(table, rowIndex, colIndex);
        return (obj != null) ? (Integer) obj : defaultValue;
    }

    public static Float getValueCellFloat(Object[] row, int colIndex){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? (Float) obj : null;
    }

    public static Float getValueCellFloat(Object[] row, int colIndex, float defaultValue){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? (Float) obj : defaultValue;
    }

    public static Float getValueCellFloat(List table, int rowIndex, int colIndex){
        Object obj = getValueCellObject(table, rowIndex, colIndex);
        return (obj != null) ? (Float) obj : null;
    }

    public static Float getValueCellFloat(List table, int rowIndex, int colIndex, float defaultValue){
        Object obj = getValueCellObject(table, rowIndex, colIndex);
        return (obj != null) ? (Float) obj : defaultValue;
    }

    public static Boolean getValueCellBoolean(Object[] row, int colIndex){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? (Boolean) obj : null;
    }

    public static Boolean getValueCellBoolean(Object[] row, int colIndex, boolean defaultValue){
        Object obj = getValueCellObject(row, colIndex);
        return (obj != null) ? (Boolean) obj : defaultValue;
    }

    public static Boolean getValueCellBoolean(List table, int rowIndex, int colIndex){
        Object obj = getValueCellObject(table, rowIndex, colIndex);
        return (obj != null) ? (Boolean) obj : null;
    }

    public static Boolean getValueCellBoolean(List table, int rowIndex, int colIndex, boolean defaultValue){
        Object obj = getValueCellObject(table, rowIndex, colIndex);
        return (obj != null) ? (Boolean) obj : defaultValue;
    }
}
