package hls.wbc.CustomRepositories;

import hls.wbc.entities.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserCustomRepository {
    List<User> getDataBySql(String sql);
    List<User> getDataByTableName(String tableName);
    List<User> getActiveDataByTableName(String tableName, boolean isDeleted);
    int execQuery(String sql);
    User findByIdCustom(int id);
    User saveCustom(Object t);
    User updateCustom(Object t);
    User deleteCustom(int id);
}
