package hls.wbc.RepositoriesCustom;
import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.entities.User;
import hls.wbc.enums.SQLTypes;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
    public PagingResponse<List<Object>> getUserList(@Param(AppContants.SP_PagingList.paramFindText) String findText, @Param(AppContants.SP_PagingList.paramSort) String sort, @Param(AppContants.SP_PagingList.paramSortType) String sortType, @Param(AppContants.SP_PagingList.paramPageIndex) int pageIndex){
        return getDataPaging(AppContants.SP_UserGetList.spName, findText, sort, sortType, pageIndex, null);
    }
    @Query(value = AppContants.SP_UserSetDelete.exeQuery, nativeQuery = true)
    public SPResult setDeleted(@Param(AppContants.SP_UserSetDelete.paramUserId) int userId, @Param(AppContants.SP_UserSetDelete.paramUserChanged)  int userChanged, @Param(AppContants.SP_UserSetDelete.paramDeletedValue)  boolean deletedValue){

        List<SPParameter> paramList = new ArrayList<SPParameter>();

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSetDelete.paramUserId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(userId)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSetDelete.paramUserChanged)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(userChanged)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSetDelete.paramDeletedValue)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Boolean)
                .value(deletedValue)
                .build());

        return execSP(AppContants.SP_UserSetDelete.spName, paramList, false);

    }

    public SPResult save(@Param(AppContants.SP_UserSave.paramUserId) int userId, @Param(AppContants.SP_UserSave.paramUserChanged) int userChanged, @Param(AppContants.SP_UserSave.paramUName)  String uName, @Param(AppContants.SP_UserSave.paramPw)  String pw,  @Param(AppContants.SP_UserSave.paramFName) String fName, @Param(AppContants.SP_UserSave.paramMName)  String mName, @Param(AppContants.SP_UserSave.paramLName)  String lName, @Param(AppContants.SP_UserSave.paramEmail)  String email, @Param(AppContants.SP_UserSave.paramPhone)  String phone, @Param(AppContants.SP_UserSave.paramRolesId)  String rolesId){

        List<SPParameter> paramList = new ArrayList<SPParameter>();

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramUserId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(userId)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramUserChanged)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(userChanged)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramUName)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(uName)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramPw)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(pw)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramFName)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(fName)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramMName)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(mName)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramLName)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(lName)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramEmail)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(email)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramPhone)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(phone)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramRolesId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(rolesId)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_UserSave.paramOutId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Int)
                .build());

        return execSP(AppContants.SP_UserSave.spName, paramList, false);
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
