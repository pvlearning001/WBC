package hls.wbc.dto.responses;

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

public class IntroduceResponse extends BaseResponse {
    String history;
    String hierarchyMap;
    String info01;
    String info02;
    String info03;
    String info04;
    String info05;
    String info06;
    String info07;
    String info08;
    String info09;
    String info10;
    String info11;
    String info12;

    @Builder
    public IntroduceResponse(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String history, String hierarchyMap, String info01, String info02, String info03, String info04, String info05, String info06, String info07, String info08, String info09, String info10, String info11, String info12){
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
