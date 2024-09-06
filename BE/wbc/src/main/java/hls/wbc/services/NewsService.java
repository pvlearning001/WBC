package hls.wbc.services;

import com.nimbusds.jose.JOSEException;
import hls.wbc.RepositoriesCustom.SPResult;
import hls.wbc.constants.AppContants;
import hls.wbc.dto.requests.CategoryRequest;
import hls.wbc.dto.requests.FileUploadRequest;
import hls.wbc.dto.requests.NewsFileUploadRequest;
import hls.wbc.dto.requests.NewsRequest;
import hls.wbc.dto.responses.CategoryResponse;
import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.dto.responses.NewsResponse;
import hls.wbc.entities.Category;
import hls.wbc.entities.News;
import hls.wbc.entities.NewsFileUpload;
import hls.wbc.enums.Categories;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.NewsMapper;
import hls.wbc.repositories.FileUploadRepository;
import hls.wbc.repositories.NewsFileUploadRepository;
import hls.wbc.repositories.NewsRepository;
import hls.wbc.utilities.SecuritiesUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.StringJoiner;

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
            newsFileUploadService.DeleteByNewsId(request.getId());
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

    public NewsResponse getResponseById(int id){
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
