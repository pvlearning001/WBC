package hls.wbc.dto.requests;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.util.Set;
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RoleRequest extends BaseRequest {
    String name;
    String nameLowerCases;
    String description;
    Set<Integer> permissions;
}
