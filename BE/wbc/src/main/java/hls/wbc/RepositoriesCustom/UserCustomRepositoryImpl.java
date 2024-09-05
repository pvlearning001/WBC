package hls.wbc.RepositoriesCustom;
import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
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

    @Query(value = AppContants.SP_UserGetList.exeQuery, nativeQuery = true)
    public PagingResponse getUserList(@Param(AppContants.SP_PagingList.paramFindText) String findText, @Param(AppContants.SP_PagingList.paramSort) String sort, @Param(AppContants.SP_PagingList.paramSortType) String sortType, @Param(AppContants.SP_PagingList.paramPageIndex) int pageIndex){
        return getDataPagingList(AppContants.SP_UserGetList.storeName, findText, sort, sortType, pageIndex, null, null, null, null, null, null);
    }
    @Query(value = AppContants.SP_UserSetDelete.exeQuery, nativeQuery = true)
    public boolean setDeleted(@Param(AppContants.SP_UserSetDelete.paramUserId) int userId, @Param(AppContants.SP_UserSetDelete.paramUserChanged)  int userChanged, @Param(AppContants.SP_UserSetDelete.paramDeletedValue)  boolean deletedValue){

        StoredProcedureQuery query = entityManager.createStoredProcedureQuery(AppContants.SP_UserSetDelete.storeName);

        query.registerStoredProcedureParameter(AppContants.SP_UserSetDelete.paramUserId, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSetDelete.paramUserId, userId);

        query.registerStoredProcedureParameter(AppContants.SP_UserSetDelete.paramUserChanged, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSetDelete.paramUserChanged, userChanged);

        query.registerStoredProcedureParameter(AppContants.SP_UserSetDelete.paramDeletedValue, Boolean.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSetDelete.paramDeletedValue, deletedValue);

        return query.execute();

    }

    public int save(@Param(AppContants.SP_UserSave.paramUserId) int userId, @Param(AppContants.SP_UserSave.paramUserChanged) int userChanged, @Param(AppContants.SP_UserSave.paramUName)  String uName, @Param(AppContants.SP_UserSave.paramPw)  String pw,  @Param(AppContants.SP_UserSave.paramFName) String fName, @Param(AppContants.SP_UserSave.paramMName)  String mName, @Param(AppContants.SP_UserSave.paramLName)  String lName, @Param(AppContants.SP_UserSave.paramEmail)  String email, @Param(AppContants.SP_UserSave.paramPhone)  String phone, @Param(AppContants.SP_UserSave.paramRolesId)  String rolesId){

        StoredProcedureQuery query = entityManager.createStoredProcedureQuery(AppContants.SP_UserSave.storeName);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramUserId, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramUserId, userId);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramUserChanged, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramUserChanged, userChanged);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramUName, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramUName, uName);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramPw, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramPw, pw);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramFName, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramFName, fName);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramMName, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramMName, mName);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramLName, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramLName, lName);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramEmail, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramEmail, email);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramPhone, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramPhone, phone);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramRolesId, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_UserSave.paramRolesId, rolesId);

        query.registerStoredProcedureParameter(AppContants.SP_UserSave.paramOutId, Integer.class, ParameterMode.OUT);
        int result = Integer.parseInt(query.getOutputParameterValue(AppContants.SP_UserSave.paramOutId).toString());

        query.execute();

        return result;
    }

    //  Test function
    @Query(value = "CALL sp_TestGetUsersData(:userIdIndex);", nativeQuery = true)
    public List<Object> getUsersRoles(@Param("userIdIndex") int userIdIndex){
        StoredProcedureQuery query2 = entityManager.createStoredProcedureQuery("sp_TestGetUsersData");
        query2.registerStoredProcedureParameter("userIdIndex", Integer.class, ParameterMode.IN);

        query2.registerStoredProcedureParameter("pageTotal", Integer.class, ParameterMode.OUT);

        query2.registerStoredProcedureParameter("pageTotal2", Integer.class, ParameterMode.OUT);

        query2.setParameter("userIdIndex", userIdIndex);

        query2.execute();
        Object objPageTotal = query2.getOutputParameterValue("pageTotal");
        Object objPageTotal2 = query2.getOutputParameterValue("pageTotal2");
        return (List<Object>) query2.getResultList();

    }

    //  Test function
    @Query(value = "CALL sp_TestGetUsersData(:userIdIndex);", nativeQuery = true)
    public List<Object> getUsersRoles2(@Param("userIdIndex") int userIdIndex){
        StoredProcedureQuery query2 = entityManager.createStoredProcedureQuery("sp_GetUsersData");
        query2.registerStoredProcedureParameter("userIdIndex", Integer.class, ParameterMode.IN);
        query2.setParameter("userIdIndex", userIdIndex);

        query2.execute();
        return (List<Object>) query2.getResultList();

    }

    //  Test function
    public List<Object> getAllUserDetailsPaging(Pageable pageable){
        String sql = "SELECT ue, u FROM User u INNER JOIN UserExt ue ON u.id = ue.userId where u.isDeleted = false and ue.isDeleted = false order by u.id desc";
        return baseCustomGetDataBySqlPaging(sql, pageable);
    }
}
