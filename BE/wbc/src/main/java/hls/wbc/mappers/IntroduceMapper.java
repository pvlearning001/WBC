package hls.wbc.mappers;
import hls.wbc.dto.responses.IntroduceResponse;
import hls.wbc.entities.Introduce;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface IntroduceMapper {
    IntroduceResponse toResponse(Introduce entity);
}
