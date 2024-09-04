package hls.wbc.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import lombok.Getter;

@Getter
public enum ErrorCode  {
    UNCATEGORIZED_EXCEPTION(9999, "Uncategorized error", HttpStatus.INTERNAL_SERVER_ERROR),
    INVALID_KEY(1001, "Uncategorized error", HttpStatus.BAD_REQUEST),
    USER_EXISTED(1002, "User existed", HttpStatus.BAD_REQUEST),
    USERNAME_INVALID(1003, "Username must be at least {min} characters", HttpStatus.BAD_REQUEST),
    FIRSTNAME_INVALID(1003, "First name must be at least {min} characters", HttpStatus.BAD_REQUEST),
    LASTNAME_INVALID(1003, "Last name must be at least {min} characters", HttpStatus.BAD_REQUEST),
    INVALID_PASSWORD(1004, "Password must be at least {min} characters", HttpStatus.BAD_REQUEST),
    USER_NOT_EXISTED(1005, "User not existed", HttpStatus.NOT_FOUND),
    UNAUTHENTICATED(1006, "Unauthenticated", HttpStatus.UNAUTHORIZED),
    UNAUTHORIZED(1007, "You do not have permission", HttpStatus.FORBIDDEN),
    INVALID_DOB(1008, "Your age must be at least {min}", HttpStatus.BAD_REQUEST),
    NO_ROLE(1009, "Role is not exists", HttpStatus.BAD_REQUEST),
    NO_INTRODUCE(1010, "Introduce is not exists", HttpStatus.BAD_REQUEST),
    FILE_OVER_SIZE(1011, "File size is over", HttpStatus.BAD_REQUEST),
    INVALID_FILE_TYPE(1012, "File type is invalid", HttpStatus.BAD_REQUEST),
    NOT_IMAGE_FILE(1013, "File is not image", HttpStatus.BAD_REQUEST),
    WRONG_PW(1014, "Wrong login password", HttpStatus.UNAUTHORIZED),
    EMAIL_INVALID(1015, "Email invalid", HttpStatus.BAD_REQUEST),
    CATEGORY_EXISTED(1016, "Category is existed", HttpStatus.BAD_REQUEST),
    CATEGORY_NOT_EXISTED(1017, "Category is not existed", HttpStatus.BAD_REQUEST),
    NEWS_NOT_EXISTED(1018, "News is not existed", HttpStatus.BAD_REQUEST),
    USER_NEED_RESET_PW(1019, "User need reset pw", HttpStatus.BAD_REQUEST),
    ;

    ErrorCode(int code, String message, HttpStatusCode statusCode) {
        this.code = code;
        this.message = message;
        this.statusCode = statusCode;
    }

    private int code;
    private String message;
    private HttpStatusCode statusCode;
}
