package hls.wbc.mappers;
import hls.wbc.dto.requests.UserCreationRequest;
import hls.wbc.dto.requests.UserUpdateRequest;
import hls.wbc.dto.responses.UserResponse;
import hls.wbc.entities.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface UserMapper {
    @Mapping(target = "roles", ignore = true)
    User toEntity(UserCreationRequest request);

    UserResponse toResponse(User entity);
    @Mapping(target = "roles", ignore = true)
    void updateUser(@MappingTarget User entity, UserUpdateRequest request);
}
