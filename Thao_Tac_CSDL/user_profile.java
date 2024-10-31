package Thao_Tac_CSDL;

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

@WebServlet("/user_profile")
public class user_profile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Kiểm tra email không null
        if (email == null || email.isEmpty()) {
            request.setAttribute("errorMessage", "Email không được cung cấp.");
            return;
        }

        DBconnect dbConnect = new DBconnect(); // Tạo đối tượng DBconnect
        try (Connection conn = dbConnect.KetNoi()) { // Lấy kết nối từ DBconnect
            // Truy vấn dữ liệu
            String sql = "SELECT name, date_of_birth, gender, bio, phone_number, address FROM users WHERE email = ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // Lưu thông tin vào request
                        request.setAttribute("name", resultSet.getString("name"));
                        request.setAttribute("date_of_birth", resultSet.getDate("date_of_birth"));
                        request.setAttribute("gender", resultSet.getString("gender"));
                        request.setAttribute("bio", resultSet.getString("bio"));
                        request.setAttribute("phone_number", resultSet.getString("phone_number"));
                        request.setAttribute("address", resultSet.getString("address"));
                        request.setAttribute("email", email);                            
                        // Chuyển tiếp đến trang kết quả
                        RequestDispatcher dispatcher = request.getRequestDispatcher("Public_profile.jsp");
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