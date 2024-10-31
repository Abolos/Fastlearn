package Thao_Tac_CSDL;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderList")
public class OrderListServlet extends HttpServlet {
    private DBconnect db = new DBconnect();
    private Connection conn = null; // Giữ kết nối mở

    @Override
    public void init() throws ServletException {
        super.init();
        conn = db.KetNoi(); // Lấy kết nối khi khởi tạo servlet
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");

        String userIdParam = request.getParameter("userID");
        String email = request.getParameter("email");
        if (userIdParam != null) {
            try {
                int userId = Integer.parseInt(userIdParam);
                List<List<String>> orders = getOrdersByUserId(userId);

                request.setAttribute("orders", orders);
                request.getRequestDispatcher("orderList.jsp?email="+email).forward(request, response);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid user ID format.");
            }
        } else {
            response.getWriter().println("Please provide a valid user ID.");
        }
    }

    private List<List<String>> getOrdersByUserId(int userId) {
        List<List<String>> orders = new ArrayList<>();
        String sql = "SELECT c.image, c.title, o.total_price, o.status " +
                     "FROM orders o " +
                     "JOIN courses c ON o.course_id = c.id " +
                     "WHERE o.user_id = ?";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                List<String> order = new ArrayList<>();
                order.add(rs.getString("image"));
                order.add(rs.getString("title"));
                order.add(String.valueOf(rs.getDouble("total_price")));
                order.add(rs.getString("status"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public void destroy() {
        // Đóng kết nối khi servlet bị hủy
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}