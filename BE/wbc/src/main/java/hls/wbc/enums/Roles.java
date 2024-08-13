package hls.wbc.enums;

import hls.wbc.constants.AppContants;
import lombok.Getter;

@Getter
public enum Roles {
    User(1, AppContants.Roles.User, AppContants.Roles.RoleUser),
    Admin(2, AppContants.Roles.Admin, AppContants.Roles.RoleAdmin)
    ;

    Roles(int id, String name, String roleName) {
        this.id = id;
        this.name = name;
        this.roleName = roleName;
    }

    private int id;
    private String name;
    private String roleName;
}
