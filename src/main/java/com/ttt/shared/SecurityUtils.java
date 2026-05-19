package com.ttt.shared;


public class SecurityUtils {


    public static String sanitizeForFile(String input) {
        if (input == null) {
            return null;
        }
        return input.replace("|", "")
                    .replace("\n", " ")
                    .replace("\r", " ");
    }


    public static String escapeHtml(String input) {
        if (input == null) {
            return null;
        }
        return input.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }


    public static String clean(String input) {
        if (input == null) {
            return null;
        }
        return sanitizeForFile(escapeHtml(input));
    }
}
