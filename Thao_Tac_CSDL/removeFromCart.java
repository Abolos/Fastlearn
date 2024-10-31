package Thao_Tac_CSDL;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/removeFromCart")
public class removeFromCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idParam = request.getParameter("id");
        String email = request.getParameter("email");

        if (idParam == null || email == null) {
            printErrorMessage(response, "Không tìm thấy thông tin cần thiết.");
            return;
        }

        int cartId;
        try {
            cartId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            printErrorMessage(response, "ID sản phẩm không hợp lệ.");
            return;
        }

        // Xóa sản phẩm khỏi giỏ hàng
        boolean success = removeItemFromCart(cartId);
        
        if (success) {
            // Chuyển tiếp đến trang giỏ hàng
            response.sendRedirect("viewCart?email=" + URLEncoder.encode(email, StandardCharsets.UTF_8.toString()));
        } else {
            printErrorMessage(response, "Không thể xóa sản phẩm khỏi giỏ hàng.");
        }
    }

    private boolean removeItemFromCart(int cartId) {
        DBconnect db = new DBconnect();
        try (Connection conn = db.KetNoi();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM cart WHERE id = ?")) {
            stmt.setInt(1, cartId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu xóa thành công
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

    private void printErrorMessage(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h3>Error: " + message + "</h3>");
        response.getWriter().println("<a href='viewCart'>Quay lại giỏ hàng</a>");
        response.getWriter().println("</body></html>");
    }
}