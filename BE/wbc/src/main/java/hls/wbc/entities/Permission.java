package hls.wbc.entities;

import hls.wbc.constants.AppContants;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.time.LocalDate;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "permission")
public class Permission {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @Column(name = "name")
    String name;

    @Column(name = "description")
    String description;

    @Column(name = "remark")
    String remark;

    @Column(name = "is_deleted")
    boolean isDeleted;

    @Column(name = "ins_at")
    Instant insAt;

    @Column(name = "ins_by")
    int insBy;

    @Column(name = "upd_at")
    Instant updAt;

    @Column(name = "upd_by")
    int updBy;

    int getUserId(Integer userId){
        if (userId == null){
            userId = AppContants.SecuritiesValues.AdminId;
        }
        return userId;
    }

    private void setTraceAddNew(Integer userId, String remark){
        isDeleted = false;
        this.remark = remark;
        insAt = Instant.now();
        userId = getUserId(userId);
        insBy = userId;
    }

    public void setTraceUpdate(Integer userId, String remark){
        this.remark = remark;
        updAt = Instant.now();
        userId = getUserId(userId);
        updBy = userId;
    }

    public void setTraceNew(Integer userId, String remark){
        setTraceAddNew(userId, remark);
        setTraceUpdate(userId, remark);
    }
}
