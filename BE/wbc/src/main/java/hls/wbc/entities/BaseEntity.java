package hls.wbc.entities;

import hls.wbc.constants.AppContants;
import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
public class BaseEntity {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @Column(name = "guid")
    String guid;

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

    public int getTraceUserId(Integer userId){
        if (userId == null){
            userId = AppContants.SecuritiesValues.AdminId;
        }
        return userId;
    }

    private void setTraceAddNew(Integer userId, String remark){
        guid = UUID.randomUUID().toString();
        isDeleted = false;
        this.remark = remark;
        insAt = Instant.now();
        userId = getTraceUserId(userId);
        insBy = userId;
    }

    public void setTraceUpdate(Integer userId, String remark){
        this.remark = remark;
        userId = getTraceUserId(userId);
        updAt = Instant.now();
        updBy = userId;
    }

    public void updateTraceUserAddNew(Integer userId, String remark){
        this.remark = remark;
        userId = getTraceUserId(userId);
        insBy = userId;
        updBy = userId;
    }

    public void setTraceNew(Integer userId, String remark){
        setTraceAddNew(userId, remark);
        setTraceUpdate(userId, remark);
    }

    public void setDeleted(boolean isDeleted, Integer userId, String remark){
        this.isDeleted = isDeleted;
        setTraceUpdate(userId, remark);
    }
}
