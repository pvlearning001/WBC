package hls.wbc.enums;

import lombok.Getter;

@Getter
public enum Roles {

    User(1, "User"),
    Admin(2, "Admin")
    ;

    Roles(int id, String name) {
        this.Id = id;
        this.Name = name;
    }

    private int Id;
    private String Name;
}
