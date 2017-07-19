package work.Util;

import java.util.regex.Pattern;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class Util {

	public static boolean isEqualsNull(String str) {
		if (isNull(str)) {
			return true;
		}

		str = str.trim();
		if (str.equalsIgnoreCase("null"))
			return true;

		return false;
	}

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

		str = str.trim();
		if (str.length() < min || max < str.length()) {
			return false;
		}

		return true;
	}

	public static boolean isMatched(String regex, String inputStr) {
		if (!(isNull(regex) && isNull(inputStr))) {
			return Pattern.matches(regex, inputStr);
		}

		return false;
	}

	public static boolean isValidId(int id) {
		return id > 0;
	}

}
