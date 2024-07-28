package hls.wbc.mappers;
import hls.wbc.dto.responses.IntroduceResponse;
import hls.wbc.entities.Introduce;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface IntroduceMapper {
    IntroduceResponse toIntroduceResponse(Introduce introduce);
}
