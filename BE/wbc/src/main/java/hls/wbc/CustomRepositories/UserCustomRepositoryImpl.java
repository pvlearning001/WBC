package hls.wbc.CustomRepositories;
import hls.wbc.entities.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserCustomRepositoryImpl extends BaseCustomRepositoryImpl implements UserCustomRepository {

    private List<User> toUserList(List<Object> objList){
        return objList.stream()
                .map(element->(User) element)
                .toList();
    }

    private User toUser(Object obj){
        return (User) obj;
    }

    public List<User> getDataBySql(String sql) {
        List<Object> objList = super.getDataBySqlBase(sql);
        return toUserList(objList);
    }


    public List<User> getDataByTableName(String tableName) {
        List<Object> objList = super.getDataByTableNameBase(tableName);
        return toUserList(objList);
    }


    public List<User> getActiveDataByTableName(String tableName, boolean isDeleted) {
        List<Object> objList = super.getDataByTableNameBase(tableName);
        return toUserList(objList);
    }


    public int execQuery(String sql) {
        return super.execQueryBase(sql);
    }


    public User findByIdCustom(int id) {
        Object obj = super.findByIdCustomBase(id);
        return toUser(obj);
    }


    public User saveCustom(Object object) {
        Object obj = super.saveCustomBase(object);
        return toUser(obj);
    }


    public User updateCustom(Object object) {
        Object obj = super.saveCustomBase(object);
        return toUser(obj);
    }


    public User deleteCustom(int id) {
        Object obj = super.deleteCustomBase(id);
        return toUser(obj);
    }
}
