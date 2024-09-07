package hls.wbc.RepositoriesCustom;

import hls.wbc.constants.AppContants;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.enums.SQLTypes;
import jakarta.persistence.ParameterMode;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;
import java.util.List;

public class NewsCustomRepositoryImpl extends BaseCustomRepositoryImpl implements NewsCustomRepository {

    @Query(value = AppContants.SP_NewsGetList.exeQuery, nativeQuery = true)
    public PagingResponse<List<Object>> getList(@Param(AppContants.SP_NewsGetList.paramCateId) int cateId, @Param(AppContants.SP_PagingList.paramFindText) String findText, @Param(AppContants.SP_PagingList.paramSort) String sort, @Param(AppContants.SP_PagingList.paramSortType) String sortType, @Param(AppContants.SP_PagingList.paramPageIndex) int pageIndex){

        List<SPParameter> paramExtList = new ArrayList<SPParameter>();

        paramExtList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetList.paramCateId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(cateId)
                .build());

        return getDataPaging(AppContants.SP_NewsGetList.spName, findText, sort, sortType, pageIndex, paramExtList);
    }

    @Query(value = AppContants.SP_NewsSetDelete.exeQuery, nativeQuery = true)
    public SPResult setDeleted(@Param(AppContants.SP_NewsSetDelete.paramId) int id, @Param(AppContants.SP_NewsSetDelete.paramUserChanged)  int userChanged, @Param(AppContants.SP_NewsSetDelete.paramDeletedValue)  boolean deletedValue){

        List<SPParameter> paramList = new ArrayList<SPParameter>();

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSetDelete.paramId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(id)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSetDelete.paramUserChanged)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(userChanged)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSetDelete.paramDeletedValue)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(deletedValue)
                .build());

        return execSP(AppContants.SP_NewsSetDelete.spName, paramList, false);
    }
    @Query(value = AppContants.SP_NewsSave.exeQuery, nativeQuery = true)
    public SPResult save(@Param(AppContants.SP_NewsSave.paramId) int id, @Param(AppContants.SP_NewsSave.paramUserChanged)  int userChanged, @Param(AppContants.SP_NewsSave.paramCateId) int cateId, @Param(AppContants.SP_NewsSave.paramSubject) String subject, @Param(AppContants.SP_NewsSave.paramContent) String content, @Param(AppContants.SP_NewsSave.paramContentEx01) String contentEx01, @Param(AppContants.SP_NewsSave.paramContentEx02) String contentEx02, @Param(AppContants.SP_NewsSave.paramContentEx03) String contentEx03, @Param(AppContants.SP_NewsSave.paramContentEx04) String contentEx04, @Param(AppContants.SP_NewsSave.paramContentEx05) String contentEx05, @Param(AppContants.SP_NewsSave.paramContentEx06) String contentEx06, @Param(AppContants.SP_NewsSave.paramFilesId) String filesId){

        List<SPParameter> paramList = new ArrayList<SPParameter>();

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(id)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramUserChanged)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(userChanged)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramCateId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(cateId)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramSubject)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(subject)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramContent)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(content)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramContentEx01)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(contentEx01)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramContentEx02)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(contentEx02)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramContentEx03)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(contentEx03)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramContentEx04)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(contentEx04)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramContentEx05)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(contentEx05)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramContentEx06)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(contentEx06)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramFilesId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.String)
                .value(filesId)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsSave.paramOutId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Int)
                .build());

        return execSP(AppContants.SP_NewsSave.spName, paramList, true);
    }

    public SPResult getById(@Param(AppContants.SP_NewsSave.paramId) int id){
        List<SPParameter> paramList = new ArrayList<SPParameter>();

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(id)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramOutId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Int)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramOutCateId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Int)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramSubject)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramContent)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramContentEx01)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramContentEx02)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramContentEx03)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramContentEx04)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramContentEx05)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramContentEx06)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramFilesId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetById.paramIsShow)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Boolean)
                .build());

        return execSP(AppContants.SP_NewsGetById.spName, paramList, true);
    }

    public SPResult getLatestShow(@Param(AppContants.SP_NewsSave.paramId) int cateId){
        List<SPParameter> paramList = new ArrayList<SPParameter>();

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramCateId)
                .mode(ParameterMode.IN)
                .type(SQLTypes.Int)
                .value(cateId)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramOutId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Int)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramOutCateId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Int)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramSubject)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramContent)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramContentEx01)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramContentEx02)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramContentEx03)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramContentEx04)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramContentEx05)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramContentEx06)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramFilesId)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramFilesDisabled)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.String)
                .build());

        paramList.add(SPParameter.builder()
                .name(AppContants.SP_NewsGetLatestShow.paramIsShow)
                .mode(ParameterMode.OUT)
                .type(SQLTypes.Boolean)
                .build());

        return execSP(AppContants.SP_NewsGetLatestShow.spName, paramList, true);
    }
}
