package hls.wbc.mappers;

import hls.wbc.dto.requests.FileUploadRequest;
import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.entities.FileUpload;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface FileUploadMapper {
    FileUpload toFileUpload(FileUploadResponse response);
    FileUploadResponse toFileUploadResponse(FileUpload fileUpload);
}
