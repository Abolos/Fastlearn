package Thao_Tac_CSDL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/send_infor_user")
public class send_infor_user extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String name = request.getParameter("username");
        String phoneNumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        String bio = request.getParameter("bio");

        // Kiểm tra thông tin không null
        if (email == null || password == null || dateOfBirth == null || gender == null || name == null || phoneNumber == null) {
            response.sendRedirect("infor.jsp?error=Missing required information.");
            return;
        }

        // Lưu vào cơ sở dữ liệu
        String sql = "INSERT INTO users (email, password, date_of_birth, gender, name, phone_number, address, bio) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        DBconnect db = new DBconnect();
        Connection conn = null;

        try {
            conn = db.KetNoi(); // Kết nối đến cơ sở dữ liệu
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, email);
            stmt.setString(2, password); // Cần mã hóa mật khẩu trước khi lưu
            stmt.setString(3, dateOfBirth);
            stmt.setString(4, gender);
            stmt.setString(5, name);
            stmt.setString(6, phoneNumber);
            stmt.setString(7, address);
            stmt.setString(8, bio);
            stmt.executeUpdate();

            response.sendRedirect("Sign_in.jsp"); // Chuyển hướng tới trang đăng nhập
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("infor.jsp?error=Database error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("infor.jsp?error=Error: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close(); // Đảm bảo đóng kết nối khi hoàn tất
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
