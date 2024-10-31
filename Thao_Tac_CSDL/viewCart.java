/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Thao_Tac_CSDL;

import java.io.IOException;
import java.math.BigDecimal; // Thêm import cho BigDecimal
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewCart")
public class viewCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        int userId =  getUserIdByEmail(email);
        List<CartItem> cartItems = getCartItems(userId);

        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Shopping_cart.jsp?email=" + email + "&userID=" + userId);
        dispatcher.forward(request, response);
    }

    private List<CartItem> getCartItems(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        DBconnect db = new DBconnect();

        try (Connection conn = db.KetNoi();
             PreparedStatement stmt = conn.prepareStatement(
                 "SELECT c.id AS cart_id, co.image AS image_course, co.title AS title_course, co.price AS price_course " +
                 "FROM cart c " +
                 "JOIN courses co ON c.course_id = co.id " +
                 "WHERE c.user_id = ?")) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setCartId(rs.getInt("cart_id"));
                item.setImageCourse(rs.getString("image_course"));
                item.setTitleCourse(rs.getString("title_course"));
                item.setPriceCourse(rs.getBigDecimal("price_course"));
                cartItems.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    // Lớp CartItem để chứa thông tin giỏ hàng
    public static class CartItem {
        private int cartId;
        private String imageCourse;
        private String titleCourse;
        private BigDecimal priceCourse;

        // Getters và Setters
        public int getCartId() { return cartId; }
        public void setCartId(int cartId) { this.cartId = cartId; }
        public String getImageCourse() { return imageCourse; }
        public void setImageCourse(String imageCourse) { this.imageCourse = imageCourse; }
        public String getTitleCourse() { return titleCourse; }
        public void setTitleCourse(String titleCourse) { this.titleCourse = titleCourse; }
        public BigDecimal getPriceCourse() { return priceCourse; }
        public void setPriceCourse(BigDecimal priceCourse) { this.priceCourse = priceCourse; }
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
}