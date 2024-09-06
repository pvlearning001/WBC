package hls.wbc.dto.requests;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewsListRequest {
    String findText;
    String sort;
    String sortType;
    int pageIndex;
    int cateId;
}
