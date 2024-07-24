package hls.wbc.CustomRepositories;

import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BaseCustomRepository {
    List<Object> baseCustomGetDataBySql(String sql);
    List<Object> baseCustomGetDataByTableName(String tableName);
    List<Object> baseCustomGetActiveDataByTableName(String tableName, boolean isDeleted);
    int baseCustomGetMaxId(String tableName);
    int baseCustomExecQuery(String sql);
    Object baseCustomFindById(int id);
    Object baseCustomSave(Object t);
    Object baseCustomUpdate(Object t);
    Object baseCustomDelete(int id);
}
