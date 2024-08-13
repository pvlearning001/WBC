package hls.wbc.services;

import com.nimbusds.jose.JOSEException;
import hls.wbc.dto.requests.FileUploadRequest;
import hls.wbc.dto.requests.NewsFileUploadRequest;
import hls.wbc.dto.requests.NewsRequest;
import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.dto.responses.NewsFileUploadResponse;
import hls.wbc.dto.responses.NewsResponse;
import hls.wbc.entities.News;
import hls.wbc.entities.NewsFileUpload;
import hls.wbc.enums.Categories;
import hls.wbc.mappers.FileUploadMapper;
import hls.wbc.mappers.NewsFileUploadMapper;
import hls.wbc.mappers.NewsMapper;
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

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class NewsFileUploadService {
    @NonFinal
    @Value("${jwt.signerKey}")
    protected String SIGNER_KEY;

    NewsFileUploadRepository repository;
    NewsFileUploadMapper mapper;
    FileUploadService fileUploadService;
    FileUploadMapper fileUploadMapper;

    public NewsFileUploadResponse createEntity(NewsFileUploadRequest request) throws ParseException, JOSEException {

        NewsFileUpload entity = NewsFileUpload.builder()
                .newsId(request.getNewsId())
                .fileUploadId(request.getFileUploadId())
                .build();
        int userId = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        entity.setTraceNew(userId, null);
        NewsFileUpload saveEntity = repository.save(entity);

        return mapper.toResponse(saveEntity);
    }

    public void DeleteByNewsId(int newId){
        List<NewsFileUpload> list = repository.findAllByNewsId(newId);
        repository.deleteAll(list);
    }
}
