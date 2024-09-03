package hls.wbc.dto.requests;
import lombok.*;
import lombok.experimental.FieldDefaults;

@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)

public class UserUpdateRequest extends BaseRequest {
    int userId;
    String userName;
    String firstName;
    String middleName;
    String lastName;
    String email;
    String phone;
    String roles;
}
