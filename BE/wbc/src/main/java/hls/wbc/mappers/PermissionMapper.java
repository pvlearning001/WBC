package hls.wbc.mappers;

import hls.wbc.dto.requests.PermissionRequest;
import hls.wbc.dto.responses.PermissionResponse;
import hls.wbc.entities.Permission;
import org.mapstruct.Mapper;
@Mapper(componentModel = "spring")
public interface PermissionMapper {

    Permission toEntity(PermissionRequest request);
    PermissionResponse toResponse(Permission permission);
}
