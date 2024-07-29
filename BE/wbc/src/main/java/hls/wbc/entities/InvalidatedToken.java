package hls.wbc.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.Instant;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "invalidated_token")
public class InvalidatedToken extends BaseEntity {

    @Column(name = "token_guid")
    String tokenGUID;

    @Column(name = "expiry_time")
    Instant expiryTime;

    @Builder
    public InvalidatedToken(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String tokenGUID, Instant expiryTime){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.tokenGUID = tokenGUID;
        this.expiryTime = expiryTime;
    }
}
