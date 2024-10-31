<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Edit Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="edit_carts.css">    
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int courseId = 0;
    int selectedUserId = 0;

    try {
        // Kết nối đến cơ sở dữ liệu
        DBconnect db = new DBconnect();
        conn = db.KetNoi();

        // Lấy thông tin từ bảng cart
        String sqlSelect = "SELECT user_id, course_id FROM cart WHERE id = ?";
        pstmt = conn.prepareStatement(sqlSelect);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            selectedUserId = rs.getInt("user_id");
            courseId = rs.getInt("course_id");
        }
    } catch (SQLException e) {
        out.println("Lỗi: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
<div class="container">
    <h2>Edit Cart</h2>
    <form action="edit_carts" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <table>
            <tr>
                <td>
                    <label for="username">User</label>
                    <select name="user_id" id="username" required>
                        <option value="">Select User</option>
                        <%
                            // Kết nối lại để lấy danh sách người dùng
                            try {
                                DBconnect db = new DBconnect();
                                conn = db.KetNoi();
                                String sqlUsers = "SELECT id, name FROM users";
                                pstmt = conn.prepareStatement(sqlUsers);
                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                                    int userId = rs.getInt("id");
                                    String userName = rs.getString("name");
                                    // Đánh dấu người dùng hiện tại là selected
                                    String selected = (userId == selectedUserId) ? "selected" : "";
                        %>
                                    <option value="<%= userId %>" <%= selected %>><%= userName %></option>
                        <%
                                }
                            } catch (SQLException e) {
                                out.println("Lỗi: " + e.getMessage());
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                                if (conn != null) try { conn.close(); } catch (SQLException e) {}
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="course">Course</label>
                    <select name="course_id" id="course" required>
                        <option value="">Select Course</option>
                        <%
                            // Kết nối lại để lấy danh sách khóa học
                            try {
                                DBconnect db = new DBconnect();
                                conn = db.KetNoi();
                                String sqlCourses = "SELECT id, title FROM courses";
                                pstmt = conn.prepareStatement(sqlCourses);
                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                                    int currentCourseId = rs.getInt("id");
                                    String courseTitle = rs.getString("title");
                                    // Đánh dấu khóa học hiện tại là selected
                                    String selected = (currentCourseId == courseId) ? "selected" : "";
                        %>
                                    <option value="<%= currentCourseId %>" <%= selected %>><%= courseTitle %></option>
                        <%
                                }
                            } catch (SQLException e) {
                                out.println("Lỗi: " + e.getMessage());
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                                if (conn != null) try { conn.close(); } catch (SQLException e) {}
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="submit">
                    <button type="submit">Update Cart</button>
                    <button><a href="Carts_Management.jsp">Cancel</a></button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>