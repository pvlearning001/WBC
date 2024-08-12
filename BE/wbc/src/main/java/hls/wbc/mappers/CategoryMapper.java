package hls.wbc.mappers;
import hls.wbc.dto.requests.CategoryRequest;
import hls.wbc.dto.responses.CategoryResponse;
import hls.wbc.entities.Category;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface CategoryMapper {
    Category toEntity(CategoryRequest request);
    CategoryResponse toResponse(Category entity);
}
