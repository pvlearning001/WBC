package hls.wbc.dto.responses;
import lombok.*;
import lombok.experimental.FieldDefaults;
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
    LocalDate insAt;
    int insBy;
    LocalDate updAt;
    int updBy;
}
