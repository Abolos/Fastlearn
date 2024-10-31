package Thao_Tac_CSDL;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add_orders")
public class add_orders extends HttpServlet {
    DBconnect db = new DBconnect();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String email = request.getParameter("email");
        Connection conn = null;

        try {
            conn = db.KetNoi(); // Lấy kết nối
            if (conn == null) {
                response.getWriter().println("Lỗi kết nối cơ sở dữ liệu.");
                return;
            }

            conn.setAutoCommit(false); // Bắt đầu transaction

            // Bước 1: Lấy sản phẩm từ giỏ hàng
            String selectSQL = "SELECT course_id, price FROM courses " +
                               "JOIN cart ON courses.id = cart.course_id " +
                               "WHERE cart.user_id = ?";
            PreparedStatement selectStmt = conn.prepareStatement(selectSQL);
            selectStmt.setInt(1, Integer.parseInt(userID));
            ResultSet rs = selectStmt.executeQuery();

            if (!rs.isBeforeFirst()) { // Kiểm tra nếu giỏ hàng trống
                response.getWriter().println("Cart is empty, cannot place order.");
                return;
            }

            // Bước 2: Chèn đơn hàng và tính tổng giá
            String insertSQL = "INSERT INTO orders (user_id, course_id, total_price) VALUES (?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSQL);
            double totalPrice = 0;

            while (rs.next()) {
                int courseId = rs.getInt("course_id");
                double price = rs.getDouble("price");
                totalPrice += price;

                // Thêm từng khóa học vào đơn hàng
                insertStmt.setInt(1, Integer.parseInt(userID));
                insertStmt.setInt(2, courseId);
                insertStmt.setDouble(3, price);
                insertStmt.executeUpdate();
            }

            // Bước 3: Xóa sản phẩm trong giỏ hàng
            String deleteSQL = "DELETE FROM cart WHERE user_id = ?";
            PreparedStatement deleteStmt = conn.prepareStatement(deleteSQL);
            deleteStmt.setInt(1, Integer.parseInt(userID));
            deleteStmt.executeUpdate();

            conn.commit(); // Xác nhận transaction
            response.getWriter().println("Order placed successfully! Total price: " + totalPrice);
            RequestDispatcher dispatcher = request.getRequestDispatcher("orderList?email=" + email + "&userID=" + userID);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                // Nếu có lỗi, rollback cho kết nối đang mở
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            response.getWriter().println("Error occurred while placing the order: " + e.getMessage());
        } finally {
            // Không gọi closeConnection ở đây để giữ kết nối mở
            // DBconnect.closeConnection(); // Không nên gọi ở đây
        }
    }
}