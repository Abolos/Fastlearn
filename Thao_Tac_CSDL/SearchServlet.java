package Thao_Tac_CSDL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    DBconnect db = new DBconnect();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        String email = request.getParameter("email");
        String keyword = request.getParameter("keyword");
        System.out.println("Keyword received: " + keyword); // Log giá trị từ khóa

        PrintWriter out = response.getWriter();

        if (keyword == null || keyword.trim().isEmpty()) {
            out.println("Please enter a keyword");
            return;
        }

        List<String> results = searchCourses(keyword);
        if (results.isEmpty()) {
            out.println("No results found.");
        } else {
            for (String title : results) {
                out.println("<div><a href=\"detail_product?email=" + email + "&title=" + title + "\">" + title + "</a></div>");
            }
        }
    }

    private List<String> searchCourses(String keyword) {
        List<String> courses = new ArrayList<>();
        String sql = "SELECT title FROM courses WHERE title LIKE ?";
        Connection conn = null;

        try {
            conn = db.KetNoi(); // Lấy kết nối
            if (conn == null) {
                System.err.println("Lỗi kết nối cơ sở dữ liệu.");
                return courses; // Trả về danh sách trống
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                courses.add(rs.getString("title"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Ghi lại lỗi
        } finally {
            // Không gọi closeConnection để giữ kết nối mở
        }
        return courses;
    }
}