package hls.wbc.RepositoriesCustom;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NewsCustomRepository {
    PagingResponse<List<Object>> getList(int cateId, String findText, String sort,
                                         String sortType, int pageIndex);
    SPResult setDeleted(int id, int userChanged, boolean deletedValue);
    SPResult setShow(int id, int userChanged, int cateId);
    SPResult save(int id, int userChanged, int cateId, String subject, String content, String contentEx01, String contentEx02, String contentEx03, String contentEx04, String contentEx05, String contentEx06, String filesId);

    SPResult getById(@Param(AppContants.SP_NewsSave.paramId) int id);

    SPResult getLatestShow(@Param(AppContants.SP_NewsSave.paramId) int cateId);
}
