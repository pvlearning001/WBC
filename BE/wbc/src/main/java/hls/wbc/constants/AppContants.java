package hls.wbc.constants;

import com.nimbusds.jwt.JWTClaimsSet;

public class AppContants {

    public static class StringValues {
        public static final String Space = " ";
        public static final String Empty = "";
        public static final String Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        public static final String Dot = ".";
        public static final String Underscore = "_";
    }

    public static class SecuritiesValues {
        public static final int StrengBCrypt = 10;
        public static final String MD5 = "MD5";
        public static  final int AdminId = 1;
        public static  final int UserRoleId = 1;
        public static final int TokenDuration = 12; //HOURS
        public static final String HasRoleAdmin = "hasRole('Admin')";
        public static final String JWTClaimsSetIssuer = "hls.com";
    }

    public static class UtilitiesValues {
        public static final int FileSizeMaxImage = 10485760; // 10 x 1024 x 1024
        public static final String FileContentTypeImage = "image/";
        public static final String FileContentTypePdf = "application/pdf";

    }

    public static class TokenKeyClaim {
        public static final String UNCATEGORIZED_EXCEPTION = "UNCATEGORIZED_EXCEPTION";
        public static final String scope = "scope";
        public static final String fullName = "fullName";
        public static final String userId = "userId";

    }

    public static class KeysErrorCode {
        public static final String UNCATEGORIZED_EXCEPTION = "UNCATEGORIZED_EXCEPTION";
        public static final String INVALID_KEY = "INVALID_KEY";
        public static final String USER_EXISTED = "USER_EXISTED";
        public static final String INVALID_USERNAME = "USERNAME_INVALID";
        public static final String INVALID_FIRSTNAME = "FIRSTNAME_INVALID";
        public static final String INVALID_LASTNAME = "LASTNAME_INVALID";
        public static final String INVALID_PASSWORD = "INVALID_PASSWORD";
        public static final String USER_NOT_EXISTED = "USER_NOT_EXISTED";
        public static final String UNAUTHENTICATED = "UNAUTHENTICATED";
        public static final String UNAUTHORIZED = "UNAUTHORIZED";
        public static final String INVALID_DOB = "INVALID_DOB";
        public static final String NO_ROLE = "NO_ROLE";
        public static final String NO_INTRODUCE = "NO_INTRODUCE";
        public static final String FILE_OVER_SIZE = "FILE_OVER_SIZE";
        public static final String INVALID_FILE_TYPE = "INVALID_FILE_TYPE";
        public static final String NOT_IMAGE_FILE = "NOT_IMAGE_FILE";
        public static final String WRONG_PW = "WRONG_PW";
        public static final String EMAIL_INVALID = "EMAIL_INVALID";
    }

    public static class Categories{
        public static final String Announcement = "Announcement";
    }

    public static class Roles{
        public static final String Admin = "Admin";
        public static final String User = "User";
        public static final String RoleAdmin = "ROLE_Admin";
        public static final String RoleUser = "ROLE_User";
    }

    public static class FilePaths{
        public static final String DocumentsMessage = "uploads/documents/messages/";
        public static final String ImageUser = "uploads/images/users/";
    }
}
