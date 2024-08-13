package hls.wbc.dto.responses;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewsResponse extends BaseResponse {
    String subject;
    String content;
    String contentEx01;
    String contentEx02;
    String contentEx03;
    String contentEx04;
    String contentEx05;
    String contentEx06;
    List<FileUploadResponse> files;
}
