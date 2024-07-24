package hls.wbc.CustomRepositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Repository
public class BaseCustomRepositoryImpl implements BaseCustomRepository {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<Object> baseCustomGetDataBySql(String sql) {
        TypedQuery<Object> query = entityManager.createQuery(sql, Object.class);
        return query.getResultList();
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
}
