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
    int Id;
    String Remark;
    boolean isDeleted;
    LocalDate InsAt;
    int InsBy;
    LocalDate UpdAt;
    int UpdBy;
}
