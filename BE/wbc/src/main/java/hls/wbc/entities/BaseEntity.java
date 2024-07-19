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
    @Column(name = "Remark")
    String Remark;

    @Column(name = "is_deleted")
    boolean isDeleted;

    @Column(name = "InsAt")
    LocalDate InsAt;

    @Column(name = "InsBy")
    int InsBy;

    @Column(name = "UpdAt")
    LocalDate UpdAt;

    @Column(name = "UpdBy")
    int UpdBy;
}
