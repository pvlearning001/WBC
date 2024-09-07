package hls.wbc.RepositoriesCustom;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.enums.SQLTypes;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class BaseCustomRepositoryImpl implements BaseCustomRepository {
    //@PersistenceContext
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
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

    @Override
    @Transactional
    public SPResult execSP(String storeName, List<SPParameter> parameters, boolean isGetTable){
        SPResult result = new SPResult();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery(storeName);
        parameters.forEach(param -> param.addToQuery(query));

        boolean execResult = query.execute();

        result.setExecResult(execResult);
        List<SPParameter> outValues = new ArrayList<SPParameter>();
        parameters.forEach(param -> {
            if (param.getMode() == ParameterMode.OUT) {
                Object outValue = param.getOutValue(query);
                param.setValue(outValue);
                outValues.add(param);
            }
        });

        result.addOutValueList(outValues);
        if (isGetTable) {
            List table = query.getResultList();
            result.addTableData(table);
        }
        return result;
    }

    @Override
    @Transactional
    public PagingResponse<List<Object>> getDataPaging(String spName, String findText, String sort, String sortType, int pageIndex, List<SPParameter> paramsExt){

        if (pageIndex == 0)
            pageIndex = 1;

        List<SPParameter> paramList = new ArrayList<SPParameter>();

        if (paramsExt != null && !paramsExt.isEmpty())
            paramList.addAll(paramsExt);

        paramList.add(SPParameter.builder()
                        .name(AppContants.SP_PagingList.paramFindText)
                        .mode(ParameterMode.IN)
                        .type(SQLTypes.String)
                        .value(findText)
                        .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_PagingList.paramSort)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(sort)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_PagingList.paramSortType)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(sortType)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_PagingList.paramPageIndex)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(pageIndex)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_PagingList.paramPageTotal)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Int)
                .build());

        SPResult spResult = execSP(spName, paramList, true);

        int pageTotal = 0;
        Object pageTotalObj = spResult.getOutValue(AppContants.SP_PagingList.paramPageTotal);
        if (pageTotalObj != null)
            pageTotal = Integer.parseInt(pageTotalObj.toString());

        return PagingResponse.<List<Object>>builder()
                .pageIndex(pageIndex)
                .pageTotal(pageTotal)
                .execResult(spResult.isExecResult())
                .pageResult(spResult.getTable())
                .outValues(spResult.getOutValues())
                .build();
    }
}
