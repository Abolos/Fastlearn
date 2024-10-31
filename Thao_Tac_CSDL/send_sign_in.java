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
import javax.servlet.http.HttpSession;

@WebServlet("/send_sign_in")
public class send_sign_in extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Kết nối đến cơ sở dữ liệu
            if ("Admin@gmail.com".equals(email) && "admin123".equals(password)){
                 response.sendRedirect("Main_admin.jsp?email=" + email);
            }
            else {
            DBconnect db = new DBconnect();
            Connection conn = db.KetNoi();
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Kiểm tra kết quả
            if (resultSet.next()) {
                // Đăng nhập thành công
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                System.out.println("Login successful, redirecting to Home_login.jsp");
                response.sendRedirect("Home_login.jsp?email=" + email); // Chuyển hướng tới trang home
            } else {
                // Đăng nhập thất bại, chuyển hướng về trang đăng nhập với thông báo lỗi
                response.sendRedirect("Sign_in.jsp?error=Wrong email or password");
            }

            // Đóng kết nối
            resultSet.close();
            preparedStatement.close();
            conn.close();
        }
        }
        catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred. Please try again later.");
        }
    }
}