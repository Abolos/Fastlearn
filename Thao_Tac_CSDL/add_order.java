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

@WebServlet("/add_order")
public class add_order extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        request.setCharacterEncoding("UTF-8");

        String userIdParam = request.getParameter("user_id");
        String courseIdParam = request.getParameter("course_id");
        String totalPriceParam = request.getParameter("total_price");
        String status = request.getParameter("status");

        // Kiểm tra thông tin không null
        if (userIdParam == null || courseIdParam == null || totalPriceParam == null || status == null) {
            response.sendRedirect("Add_order.jsp?error=Missing required information.");
            return;
        }

        int user_id;
        int course_id;
        double total_price;

        try {
            user_id = Integer.parseInt(userIdParam);
            course_id = Integer.parseInt(courseIdParam);
            total_price = Double.parseDouble(totalPriceParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("Add_order.jsp?error=Invalid input format.");
            return;
        }

        // Lưu vào cơ sở dữ liệu
        String sql = "INSERT INTO orders (user_id, course_id, total_price, status) VALUES (?, ?, ?, ?)";

        DBconnect db = new DBconnect();
        Connection conn = null;

        try {
            conn = db.KetNoi(); // Kết nối đến cơ sở dữ liệu
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, user_id);
            stmt.setInt(2, course_id); 
            stmt.setDouble(3, total_price); 
            stmt.setString(4, status); 
            stmt.executeUpdate();

            response.sendRedirect("Orders_Management.jsp"); // Chuyển hướng tới trang quản lý đơn hàng
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Add_order.jsp?error=Database error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Add_order.jsp?error=Error: " + e.getMessage());
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