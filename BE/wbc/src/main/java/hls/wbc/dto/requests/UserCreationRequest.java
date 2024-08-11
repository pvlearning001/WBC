package hls.wbc.dto.requests;
import hls.wbc.constants.AppContants;
import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.FieldDefaults;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserCreationRequest extends BaseRequest {
    @Size(min = 2, message = AppContants.KeysErrorCode.INVALID_USERNAME)
    String userName;
    @Size(min = 2, message = AppContants.KeysErrorCode.INVALID_PASSWORD)
    String password;
    @Size(min = 2, message = AppContants.KeysErrorCode.INVALID_FIRSTNAME)
    String firstName;
    String middleName;
    @Size(min = 2, message = AppContants.KeysErrorCode.INVALID_LASTNAME)
    String lastName;
    @Size(min = 1,message = AppContants.KeysErrorCode.EMAIL_INVALID)
    String email;
    String phone;
}
