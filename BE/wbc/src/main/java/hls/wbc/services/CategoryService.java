package hls.wbc.services;

import com.nimbusds.jose.JOSEException;
import hls.wbc.dto.requests.CategoryRequest;
import hls.wbc.dto.responses.CategoryResponse;
import hls.wbc.entities.Category;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.CategoryMapper;
import hls.wbc.repositories.CategoryRepository;
import hls.wbc.utilities.SecuritiesUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CategoryService {
    @NonFinal
    @Value("${jwt.signerKey}")
    protected String SIGNER_KEY;

    CategoryRepository repository;
    CategoryMapper mapper;
    public CategoryResponse createEntity(CategoryRequest request) throws ParseException, JOSEException {
        if (repository.existsByName(request.getName()))
            throw new AppException(ErrorCode.CATEGORY_EXISTED);
        Category entity = Category.builder()
                .name(request.getName())
                .build();
        int userId = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        entity.setTraceNew(userId, null);
        Category saveEntity = repository.save(entity);
        return mapper.toResponse(saveEntity);
    }

    public CategoryResponse updateEntity(CategoryRequest request) throws ParseException, JOSEException {
        Optional<Category> entityOptional = repository.findById(request.getId());
        if (entityOptional.isEmpty())
            throw new AppException(ErrorCode.CATEGORY_NOT_EXISTED);
        Category entity = entityOptional.get();
        entity.setName(request.getName());
        int userId = SecuritiesUtils.getClaimsUserId(SIGNER_KEY);
        entity.setTraceUpdate(userId, request.getRemark());
        Category saveEntity = repository.save(entity);
        return mapper.toResponse(saveEntity);
    }
}
