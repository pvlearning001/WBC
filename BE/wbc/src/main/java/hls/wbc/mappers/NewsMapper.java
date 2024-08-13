package hls.wbc.mappers;

import hls.wbc.dto.requests.UserUpdateRequest;
import hls.wbc.dto.responses.NewsResponse;
import hls.wbc.entities.News;
import hls.wbc.entities.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface NewsMapper {

    News toEntity(NewsResponse response);

    NewsResponse toResponse(News entity);
}
