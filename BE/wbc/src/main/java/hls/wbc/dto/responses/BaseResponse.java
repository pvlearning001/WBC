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
    int Id;
    String Remark;
    boolean isDeleted;
    LocalDate InsAt;
    int InsBy;
    LocalDate UpdAt;
    int UpdBy;
}
