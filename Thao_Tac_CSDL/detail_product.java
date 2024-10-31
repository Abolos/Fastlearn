/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Thao_Tac_CSDL;

/**
 *
 * @author 84396
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
@WebServlet("/detail_product")
public class detail_product  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String title = request.getParameter("title");
        // Kiểm tra email không null
        if (email == null || email.isEmpty()|| title == null || title.isEmpty()) {
            request.setAttribute("errorMessage", "Email, title không được cung cấp.");
            return;
        }

        DBconnect dbConnect = new DBconnect(); // Tạo đối tượng DBconnect
        try (Connection conn = dbConnect.KetNoi()) { // Lấy kết nối từ DBconnect
            // Truy vấn dữ liệu
            String sql = "SELECT id, content, image, price, detail_course FROM courses WHERE title = ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, title);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // Lưu thông tin vào request
                        request.setAttribute("id_course", resultSet.getInt("id"));
                        request.setAttribute("content", resultSet.getString("content"));
                        request.setAttribute("image", resultSet.getString("image"));
                        request.setAttribute("price", resultSet.getDouble("price"));
                        request.setAttribute("detail_course", resultSet.getString("detail_course"));
                        request.setAttribute("email", email);   
                        request.setAttribute("title", title);   
                        // Chuyển tiếp đến trang kết quả
                        RequestDispatcher dispatcher = request.getRequestDispatcher("Detail_product.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Không tìm thấy thông tin người dùng với email: " + email);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi truy vấn cơ sở dữ liệu: " + e.getMessage());
        }
    }
}
