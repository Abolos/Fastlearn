package Thao_Tac_CSDL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
    private static final String URL = "jdbc:mysql://localhost/fastlearn?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private Connection connection; // Lưu trữ kết nối

    public Connection KetNoi() {
        if (connection == null) {
            try {
                // Đăng ký driver MySQL
                Class.forName("com.mysql.cj.jdbc.Driver"); // Sử dụng driver mới
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (ClassNotFoundException e) {
                System.err.println("Driver không tìm thấy: " + e.getMessage());
            } catch (SQLException e) {
                System.err.println("Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
            }
        }
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null; // Đặt lại kết nối để có thể tái tạo sau này
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng kết nối: " + e.getMessage());
            }
        }
    }
}
