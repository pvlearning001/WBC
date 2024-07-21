package hls.wbc.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PUBLIC)

public class BaseEntity {
    @Column(name = "remark")
    String remark;

    @Column(name = "is_deleted")
    boolean isDeleted;

    @Column(name = "ins_at")
    LocalDate insAt;

    @Column(name = "ins_by")
    int insBy;

    @Column(name = "upd_at")
    LocalDate updAt;

    @Column(name = "upd_by")
    int updBy;
}
