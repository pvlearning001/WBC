package hls.wbc.utilities;

import hls.wbc.constants.AppContants;
import hls.wbc.enums.WordTypes;

import java.util.List;
import java.util.Random;

public class AppUtils {
    public static int getRandomInt(int min, int max){
        return min + (int) (Math.random() * (max - min + 1));
    }

    public static boolean isNullOrEmptyString(String text){
        return (text == null || text.isEmpty());
    }

    public static boolean isNullOrEmptyOrBlank(String text){
        return isNullOrEmptyString(text) || text.isBlank();
    }

    public static boolean isEmptyOrBlank(String text){
        return (text != null) && (text.isEmpty() || text.isBlank());
    }

    public static String toTitleCase(String text) {
        if (isNullOrEmptyOrBlank(text)) {
            return text;
        }

        StringBuilder converted = new StringBuilder();
        boolean convertNext = true;
        for (char ch : text.toCharArray()) {
            if (Character.isSpaceChar(ch)) {
                convertNext = true;
            } else if (convertNext) {
                ch = Character.toTitleCase(ch);
                convertNext = false;
            } else {
                ch = Character.toLowerCase(ch);
            }
            converted.append(ch);
        }

        return converted.toString();
    }

    public static String trimMiddleSpaceSentence(String text){
        if (text == null)  return text;
        text = text.trim();
        if (isEmptyOrBlank(text)) return text;
        StringBuilder result = new StringBuilder();
        String[] stringArray = text.split(AppContants.StringValues.Space);
        for (String word : stringArray) {
            word = word.trim();
            if (!isEmptyOrBlank(word)){
                result.append(AppContants.StringValues.Space).append(word);
            }
        }
        return result.toString().trim();
    }

    public static String getRandomWord(int length, WordTypes workTypes){
        // create random string builder
        StringBuilder sb = new StringBuilder();
        // create an object of Random class
        Random random = new Random();
        // specify length of random string
        for(int i = 0; i < length; i++) {
            // generate random index number
            int index = random.nextInt(AppContants.StringValues.Alphabet.length());
            // get character specified by index
            // from the string
            char randomChar = AppContants.StringValues.Alphabet.charAt(index);
            // append the character to string builder
            sb.append(randomChar);
        }
        String result = sb.toString().toLowerCase();
        switch (workTypes) {
            case WordTypes.UPPER:
                result = result.toUpperCase();
                break;
            case WordTypes.TITLE:
                result = toTitleCase(result);
                break;
            default:
                break;
        }
        return result;
    }

    public static String getRandomSentence(int length, int minWordLen, int maxWordLen, WordTypes workTypes){
        StringBuilder result = new StringBuilder();
        String word;
        int wordLen;
        for(int i = 0; i < length; i++) {
            wordLen = getRandomInt(minWordLen, maxWordLen);
            word = getRandomWord(wordLen, workTypes);
            if (word != null)
                result.append(AppContants.StringValues.Space).append(word);
        }
        return result.toString().trim();
    }

    public static int getTotalPage(int totalRecord){
        int result = totalRecord/AppContants.Paging.PageSize;
        int mod = totalRecord % AppContants.Paging.PageSize;
        if (mod > 0)
            result = result + 1;
        return result;
    }
}
