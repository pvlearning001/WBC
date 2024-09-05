package hls.wbc.RepositoriesCustom;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.enums.SQLTypes;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.data.domain.Pageable;
import java.util.List;
@Repository
public class BaseCustomRepositoryImpl implements BaseCustomRepository {
    @PersistenceContext
    protected EntityManager entityManager;
    @Override
    public List<Object> baseCustomGetDataBySql(String sql) {
        TypedQuery<Object> query = entityManager.createQuery(sql, Object.class);
        return query.getResultList();
    }

    @Override
    public List<Object> baseCustomGetDataBySqlPaging(String sql, Pageable pageable) {
        TypedQuery<Object> query = entityManager.createQuery(sql, Object.class);
        int firstIndex = (int) pageable.getOffset();
        return query
                .setFirstResult(firstIndex)
                .setMaxResults(pageable.getPageSize())
                .getResultList();
    }

    @Override
    public List<Object> baseCustomGetDataByTableName(String tableName) {
        String sql = "SELECT t FROM " + tableName + " t";
        return baseCustomGetDataBySql(sql);
    }

    @Override
    public List<Object> baseCustomGetActiveDataByTableName(String tableName, boolean isDeleted) {
        String where = (isDeleted)
                ? " WHERE t.isDeleted = 1"
                : " WHERE t.isDeleted = 0";
        String sql = "SELECT t FROM " + tableName + " t" + where;
        return baseCustomGetDataBySql(sql);
    }

    @Override
    public int baseCustomGetMaxId(String tableName) {
        String sql = "SELECT MAX(t.id) AS MaxId FROM " + tableName + " t";
        TypedQuery<Object> query = entityManager.createQuery(sql, Object.class);
        String stringResult = query.getSingleResult().toString();
        return Integer.parseInt(stringResult);
    }

    @Override
    public Object baseCustomFindById(int id) {
        return entityManager.find(Object.class, id);
    }

    @Override
    @Transactional
    public int baseCustomExecQuery(String sql) {
        //Query query = entityManager.createQuery(sql);
        Query query = entityManager.createNativeQuery(sql);
        return query.executeUpdate();
    }

    @Override
    @Transactional
    public Object baseCustomSave(Object obj) {
        entityManager.persist(obj);
        return obj;
    }

    @Override
    @Transactional
    public Object baseCustomUpdate(Object obj) {
        entityManager.merge(obj);
        return obj;
    }

    @Override
    @Transactional
    public Object baseCustomDelete(int id) {
        Object obj = baseCustomFindById(id);
        if (obj != null) {
            entityManager.remove(obj);
        }
        return obj;
    }

    public void addMoreInParams(StoredProcedureQuery query, List<String> paramsExtName, List<SQLTypes> paramsExtType, List<Object> paramsExtValue){
        if (paramsExtName != null && paramsExtName.size() > 0){
            for(int i = 0; i < paramsExtName.size(); i++){
                if (paramsExtType.get(i) == SQLTypes.Int){
                    int paramValue = (Integer) paramsExtValue.get(i);
                    query.registerStoredProcedureParameter(paramsExtName.get(i), Integer.class, ParameterMode.IN);
                    query.setParameter(paramsExtName.get(i), paramValue);
                }
                else if (paramsExtType.get(i) == SQLTypes.String) {
                    String paramValue = paramsExtValue.get(i).toString();
                    query.registerStoredProcedureParameter(paramsExtName.get(i), String.class, ParameterMode.IN);
                    query.setParameter(paramsExtName.get(i), paramValue);
                }
                else {
                    Boolean paramValue = (Boolean) paramsExtValue.get(i);
                    query.registerStoredProcedureParameter(paramsExtName.get(i), Boolean.class, ParameterMode.IN);
                    query.setParameter(paramsExtName.get(i), paramValue);
                }
            }
        }
    }

    public void addMoreOutParams(StoredProcedureQuery query, List<String> paramsExtName, List<SQLTypes> paramsExtType, List<Object> paramsExtValue){
        if (paramsExtName != null && paramsExtName.size() > 0){
            for(int i = 0; i < paramsExtName.size(); i++){
                if (paramsExtType.get(i) == SQLTypes.Int){
                    int paramValue = (Integer) paramsExtValue.get(i);
                    query.registerStoredProcedureParameter(paramsExtName.get(i), Integer.class, ParameterMode.OUT);
                }
                else if (paramsExtType.get(i) == SQLTypes.String) {
                    String paramValue = paramsExtValue.get(i).toString();
                    query.registerStoredProcedureParameter(paramsExtName.get(i), String.class, ParameterMode.OUT);
                }
                else {
                    Boolean paramValue = (Boolean) paramsExtValue.get(i);
                    query.registerStoredProcedureParameter(paramsExtName.get(i), Boolean.class, ParameterMode.OUT);
                }
            }
        }
    }

    @Override
    @Transactional
    public PagingResponse<Object> getDataPagingList(String storeName, String findText, String sort, String sortType, int pageIndex, List<String> paramsExtInName, List<SQLTypes> paramsExtInType, List<Object> paramsExtInValue, List<String> paramsExtOutName, List<SQLTypes> paramsExtOutType, List<Object> paramsExtOutValue){

        StoredProcedureQuery query = entityManager.createStoredProcedureQuery(storeName);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramFindText, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramFindText, findText);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramSort, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramSort, sort);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramSortType, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramSortType, sortType);

        if (pageIndex == 0)
            pageIndex = 1;
        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramPageIndex, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramPageIndex, pageIndex);

        addMoreInParams(query, paramsExtInName, paramsExtInType, paramsExtInValue);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramPageTotal, Integer.class, ParameterMode.OUT);

        addMoreOutParams(query, paramsExtOutName, paramsExtOutType, paramsExtOutValue);

        int pageTotal = Integer.parseInt(query.getOutputParameterValue(AppContants.SP_PagingList.paramPageTotal).toString());
        query.execute();
        List<Object> list = query.getResultList();
        return PagingResponse.<Object>builder()
                .pageIndex(pageIndex)
                .pageTotal(pageTotal)
                .pageResult(list)
                .build();
    }
}
