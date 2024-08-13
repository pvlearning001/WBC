package hls.wbc.services;

import com.nimbusds.jose.JOSEException;
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

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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

    public NewsResponse createEntity(NewsRequest request) throws ParseException, JOSEException, IOException, NoSuchAlgorithmException {
        News entity = News.builder()
                .cateId(request.getCateId())
                .subject(request.getSubject())
                .content(request.getContent())
                .build();
        int userId = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        entity.setTraceNew(userId, null);
        News saveEntity = repository.save(entity);
        NewsResponse result = mapper.toResponse(saveEntity);
        MapToResponse(saveEntity, result);
        result.setId(saveEntity.getId());
        if (!request.getFiles().isEmpty()){
            FileUploadRequest fileUploadRequest = FileUploadRequest.builder()
                    .files(request.getFiles())
                    .build();
            List<FileUploadResponse> fileList = fileUploadService.uploadFilePdf(fileUploadRequest);
            saveFileList(result.getId(), fileList);
            result.setFiles(fileList);
        }
        return result;
    }

    public NewsResponse updateEntity(NewsRequest request) throws ParseException, JOSEException, IOException, NoSuchAlgorithmException {
        Optional<News> entityOptional = repository.findById(request.getId());
        if (entityOptional.isEmpty())
            throw new AppException(ErrorCode.NEWS_NOT_EXISTED);
        News entity = entityOptional.get();
        entity.setSubject(request.getSubject());
        entity.setContent(request.getContent());
        int userId = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        entity.setTraceUpdate(userId, request.getRemark());
        News saveEntity = repository.save(entity);
        NewsResponse result = mapper.toResponse(saveEntity);
        MapToResponse(saveEntity, result);
        if (!request.getFiles().isEmpty()){
            newsFileUploadService.DeleteByNewsId(request.getId());
            FileUploadRequest fileUploadRequest = FileUploadRequest.builder()
                    .files(request.getFiles())
                    .build();
            List<FileUploadResponse> fileList = fileUploadService.uploadFilePdf(fileUploadRequest);
            saveFileList(result.getId(), fileList);
            result.setFiles(fileList);
        }
        else{
            List<FileUploadResponse> fileList = getFileList(request.getId());
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

    public void saveFileList(int id, List<FileUploadResponse> fileList) throws ParseException, JOSEException {
        if (!fileList.isEmpty()) {
            for (FileUploadResponse file : fileList) {
                NewsFileUploadRequest newsFileUploadRequest = NewsFileUploadRequest.builder()
                        .newsId(id)
                        .fileUploadId(file.getId())
                        .build();
                newsFileUploadService.createEntity(newsFileUploadRequest);
            }
        }
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

}
