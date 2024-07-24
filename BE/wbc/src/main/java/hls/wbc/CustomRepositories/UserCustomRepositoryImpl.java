package hls.wbc.CustomRepositories;
import hls.wbc.entities.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//@Repository
public class UserCustomRepositoryImpl extends BaseCustomRepositoryImpl implements UserCustomRepository {

    private  static final String tableName = "User";

    private List<User> toEntityList(List<Object> objList){
        return objList.stream()
                .map(element->(User) element)
                .toList();
    }

    private User toEntity(Object obj){
        return (User) obj;
    }

    public List<User> customGetDataBySql(String sql) {
        List<Object> objList = super.baseCustomGetDataBySql(sql);
        return toEntityList(objList);
    }

    public List<User> customGetAllData() {
        List<Object> objList = super.baseCustomGetDataByTableName(tableName);
        return toEntityList(objList);
    }

    public int customGetMaxId(){
        return baseCustomGetMaxId(tableName);
    }

    public List<User> customGetActiveData(boolean isDeleted) {
        List<Object> objList = super.baseCustomGetDataByTableName(tableName);
        return toEntityList(objList);
    }

    @Transactional
    public int customExecQuery(String sql) {
        return super.baseCustomExecQuery(sql);
    }


    public User customFindByIdCustom(int id) {
        Object obj = super.baseCustomFindById(id);
        return toEntity(obj);
    }

    @Transactional
    public User customSave(Object object) {
        Object obj = super.baseCustomSave(object);
        return toEntity(obj);
    }

    @Transactional
    public User customUpdate(Object object) {
        Object obj = super.baseCustomSave(object);
        return toEntity(obj);
    }

    @Transactional
    public User customDelete(int id) {
        Object obj = super.baseCustomDelete(id);
        return toEntity(obj);
    }
}
