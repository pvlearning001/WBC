package hls.wbc.mappers;
import hls.wbc.dto.requests.RoleRequest;
import hls.wbc.dto.responses.RoleResponse;
import hls.wbc.entities.Role;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface RoleMapper {
    @Mapping(target = "permissions", ignore = true)
    Role toEntity(RoleRequest request);
    RoleResponse toResponse(Role entity);
}
