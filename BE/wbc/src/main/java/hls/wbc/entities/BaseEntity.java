package hls.wbc.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.LocalDate;

@Getter
@Setter
/*
@NoArgsConstructor
@AllArgsConstructor

 */
@FieldDefaults(level = AccessLevel.PRIVATE)

public class BaseEntity {

    String remark;
    boolean isDeleted;
    LocalDate InsAt;
    int InsBy;
    LocalDate UpdAt;
    int UpdBy;
}
