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

@WebServlet("/add_category")
public class add_category extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        // Kiểm tra thông tin không null
        if (name == null || description == null) {
            response.sendRedirect("Add_category.jsp?error=Missing required information.");
            return;
        }

        // Lưu vào cơ sở dữ liệu
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";

        DBconnect db = new DBconnect();
        Connection conn = null;

        try {
            conn = db.KetNoi(); // Kết nối đến cơ sở dữ liệu
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, name);
            stmt.setString(2, description); // Cần mã hóa mật khẩu trước khi lưu
            stmt.executeUpdate();

            response.sendRedirect("Categorys_Management.jsp"); // Chuyển hướng tới trang đăng nhập
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Add_category.jsp?error=Database error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Add_category.jsp?error=Error: " + e.getMessage());
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
