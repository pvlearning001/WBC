package hls.wbc.CustomRepositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class BaseCustomRepositoryImpl implements BaseCustomRepository {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<Object> getDataBySqlBase(String sql) {
        TypedQuery<Object> query = entityManager.createQuery(sql, Object.class);
        return query.getResultList();
    }

    @Override
    public List<Object> getDataByTableNameBase(String tableName) {
        String sql = "SELECT t FROM " + tableName + " t";
        return getDataBySqlBase(sql);
    }

    @Override
    public List<Object> getActiveDataByTableNameBase(String tableName, boolean isDeleted) {
        String where = (isDeleted)
                ? " WHERE t.isDeleted = 1"
                : " WHERE t.isDeleted = 0";
        String sql = "SELECT t FROM " + tableName + " t" + where;
        return getDataBySqlBase(sql);
    }

    @Override
    public int execQueryBase(String sql) {
        Query query = entityManager.createQuery(sql);
        return query.executeUpdate();
    }

    @Override
    public Object findByIdCustomBase(int id) {
        return entityManager.find(Object.class, id);
    }

    @Override
    public Object saveCustomBase(Object obj) {
        entityManager.persist(obj);
        return obj;
    }

    @Override
    public Object updateCustomBase(Object obj) {
        entityManager.merge(obj);
        return obj;
    }

    @Override
    public Object deleteCustomBase(int id) {
        Object obj = findByIdCustomBase(id);
        if (obj != null) {
            entityManager.remove(obj);
        }
        return obj;
    }
}
