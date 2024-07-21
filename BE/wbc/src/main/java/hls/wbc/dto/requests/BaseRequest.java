package hls.wbc.dto.requests;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
@FieldDefaults(level = AccessLevel.PROTECTED)
public class BaseRequest {
    int id;
    String remark;
    boolean isDeleted;
    LocalDate insAt;
    int insBy;
    LocalDate updAt;
    int updBy;
}
