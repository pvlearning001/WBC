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

    @Builder
    public User(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String userName, String password, Set<Role> roles){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.userName = userName;
        this.password = password;
        this.roles = roles;
    }

    @ManyToMany()
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    Set<Role> roles;
}
