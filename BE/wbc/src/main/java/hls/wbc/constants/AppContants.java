package hls.wbc.constants;

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
        public static final int TokenDuration = 1; //DAY
    }

    public static class UtilitiesValues {
        public static final int FileSizeMaxImage = 10485760; // 10 x 1024 x 1024
        public static final String FileContentTypeImage = "image/";
    }
}
