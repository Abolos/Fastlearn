/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Thao_Tac_CSDL;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit_profile")
public class edit_profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String date_of_birth = request.getParameter("date_of_birth");
        String gender = request.getParameter("gender");
        String name = request.getParameter("name");
        String bio = request.getParameter("bio"); 
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Kết nối đến cơ sở dữ liệu
            DBconnect db = new DBconnect();
            conn = db.KetNoi();

            // Câu lệnh SQL để cập nhật thông tin khóa học
            String sqlUpdate = "UPDATE users SET name = ?, date_of_birth = ?, gender = ?, bio = ?, phone_number = ?, address = ? WHERE email = ?";
            pstmt = conn.prepareStatement(sqlUpdate);
            pstmt.setString(1, name);
            pstmt.setString(2, date_of_birth);
            pstmt.setString(3, gender);
            pstmt.setString(4, bio);
            pstmt.setString(5, phone_number);
            pstmt.setString(6, address);
            pstmt.setString(7, email);

            // Thực hiện cập nhật
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("user_profile?email="+email); // Điều hướng về trang quản lý khóa học
            } else {
                response.getWriter().println("Không tìm thấy users có email: " + email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
}