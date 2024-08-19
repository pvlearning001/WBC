package hls.wbc.entities;

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
@Table(name = "user")
public class User extends BaseEntity {

    @Column(name = "user_name")
    String userName;

    @Column(name = "password")
    String password;

    @Column(name = "is_reset_pw")
    boolean isResetPw;;

    @Column(name = "roles_id")
    String rolesId;

    @Column(name = "roles_name", length = 512)
    String rolesName;

    @Builder
    public User(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String userName, String password, boolean isResetPw, String rolesId, String rolesName, Set<Role> roles){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.userName = userName;
        this.password = password;
        this.isResetPw = isResetPw;
        this.rolesId = rolesId;
        this.rolesName = rolesName;
        this.roles = roles;
    }

    @ManyToMany()
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    Set<Role> roles;
}
