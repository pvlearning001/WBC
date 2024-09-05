package hls.wbc.RepositoriesCustom;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.enums.SQLTypes;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;
import java.util.List;

public class NewsCustomRepositoryImpl extends BaseCustomRepositoryImpl implements NewsCustomRepository {

    @Query(value = AppContants.SP_NewsGetList.exeQuery, nativeQuery = true)
    public PagingResponse getList(@Param(AppContants.SP_NewsGetList.paramCateId) int cateId, @Param(AppContants.SP_PagingList.paramFindText) String findText, @Param(AppContants.SP_PagingList.paramSort) String sort, @Param(AppContants.SP_PagingList.paramSortType) String sortType, @Param(AppContants.SP_PagingList.paramPageIndex) int pageIndex){

        List<String> paramsExtInName = new ArrayList<String>();
        List<SQLTypes> paramsExtInType = new ArrayList<SQLTypes>();
        List<Object> paramsExtInValue = new ArrayList<Object>();

        paramsExtInName.add(AppContants.SP_NewsGetList.paramCateId);
        paramsExtInType.add(SQLTypes.Int);
        paramsExtInValue.add(cateId);

        return getDataPagingList(AppContants.SP_UserGetList.storeName, findText, sort, sortType, pageIndex, paramsExtInName, paramsExtInType, paramsExtInValue, null, null, null);
    }

    @Query(value = AppContants.SP_NewsSetDelete.exeQuery, nativeQuery = true)
    public boolean setDeleted(@Param(AppContants.SP_NewsSetDelete.paramId) int id, @Param(AppContants.SP_NewsSetDelete.paramUserChanged)  int userChanged, @Param(AppContants.SP_NewsSetDelete.paramDeletedValue)  boolean deletedValue){

        StoredProcedureQuery query = entityManager.createStoredProcedureQuery(AppContants.SP_NewsSetDelete.storeName);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSetDelete.paramId, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSetDelete.paramId, id);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSetDelete.paramUserChanged, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSetDelete.paramUserChanged, userChanged);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSetDelete.paramDeletedValue, Boolean.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSetDelete.paramDeletedValue, deletedValue);

        return query.execute();
    }
    @Query(value = AppContants.SP_NewsSave.exeQuery, nativeQuery = true)
    public int save(@Param(AppContants.SP_NewsSave.paramId) int id, @Param(AppContants.SP_NewsSave.paramUserChanged)  int userChanged, @Param(AppContants.SP_NewsSave.paramCateId) int cateId, @Param(AppContants.SP_NewsSave.paramSubject) String subject, @Param(AppContants.SP_NewsSave.paramContent) String content, @Param(AppContants.SP_NewsSave.paramContentEx01) String contentEx01, @Param(AppContants.SP_NewsSave.paramContentEx02) String contentEx02, @Param(AppContants.SP_NewsSave.paramContentEx03) String contentEx03, @Param(AppContants.SP_NewsSave.paramContentEx04) String contentEx04, @Param(AppContants.SP_NewsSave.paramContentEx05) String contentEx05, @Param(AppContants.SP_NewsSave.paramContentEx06) String contentEx06, @Param(AppContants.SP_NewsSave.paramFilesId) String filesId){

        StoredProcedureQuery query = entityManager.createStoredProcedureQuery(AppContants.SP_NewsSave.storeName);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramId, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramId, id);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramUserChanged, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramUserChanged, userChanged);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramCateId, Integer.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramCateId, cateId);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramSubject, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramSubject, subject);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramContent, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramContent, content);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramContentEx01, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramContentEx01, contentEx01);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramContentEx02, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramContentEx02, contentEx02);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramContentEx03, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramContentEx03, contentEx03);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramContentEx04, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramContentEx04, contentEx04);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramContentEx05, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramContentEx05, contentEx05);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramContentEx06, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramContentEx06, contentEx06);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramFilesId, String.class, ParameterMode.IN);
        query.setParameter(AppContants.SP_NewsSave.paramFilesId, filesId);

        query.registerStoredProcedureParameter(AppContants.SP_NewsSave.paramOutId, Integer.class, ParameterMode.OUT);
        int result = Integer.parseInt(query.getOutputParameterValue(AppContants.SP_NewsSave.paramOutId).toString());

        query.execute();

        return result;
    }
}
