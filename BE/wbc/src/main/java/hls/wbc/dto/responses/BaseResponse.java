package hls.wbc.dto.responses;
import jakarta.persistence.MappedSuperclass;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.time.LocalDate;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
public class BaseResponse {
    int id;
    String guid;
    String remark;
    boolean isDeleted;
    Instant insAt;
    int insBy;
    Instant updAt;
    int updBy;
}
