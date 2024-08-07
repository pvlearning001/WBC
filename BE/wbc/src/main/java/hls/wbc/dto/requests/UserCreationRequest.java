package hls.wbc.dto.requests;
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
    @Size(min = 1,message = "USERNAME_INVALID")
    String userName;
    @Size(min = 1, message = "INVALID_PASSWORD")
    String password;
    @Size(min = 1,message = "USERNAME_INVALID")
    String firstName;
    @Size(min = 1,message = "USERNAME_INVALID")
    String middleName;
    @Size(min = 1,message = "USERNAME_INVALID")
    String lastName;
    @Size(min = 1,message = "USERNAME_INVALID")
    String email;
    @Size(min = 1,message = "USERNAME_INVALID")
    String phone;
}
