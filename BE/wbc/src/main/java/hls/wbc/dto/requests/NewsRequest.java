package hls.wbc.dto.requests;

import jakarta.persistence.Column;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.web.multipart.MultipartFile;

import java.time.Instant;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewsRequest extends BaseRequest {
    String subject;
    String content;
    String contentEx01;
    String contentEx02;
    String contentEx03;
    String contentEx04;
    String contentEx05;
    String contentEx06;
    List<MultipartFile> files;
}
