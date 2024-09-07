package hls.wbc.services;

import com.nimbusds.jose.JOSEException;
import hls.wbc.RepositoriesCustom.SPResult;
import hls.wbc.constants.AppContants;
import hls.wbc.dto.requests.*;
import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.dto.responses.NewsResponse;
import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.entities.News;
import hls.wbc.entities.NewsFileUpload;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.NewsMapper;
import hls.wbc.repositories.NewsFileUploadRepository;
import hls.wbc.repositories.NewsRepository;
import hls.wbc.utilities.AppUtils;
import hls.wbc.utilities.SecuritiesUtils;
import hls.wbc.utilities.TableUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class NewsService {
    @NonFinal
    @Value("${jwt.signerKey}")
    protected String SIGNER_KEY;

    NewsRepository repository;
    NewsMapper mapper;
    FileUploadService fileUploadService;
    NewsFileUploadRepository newsFileUploadRepository;
    NewsFileUploadService newsFileUploadService;

    private int getIdFromSPResult(SPResult spResult){
        int result = 0;
        Object resultObj = spResult.getOutValue(AppContants.SP_NewsSave.paramOutId);
        if (resultObj != null)
            result = (Integer) resultObj;
        return result;
    }

    public NewsResponse createEntity(NewsRequest request) throws ParseException, JOSEException, IOException, NoSuchAlgorithmException {
        List<FileUploadResponse> fileList = new ArrayList<FileUploadResponse>();

        if (request.getFiles() != null){
            FileUploadRequest fileUploadRequest = FileUploadRequest
                    .builder()
                    .files(request.getFiles())
                    .build();
            fileList = fileUploadService.uploadFilePdf(fileUploadRequest);
        }
        String filesId = buildFilesId(fileList);

        int userChanged = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);

        SPResult spResult = repository.save(0
                , userChanged
                , request.getCateId()
                , request.getSubject()
                , request.getContent()
                , request.getContentEx01()
                , request.getContentEx02()
                , request.getContentEx03()
                , request.getContentEx04()
                , request.getContentEx05()
                , request.getContentEx06()
                , filesId);

        int id = getIdFromSPResult(spResult);

        News saveEntity = repository.findById(id).orElseThrow(
                () -> new AppException(ErrorCode.NEWS_NOT_EXISTED));
        saveEntity.setFilesId(filesId);
        NewsResponse result = mapper.toResponse(saveEntity);
        MapToResponse(saveEntity, result);
        result.setId(saveEntity.getId());
        if (fileList != null && !fileList.isEmpty()){
            result.setFiles(fileList);
        }

        return result;
    }

    public NewsResponse updateEntity(NewsRequest request) throws ParseException, JOSEException, IOException, NoSuchAlgorithmException {
        List<FileUploadResponse> fileList = new ArrayList<FileUploadResponse>();
        if (!request.getFiles().isEmpty()){
            newsFileUploadService.DeletePhysicalFilesByNewsId(request.getId());
            FileUploadRequest fileUploadRequest = FileUploadRequest.builder()
                    .files(request.getFiles())
                    .build();
            fileList = fileUploadService.uploadFilePdf(fileUploadRequest);
        }

        String filesId = buildFilesId(fileList);
        int userChanged = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        SPResult spResult = repository.save(
                request.getId()
                , userChanged
                , request.getCateId()
                , request.getSubject()
                , request.getContent()
                , request.getContentEx01()
                , request.getContentEx02()
                , request.getContentEx03()
                , request.getContentEx04()
                , request.getContentEx05()
                , request.getContentEx06()
                , filesId);

        int id = getIdFromSPResult(spResult);
        News saveEntity = repository.findById(id).orElseThrow(
                () -> new AppException(ErrorCode.NEWS_NOT_EXISTED));
        saveEntity.setFilesId(filesId);

        NewsResponse result = mapper.toResponse(saveEntity);
        MapToResponse(saveEntity, result);
        result.setId(saveEntity.getId());

        if (fileList != null && !fileList.isEmpty()){
            result.setFiles(fileList);
        }

        return result;
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public PagingResponse<List<Object>> getList(NewsListRequest request){
        return repository.getList(request.getCateId(), request.getFindText(), request.getSort(), request.getSortType(), request.getPageIndex());
    }

    private NewsResponse getNewsResponse(SPResult spResult){
        Object idObj = spResult.getOutValue(AppContants.SP_NewsGetById.paramOutId);
        int outId = (idObj != null) ? (Integer) idObj : 0;

        Object cateIdObj = spResult.getOutValue(AppContants.SP_NewsGetById.paramOutCateId);
        int cateId = (cateIdObj != null) ? (Integer) cateIdObj : 0;

        Object subjectObj = spResult.getOutValue(AppContants.SP_NewsGetById.paramSubject);
        String subject = (subjectObj != null) ? subjectObj.toString() : null;

        Object contentObj = spResult.getOutValue(AppContants.SP_NewsGetById.paramContent);
        String content = (contentObj != null) ? contentObj.toString() : null;

        Object contentEx01Obj = spResult.getOutValue(AppContants.SP_NewsGetById.paramContentEx01);
        String contentEx01 = (contentEx01Obj != null) ? contentEx01Obj.toString() : null;

        Object contentEx02Obj = spResult.getOutValue(AppContants.SP_NewsGetById.paramContentEx02);
        String contentEx02 = (contentEx02Obj != null) ? contentEx02Obj.toString() : null;

        Object contentEx03Obj = spResult.getOutValue(AppContants.SP_NewsGetById.paramContentEx03);
        String contentEx03 = (contentEx03Obj != null) ? contentEx03Obj.toString() : null;

        Object contentEx04Obj = spResult.getOutValue(AppContants.SP_NewsGetById.paramContentEx04);
        String contentEx04 = (contentEx04Obj != null) ? contentEx04Obj.toString() : null;

        Object contentEx05Obj = spResult.getOutValue(AppContants.SP_NewsGetById.paramContentEx05);
        String contentEx05 = (contentEx05Obj != null) ? contentEx05Obj.toString() : null;

        Object contentEx06Obj = spResult.getOutValue(AppContants.SP_NewsGetById.paramContentEx06);
        String contentEx06 = (contentEx06Obj != null) ? contentEx06Obj.toString() : null;

        Object isShowObj = spResult.getOutValue(AppContants.SP_NewsGetById.paramIsShow);
        boolean isShow = (isShowObj != null) ? (Boolean) isShowObj : false;

        List<FileUploadResponse> fileList = new ArrayList<FileUploadResponse>();
        if (!spResult.getTable().isEmpty()){
            List<Object[]> table = spResult.getTable();
            for(Object[] row: table){
                int fileId = TableUtils.getValueCellInt(row, 0, 0);
                String name = TableUtils.getValueCellString(row, 1);
                String path = TableUtils.getValueCellString(row, 2);
                String extName = TableUtils.getValueCellString(row, 3);
                String uniqueName = TableUtils.getValueCellString(row, 4);
                String contentType = TableUtils.getValueCellString(row, 5);
                String descriptions = TableUtils.getValueCellString(row, 6);
                boolean isDisabled = TableUtils.getValueCellBoolean(row, 7, true);
                FileUploadResponse fur = FileUploadResponse.builder()
                        .id(fileId)
                        .name(name)
                        .path(path)
                        .extName(extName)
                        .uniqueName(uniqueName)
                        .contentType(contentType)
                        .descriptions(descriptions)
                        .isDisabled(isDisabled)
                        .build();
                fileList.add(fur);
            }
        }

        if (outId >0){
            NewsResponse result = NewsResponse.builder()
                    .id(outId)
                    .cateId(cateId)
                    .subject(subject)
                    .content(content)
                    .contentEx01(contentEx01)
                    .contentEx02(contentEx02)
                    .contentEx03(contentEx03)
                    .contentEx04(contentEx04)
                    .contentEx05(contentEx05)
                    .contentEx06(contentEx06)
                    .isShow(isShow)
                    .build();
            result.setFiles(fileList);

            return result;
        }
        return null;
    }
    public NewsResponse getById(int id) {
        SPResult spResult = repository.getById(id);
        return getNewsResponse(spResult);
    }

    public NewsResponse getShowLatest(int cateId) {
        SPResult spResult = repository.getLatestShow(cateId);
        return getNewsResponse(spResult);
    }

    @PreAuthorize(AppContants.SecuritiesValues.HasRoleAdmin)
    public void setDeleted(int id, boolean deleteValue) throws ParseException, JOSEException, IOException {
        int userChanged = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        newsFileUploadService.DeletePhysicalFilesByNewsId(id);
        repository.setDeleted(id, userChanged, deleteValue);
    }

    public List<FileUploadResponse> getFileList(int newsId){
        List<FileUploadResponse> result = new ArrayList<>();
        List<NewsFileUpload> newsFilesEntityList = newsFileUploadRepository.findAllByNewsId(newsId);
        if (!newsFilesEntityList.isEmpty()){
            for(NewsFileUpload newsFilesEntityItem:newsFilesEntityList){
                FileUploadResponse resultItem = fileUploadService.getById(newsFilesEntityItem.getFileUploadId());
                result.add(resultItem);
            }
        }
        return result;
    }

    public NewsResponse findById(int id){
        NewsResponse result = NewsResponse.builder().build();
        Optional<News> entityOptinal = repository.findById(id);
        if (entityOptinal.isPresent()){
            result = mapper.toResponse(entityOptinal.get());
            MapToResponse(entityOptinal.get(), result);
            List<FileUploadResponse> files = getFileList(id);
            result.setFiles(files);
        }
        return result;

    }

    public NewsResponse getResponseLatest(){
        NewsResponse result = NewsResponse.builder().build();
        Optional<News> entityOptinal = repository.getMaxID();
        if (entityOptinal.isPresent()){
            int id = entityOptinal.get().getId();
            result = mapper.toResponse(entityOptinal.get());
            MapToResponse(entityOptinal.get(), result);
            List<FileUploadResponse> files = getFileList(id);
            result.setFiles(files);
        }
        return result;

    }
    public void MapToResponse(News entity, NewsResponse response){
        response.setId(entity.getId());
        response.setGuid(entity.getGuid());
        response.setCateId(entity.getCateId());
        response.setRemark(entity.getRemark());
        response.setDeleted(entity.isDeleted());
        response.setInsAt(entity.getInsAt());
        response.setInsBy(entity.getInsBy());
        response.setUpdAt(entity.getUpdAt());
        response.setUpdBy(entity.getUpdBy());
    }

    private String buildFilesId(List<FileUploadResponse> fileList){
        StringJoiner stringJoiner = new StringJoiner(AppContants.StringValues.Comma);
        if (fileList != null && !fileList.isEmpty()){
            fileList.forEach(file -> {
                stringJoiner.add(String.valueOf(file.getId()));
            });
        }
        return stringJoiner.toString();
    }

}
