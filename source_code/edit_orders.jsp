<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Edit Order</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="edit_orders.css">    
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String status = "";
    String selectedUsername = "";
    String selectedCourseTitle = "";
    double totalPrice = 0.0;

    try {
        // Kết nối đến cơ sở dữ liệu
        DBconnect db = new DBconnect();
        conn = db.KetNoi();

        // Truy vấn để lấy thông tin đơn hàng
        String sqlSelect = "SELECT u.name AS username, c.title AS courseTitle, o.status, o.total_price " +
                           "FROM orders o " +
                           "JOIN users u ON o.user_id = u.id " +
                           "JOIN courses c ON o.course_id = c.id " +
                           "WHERE o.id = ?";
        pstmt = conn.prepareStatement(sqlSelect);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            selectedUsername = rs.getString("username");
            selectedCourseTitle = rs.getString("courseTitle");
            status = rs.getString("status");
            totalPrice = rs.getDouble("total_price");
        }

        // Lấy danh sách người dùng
        String sqlUsers = "SELECT id, name FROM users";
        pstmt = conn.prepareStatement(sqlUsers);
        ResultSet rsUsers = pstmt.executeQuery();

        List<String> usernames = new ArrayList<>();
        List<Integer> userIds = new ArrayList<>();

        while (rsUsers.next()) {
            usernames.add(rsUsers.getString("name"));
            userIds.add(rsUsers.getInt("id"));
        }

        // Lấy danh sách khóa học
        String sqlCourses = "SELECT id, title FROM courses";
        pstmt = conn.prepareStatement(sqlCourses);
        ResultSet rsCourses = pstmt.executeQuery();

        List<String> courseTitles = new ArrayList<>();
        List<Integer> courseIds = new ArrayList<>();

        while (rsCourses.next()) {
            courseTitles.add(rsCourses.getString("title"));
            courseIds.add(rsCourses.getInt("id"));
        }
%>
<div class="container">
    <h2>Edit Order</h2>
    <form action="edit_orders" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <table>
            <tr><td><label for="status">Status</label></td></tr>
            <tr>
                <td>
                    <select style="width: 300px;" name="status" id="status" required>
                        <option value="pending" <%= status.equals("pending") ? "selected" : "" %>>Pending</option>
                        <option value="completed" <%= status.equals("completed") ? "selected" : "" %>>Completed</option>
                        <option value="failed" <%= status.equals("failed") ? "selected" : "" %>>Failed</option>
                    </select>
                </td>
            </tr>
            <tr> <td><label for="username">User Name</label></td></tr>
            <tr>
                <td>
                    <select style="width: 300px;" name="user_id" id="username" required>
                        <%
                            for (int i = 0; i < usernames.size(); i++) {
                                String username = usernames.get(i);
                                int userId = userIds.get(i);
                        %>
                            <option value="<%= userId %>" <%= selectedUsername.equals(username) ? "selected" : "" %>><%= username %></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr> <td><label for="courseTitle">Course Title</label></td></tr>
            <tr>
                <td>
                    <select style="width: 300px;" name="course_id" id="courseTitle" required>
                        <%
                            for (int i = 0; i < courseTitles.size(); i++) {
                                String courseTitle = courseTitles.get(i);
                                int courseId = courseIds.get(i);
                        %>
                            <option value="<%= courseId %>" <%= selectedCourseTitle.equals(courseTitle) ? "selected" : "" %>><%= courseTitle %></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="total_price">Total Price</label></td>
            </tr>
            <tr>
                <td><input type="number" name="total_price" id="total_price" value="<%= totalPrice %>" required></td>
            </tr>
            <tr>
                <td colspan="2" class="submit">
                    <button type="submit">Edit Order</button>
                    <button type="button" onclick="window.location.href='Orders_Management.jsp'">Cancel</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<%
        rsUsers.close();
        rsCourses.close();
    } catch (SQLException e) {
        out.println("Lỗi: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
</body>
</html>