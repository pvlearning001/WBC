package hls.wbc.entities;
import hls.wbc.constants.AppContants;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.time.LocalDate;
import java.util.Set;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "role")
public class Role extends BaseEntity {

    @Column(name = "name")
    String name;

    @Column(name = "name_lower_cases")
    String nameLowerCases;

    @Column(name = "descriptions")
    String descriptions;

    @ManyToMany
    @JoinTable(name = "role_permission", joinColumns = @JoinColumn(name = "role_id"),
            inverseJoinColumns = @JoinColumn(name = "permission_id"))
    Set<Permission> permissions;

    @Builder
    public Role(int id, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String name, String nameLowerCases, String descriptions, Set<Permission> permissions){
        super(id, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.name = name;
        this.nameLowerCases = nameLowerCases;
        this.descriptions = descriptions;
        this.permissions = permissions;
    }
}
