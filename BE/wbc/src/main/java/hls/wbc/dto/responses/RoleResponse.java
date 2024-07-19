package hls.wbc.dto.responses;
import hls.wbc.entities.Permission;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.util.Set;
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RoleResponse extends BaseResponse {
    String Name;
    String NameLowerCases;
    String Description;
    Set<Permission> Permissions;
}
