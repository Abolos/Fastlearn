package Thao_Tac_CSDL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/add_course")
public class add_course extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String titleParam = request.getParameter("title");
        String contentParam = request.getParameter("content");
        String imageParam = request.getParameter("image");
        String detailcourseParam = request.getParameter("detail_course");
        String priceParam = request.getParameter("price");
        String categoryIdParam = request.getParameter("category_id");

        // Kiểm tra thông tin không null
        if (titleParam == null || contentParam == null || imageParam == null || detailcourseParam == null ||
            priceParam == null || categoryIdParam == null) {
            request.setAttribute("error", "Missing required information.");
            request.getRequestDispatcher("Add_course.jsp").forward(request, response);
            return;
        }

        int category_id;
        double price;

        try {
            category_id = Integer.parseInt(categoryIdParam);
            price = Double.parseDouble(priceParam);
            if (price < 0) {
                request.setAttribute("error", "Price cannot be negative.");
                request.getRequestDispatcher("Add_course.jsp").forward(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format.");
            request.getRequestDispatcher("Add_course.jsp").forward(request, response);
            return;
        }

        String sql = "INSERT INTO courses (title, content, image, price, category_id, detail_course) VALUES (?, ?, ?, ?, ?, ?)";

        DBconnect db = new DBconnect();
        Connection conn = null;

        try {
            conn = db.KetNoi();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, titleParam);
            stmt.setString(2, contentParam);
            stmt.setString(3, imageParam);
            stmt.setDouble(4, price);
            stmt.setInt(5, category_id);
            stmt.setString(6, detailcourseParam);
            stmt.executeUpdate();

            response.sendRedirect("Courses_Management.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("Add_course.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("Add_course.jsp").forward(request, response);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}