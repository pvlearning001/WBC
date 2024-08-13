package hls.wbc.dto.responses;

import lombok.*;
import lombok.experimental.FieldDefaults;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewsFileUploadResponse extends BaseResponse {
    int newsId;
    int fileUploadId;
}
