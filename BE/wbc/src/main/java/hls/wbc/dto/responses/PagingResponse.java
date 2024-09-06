package hls.wbc.dto.responses;

import com.fasterxml.jackson.annotation.JsonInclude;
import hls.wbc.RepositoriesCustom.SPParameter;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PagingResponse<T> {
    @Builder.Default
    int pageIndex=0;
    int pageTotal;
    boolean execResult;
    List<T> pageResult;
    List<SPParameter> outValues;
}
