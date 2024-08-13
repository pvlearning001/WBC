package hls.wbc.enums;

import hls.wbc.constants.AppContants;
import lombok.Getter;

@Getter
public enum Categories {
    Announcement(1, AppContants.Categories.Announcement)
    ;

    Categories(int id, String name) {
        this.id = id;
        this.name = name;
    }

    private int id;
    private String name;
}
