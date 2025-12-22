package backend.util;

import org.mindrot.jbcrypt.BCrypt;

public class BCryptUtils {
    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(12));
    }

    // hàm kiểm tra mật khẩu
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (hashedPassword == null || !hashedPassword.startsWith("$2a$")) {
            return false;
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}