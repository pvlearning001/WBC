package hls.wbc.entities;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "Role")
public class Role extends BaseEntity {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int Id;

    @Column(name = "Name")
    String Name;

    @Column(name = "NameLowerCases")
    String NameLowerCases;

    @Column(name = "Description")
    String Description;

    @Column(name = "is_deleted")
    boolean isDeleted;

    @ManyToMany
    @JoinTable(name = "RolePermission", joinColumns = @JoinColumn(name = "RoleId"),
            inverseJoinColumns = @JoinColumn(name = "PermissionId"))
    Set<Permission> Permissions;
}
