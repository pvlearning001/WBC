package hls.wbc.mappers;

import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.entities.FileUpload;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface FileUploadMapper {
    FileUpload toEntity(FileUploadResponse response);
    FileUploadResponse toResponse(FileUpload entity);
}
