package Thao_Tac_CSDL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/SendOTPServlet")
public class SendOTPServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String dateOfBirth = request.getParameter("date_of_birth");
        String gender = request.getParameter("gender");

        // Kiểm tra mật khẩu và xác nhận mật khẩu
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("Sign_up.jsp?error=Passwords do not match");
            return;
        }

        // Lưu thông tin vào session
        HttpSession session = request.getSession();
        session.setAttribute("email", email);
        session.setAttribute("password", password);
        session.setAttribute("dateOfBirth", dateOfBirth);
        session.setAttribute("gender", gender);

        // Chuyển tiếp đến trang thông tin
        request.getRequestDispatcher("infor.jsp").forward(request, response);
    }
}
