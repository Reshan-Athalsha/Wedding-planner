package com.ttt.shared;

/**
 * Security utilities to protect the flat-file database from delimiter injection
 * and the front-end from Cross-Site Scripting (XSS).
 */
public class SecurityUtils {

    /**
     * Sanitizes inputs to prevent flat-file delimiter corruption by removing
     * pipes (|) and carriage return / newline characters.
     */
    public static String sanitizeForFile(String input) {
        if (input == null) {
            return null;
        }
        return input.replace("|", "")
                    .replace("\n", " ")
                    .replace("\r", " ");
    }

    /**
     * Escapes standard HTML special characters to prevent Cross-Site Scripting (XSS).
     */
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

    /**
     * Chains both HTML escaping and flat-file sanitization for complete protection.
     */
    public static String clean(String input) {
        if (input == null) {
            return null;
        }
        return sanitizeForFile(escapeHtml(input));
    }
}
