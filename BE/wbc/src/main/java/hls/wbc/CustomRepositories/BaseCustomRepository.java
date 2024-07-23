package hls.wbc.CustomRepositories;

import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BaseCustomRepository {
    List<Object> getDataBySqlBase(String sql);
    List<Object> getDataByTableNameBase(String tableName);
    List<Object> getActiveDataByTableNameBase(String tableName, boolean isDeleted);
    int execQueryBase(String sql);
    Object findByIdCustomBase(int id);
    Object saveCustomBase(Object t);
    Object updateCustomBase(Object t);
    Object deleteCustomBase(int id);
}
