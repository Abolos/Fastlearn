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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        int courseId = Integer.parseInt(request.getParameter("id_course"));

        // Lấy user_id từ email
        int userId = getUserIdByEmail(email);

        if (userId != -1) {
            addToCart(userId, courseId);
            response.getWriter().write("Product added to cart successfully.");
            // Chuyển tiếp đến servlet viewCart
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewCart?email="+email);
            dispatcher.forward(request, response);
        } else {
            response.getWriter().write("User not found.");
        }
    }

    private int getUserIdByEmail(String email) {
    int userId = -1;
    DBconnect db = new DBconnect();
    try (Connection conn =db.KetNoi();
         PreparedStatement stmt = conn.prepareStatement("SELECT id FROM users WHERE email = ?")) {
        stmt.setString(1, email.trim()); // Trimming email
        var rs = stmt.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("id");
        }
    } catch (Exception e) {
        e.printStackTrace(); // In ra lỗi nếu có
    }
    return userId;
}

    private void addToCart(int userId, int courseId) {
        DBconnect db = new DBconnect();
        try (Connection conn =db.KetNoi();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO cart (user_id, course_id) VALUES (?, ?)")) {
            stmt.setInt(1, userId);
            stmt.setInt(2, courseId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}