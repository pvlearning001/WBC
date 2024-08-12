package hls.wbc.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "category")
public class Category extends BaseEntity {
    @Column(name = "name")
    String name;

    @Builder
    public Category(int id, String guid, String name, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.name = name;
    }
}
