package hls.wbc.dto.requests;

import lombok.*;
import lombok.experimental.FieldDefaults;
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CategoryRequest extends BaseRequest {
    String name;
}
