package hls.wbc.dto.requests;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewsDeleteRequest {
    int id;
    boolean deletedValue;
}
