package hls.wbc.RepositoriesCustom;

import hls.wbc.dto.responses.PagingResponse;
import org.springframework.stereotype.Repository;

import org.springframework.data.domain.Pageable;
import java.util.List;
@Repository
public interface BaseCustomRepository {
    List<Object> baseCustomGetDataBySql(String sql);

    List<Object> baseCustomGetDataBySqlPaging(String sql, Pageable pageable);
    List<Object> baseCustomGetDataByTableName(String tableName);
    List<Object> baseCustomGetActiveDataByTableName(String tableName, boolean isDeleted);
    int baseCustomGetMaxId(String tableName);
    int baseCustomExecQuery(String sql);
    Object baseCustomFindById(int id);
    Object baseCustomSave(Object t);
    Object baseCustomUpdate(Object t);
    Object baseCustomDelete(int id);
    PagingResponse<Object> getDataPagingList(String storeName, String findText, String sort, String sortType, int pageIndex);
}
