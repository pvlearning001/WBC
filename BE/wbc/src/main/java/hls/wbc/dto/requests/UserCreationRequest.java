package hls.wbc.dto.requests;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserCreationRequest extends BaseRequest {

    @Size(min = 4,message = "USERNAME_INVALID")
    String userName;

    @Size(min = 6, message = "INVALID_PASSWORD")
    String Password;
}
