package hls.wbc.RepositoriesCustom;

import hls.wbc.dto.responses.PagingResponse;

public interface NewsCustomRepository {
    PagingResponse<Object> getList(int cateId, String findText, String sort,
                               String sortType, int pageIndex);
    SPResult setDeleted(int id, int userChanged, boolean deletedValue);
    SPResult save(int id, int userChanged, int cateId, String subject, String content, String contentEx01, String contentEx02, String contentEx03, String contentEx04, String contentEx05, String contentEx06, String filesId);
}
