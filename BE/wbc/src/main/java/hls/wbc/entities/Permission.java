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
@Table(name = "permission")
public class Permission extends BaseEntity {
    @Column(name = "name")
    String name;

    @Column(name = "descriptions")
    String descriptions;

    @Builder
    public Permission(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String name, String descriptions){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.name = name;
        this.descriptions = descriptions;
    }
}
