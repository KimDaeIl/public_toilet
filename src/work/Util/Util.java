package work.Util;

import java.util.regex.Pattern;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class Util {

    public static boolean isNull(Object obj) {
        return obj == null;
    }

    public static boolean isValidStringLength(String str, int length) {
        return isValidStringLength(str, length, length);
    }

    public static boolean isValidStringLength(String str, int min, int max) {
        if (isNull(str)) {
            return false;
        }

        if (str.length() < min || max < str.length()) {
            return false;
        }

        return true;
    }


    public static boolean isMatched(String regex, String inputTxt) {
        return Pattern.matches(regex, inputTxt);
    }

}
