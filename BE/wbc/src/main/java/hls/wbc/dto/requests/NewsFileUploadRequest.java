package hls.wbc.dto.requests;

import jakarta.persistence.Column;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewsFileUploadRequest extends BaseRequest {
    int newsId;
    int fileUploadId;
}
