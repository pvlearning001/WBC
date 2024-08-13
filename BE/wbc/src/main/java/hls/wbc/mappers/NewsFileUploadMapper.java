package hls.wbc.mappers;

import hls.wbc.dto.responses.NewsFileUploadResponse;
import hls.wbc.entities.NewsFileUpload;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface NewsFileUploadMapper {
    NewsFileUpload toEntity(NewsFileUploadResponse response);

    NewsFileUploadResponse toResponse(NewsFileUpload entity);
}
