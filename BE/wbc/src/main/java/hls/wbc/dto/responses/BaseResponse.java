package hls.wbc.dto.responses;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
@FieldDefaults(level = AccessLevel.PROTECTED)
public class BaseResponse {
    int id;
    String remark;
    boolean isDeleted;
    Instant insAt;
    int insBy;
    Instant updAt;
    int updBy;
}
