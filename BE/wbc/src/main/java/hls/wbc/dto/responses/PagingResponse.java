package hls.wbc.dto.responses;

import com.fasterxml.jackson.annotation.JsonInclude;
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
    private int pageIndex=0;
    private int pageTotal;
    private List<T> pageResult;
}
