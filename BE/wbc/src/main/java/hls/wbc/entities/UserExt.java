package hls.wbc.entities;
import hls.wbc.constants.AppContants;
import hls.wbc.utilities.AppUtils;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.util.Set;

@Getter
@Setter

@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "user_ext")
public class UserExt extends BaseEntity {
    @Column(name = "user_id")
    int userId;

    @Column(name = "f_name")
    String fName;

    @Column(name = "m_name")
    String mName;

    @Column(name = "l_name")
    String lName;

    @Column(name = "email")
    String email;

    @Column(name = "addr")
    String addr;

    @Column(name = "phone01")
    String phone01;

    @Column(name = "phone02")
    String phone02;

    @Column(name = "phone03")
    String phone03;

    @Builder
    public UserExt(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, int userId, String fName, String mName, String lName, String email, String addr, String phone01, String phone02, String phone03){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.userId = userId;
        this.fName = fName;
        this.mName = mName;
        this.lName = lName;
        this.email = email;
        this.addr = addr;
        this.phone01 = phone01;
        this.phone02 = phone02;
        this.phone03 = phone03;
    }

    public String getFullName(){
        String result = AppContants.StringValues.Empty;
        result = AppUtils.isNullOrEmptyOrBlank(this.fName) ? result : this.fName;
        result = AppUtils.isNullOrEmptyOrBlank(this.mName) ? result : (result + AppContants.StringValues.Space + mName).trim();
        result = AppUtils.isNullOrEmptyOrBlank(this.lName) ? result : (result + AppContants.StringValues.Space + lName).trim();
        return result;
    }
}
