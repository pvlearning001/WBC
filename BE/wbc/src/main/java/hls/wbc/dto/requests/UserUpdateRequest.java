package hls.wbc.dto.requests;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Set;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)

public class UserUpdateRequest extends BaseRequest {
    String userName;
    String password;
    Set<Integer> roles;
}
