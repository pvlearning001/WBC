package hls.wbc.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "invalidated_token")
public class InvalidatedToken {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @Column(name = "token_guid")
    String tokenGUID;

    @Column(name = "expiry_time")
    Date expiryTime;

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
