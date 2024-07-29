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

@Table(name = "introduce")
public class Introduce extends BaseEntity {
    @Column(name = "name")
    String history;

    @Column(name = "hierarchy_map")
    String hierarchyMap;

    @Column(name = "info_01")
    String info01;

    @Column(name = "info_02")
    String info02;

    @Column(name = "info_03")
    String info03;

    @Column(name = "info_04")
    String info04;

    @Column(name = "info_05")
    String info05;

    @Column(name = "info_06")
    String info06;

    @Column(name = "info_07")
    String info07;

    @Column(name = "info_08")
    String info08;

    @Column(name = "info_09")
    String info09;

    @Column(name = "info_10")
    String info10;

    @Column(name = "info_11")
    String info11;

    @Column(name = "info_12")
    String info12;

    @Builder
    public Introduce(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String history, String hierarchyMap, String info01, String info02, String info03, String info04, String info05, String info06, String info07, String info08, String info09, String info10, String info11, String info12){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.history = history;
        this.hierarchyMap = hierarchyMap;
        this.info01 = info01;
        this.info02 = info02;
        this.info03 = info03;
        this.info04 = info04;
        this.info05 = info05;
        this.info06 = info06;
        this.info07 = info07;
        this.info08 = info08;
        this.info09 = info09;
        this.info10 = info10;
        this.info11 = info11;
        this.info12 = info12;
    }
}
