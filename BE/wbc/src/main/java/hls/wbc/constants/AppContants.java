package hls.wbc.constants;

public class AppContants {

    public static class StringValues {
        public static final String Space = " ";
        public static final String Empty = "";
        public static final String Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        public static final String Dot = ".";
        public static final String Comma = ",";
        public static final String Semicolon = ";";
        public static final String Underscore = "_";
    }

    public static class SecuritiesValues {
        public static final int StrengBCrypt = 10;
        public static final String MD5 = "MD5";
        public static  final int AdminId = 1;
        public static final int TokenDuration = 12; //HOURS
        public static final String HasRoleAdmin = "hasRole('Admin')";
        public static final String JWTClaimsSetIssuer = "hls.com";
        public static final String RoleTokenPrefix = "ROLE_";
        public static  final int ResetPwLength = 6;
    }

    public static class UtilitiesValues {
        public static final int FileSizeMaxImage = 104857600; // 10 x 1024 x 1024
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

    public static class Messages {
        public static final String ChangePwSuccess = "Thay đổi password thành công";
    }

    public static class Paging{
        public static final int PageSize = 5;
    }

    public static class FilePaths{
        public static final String DocumentsMessage = "uploads/documents/messages/";
        public static final String ImageUser = "uploads/images/users/";
    }

    public static class SP_PagingList {
        public static final String paramFindText = "findText";
        public static final String paramSort = "sort";
        public static final String paramSortType = "sortType";
        public static final String paramPageIndex = "pageIndex";
        public static final String paramPageTotal = "pageTotal";
    }

    public static class SP_UserGetList {
        public static final String spName = "sp_UserGetList";
        public static final String exeQuery = "CALL sp_UserGetList(:findText, :sort, :sortType, :pageIndex);";
    }

    public static class SP_UserSetDelete {
        public static final String spName = "sp_UserSetDelete";
        public static final String exeQuery = "CALL sp_UserSetDelete(:userid, :userChanged, :deletedValue);";
        public static final String paramUserId = "userid";
        public static final String paramUserChanged = "userChanged";
        public static final String paramDeletedValue = "deletedValue";
    }

    public static class SP_UserSave {
        public static final String spName = "sp_UserSave";
        public static final String exeQuery = "CALL sp_UserSave(:userid, :userChanged, :uName, :pw, :fName, :mName, :lName, :email, :phone);";
        public static final String paramUserId = "userid";
        public static final String paramUserChanged = "userChanged";
        public static final String paramUName = "uName";
        public static final String paramPw = "pw";
        public static final String paramFName = "fName";
        public static final String paramMName = "mName";
        public static final String paramLName = "lName";
        public static final String paramEmail = "email";
        public static final String paramPhone = "phone";
        public static final String paramRolesId = "roles_id";
        public static final String paramOutId = "outid";

    }

    public static class SP_NewsGetList {
        public static final String spName = "sp_NewsGetList";
        public static final String exeQuery = "CALL sp_NewsGetList(:cateId, :findText, :sort, :sortType, :pageIndex);";
        public static final String paramCateId = "cateId";
    }

    public static class SP_NewsSetDelete {
        public static final String spName = "sp_NewsSetDelete";
        public static final String exeQuery = "CALL sp_NewsSetDelete(:id, :userChanged, :deletedValue);";
        public static final String paramId = "id";
        public static final String paramUserChanged = "userChanged";
        public static final String paramDeletedValue = "deletedValue";
    }

    public static class SP_NewsSetShow {
        public static final String spName = "sp_NewsSetShow";
        public static final String exeQuery = "CALL sp_NewsSetShow(:id, :userChanged, :cateId);";
        public static final String paramId = "id";
        public static final String paramUserChanged = "userChanged";
        public static final String paramCateId = "cateId";
    }

    public static class SP_NewsSave {
        public static final String spName = "SP_NewsSave";
        public static final String exeQuery = "CALL SP_NewsSave(:id, :userChanged, :cateId, :subject, :content, :contentEx01, :contentEx02, :contentEx03, :contentEx04, :contentEx05, :contentEx06, :filesId);";
        public static final String paramId = "id";
        public static final String paramUserChanged = "userChanged";
        public static final String paramCateId = "cateId";
        public static final String paramSubject = "subject";
        public static final String paramContent = "content";
        public static final String paramContentEx01 = "contentEx01";
        public static final String paramContentEx02 = "contentEx02";
        public static final String paramContentEx03 = "contentEx03";
        public static final String paramContentEx04 = "contentEx04";
        public static final String paramContentEx05 = "contentEx05";
        public static final String paramContentEx06 = "contentEx06";
        public static final String paramFilesId = "filesId";
        public static final String paramOutId = "outid";

    }

    public static class SP_NewsGetById {
        public static final String spName = "SP_NewsGetById";
        public static final String exeQuery = "CALL SP_NewsGetById(:id);";
        public static final String paramId = "id";
        public static final String paramOutId = "outid";
        public static final String paramOutCateId = "outCateId";
        public static final String paramSubject = "subject";
        public static final String paramContent = "content";
        public static final String paramContentEx01 = "contentEx01";
        public static final String paramContentEx02 = "contentEx02";
        public static final String paramContentEx03 = "contentEx03";
        public static final String paramContentEx04 = "contentEx04";
        public static final String paramContentEx05 = "contentEx05";
        public static final String paramContentEx06 = "contentEx06";
        public static final String paramFilesId = "filesId";
        public static final String paramIsShow = "isShow";

    }

    public static class SP_NewsGetLatestShow {
        public static final String spName = "SP_NewsGetLatestShow";
        public static final String exeQuery = "CALL SP_NewsGetLatestShow(:cateId);";
        public static final String paramCateId = "cateId";
        public static final String paramOutId = "outid";
        public static final String paramOutCateId = "outCateId";
        public static final String paramSubject = "subject";
        public static final String paramContent = "content";
        public static final String paramContentEx01 = "contentEx01";
        public static final String paramContentEx02 = "contentEx02";
        public static final String paramContentEx03 = "contentEx03";
        public static final String paramContentEx04 = "contentEx04";
        public static final String paramContentEx05 = "contentEx05";
        public static final String paramContentEx06 = "contentEx06";
        public static final String paramFilesId = "filesId";
        public static final String paramFilesDisabled = "filesDisabled";
        public static final String paramIsShow = "isShow";

    }
}
