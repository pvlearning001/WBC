package hls.wbc.CustomRepositories;
import hls.wbc.entities.User;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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

    @Query(value = "CALL sp_TestGetUsersData(:userIdIndex);", nativeQuery = true)
    public List<Object> getUsersRoles(@Param("userIdIndex") int userIdIndex){
        StoredProcedureQuery query2 = entityManager.createStoredProcedureQuery("sp_GetUsersData");
        query2.registerStoredProcedureParameter("userIdIndex", Integer.class, ParameterMode.IN);

        query2.registerStoredProcedureParameter("pageTotal", Integer.class, ParameterMode.OUT);
        query2.setParameter("userIdIndex", userIdIndex);

        query2.execute();
        Object objPageTotal = query2.getOutputParameterValue("pageTotal");
        List<Object> res = query2.getResultList();
        return res;

    }

    @Query(value = "CALL sp_TestGetUsersData(:userIdIndex);", nativeQuery = true)
    public List<Object> getUsersRoles2(@Param("userIdIndex") int userIdIndex){
        StoredProcedureQuery query2 = entityManager.createStoredProcedureQuery("sp_GetUsersData");
        query2.registerStoredProcedureParameter("userIdIndex", Integer.class, ParameterMode.IN);
        query2.setParameter("userIdIndex", userIdIndex);

        query2.execute();
        List<Object> res = query2.getResultList();
        return res;

    }

    public List<Object> getAllUserDetailsPaging(Pageable pageable){
        String sql = "SELECT ue, u FROM User u INNER JOIN UserExt ue ON u.id = ue.userId where u.isDeleted = false and ue.isDeleted = false order by u.id desc";
        return baseCustomGetDataBySqlPaging(sql, pageable);
    }
}
