package hls.wbc.CustomRepositories;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
import jakarta.persistence.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.data.domain.Pageable;
import java.util.List;
@Repository
public class BaseCustomRepositoryImpl implements BaseCustomRepository {
    @PersistenceContext
    EntityManager entityManager;
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
    public PagingResponse<Object> getDataPagingList(String storeName, String findText, String sort, String sortType, int pageIndex){
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery(storeName);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramFindText, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramFindText, findText);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramSort, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramSort, sort);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramSortType, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramSortType, sortType);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramPageIndex, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_PagingList.paramPageIndex, pageIndex);

        query.registerStoredProcedureParameter(AppContants.SP_PagingList.paramPageTotal, Integer.class, ParameterMode.OUT);

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
