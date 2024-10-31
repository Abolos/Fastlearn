<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Thao_Tac_CSDL.DBconnect"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Add Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Add_cart.css">    
</head>
<body>

<div class="container">
    <h2>Add Cart</h2>
    <form action="add_cart" method="post">
        <table>
            <tr>
                <td>
                    <label for="user_id">User</label>
                    <select name="user_id" id="user_id" required>
                        <option value="">Select User</option>
                        <%
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            try {
                                // Kết nối đến cơ sở dữ liệu
                                DBconnect db = new DBconnect();
                                conn = db.KetNoi();
                                String sqlUsers = "SELECT id, name FROM users";
                                pstmt = conn.prepareStatement(sqlUsers);
                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                                    int userId = rs.getInt("id");
                                    String userName = rs.getString("name");
                        %>
                                    <option value="<%= userId %>"><%= userName %></option>
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
                    <label for="course_id">Course</label>
                    <select name="course_id" id="course_id" required>
                        <option value="">Select Course</option>
                        <%
                            try {
                                // Kết nối lại để lấy danh sách khóa học
                                DBconnect db = new DBconnect();
                                conn = db.KetNoi();
                                String sqlCourses = "SELECT id, title FROM courses";
                                pstmt = conn.prepareStatement(sqlCourses);
                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                                    int courseId = rs.getInt("id");
                                    String courseTitle = rs.getString("title");
                        %>
                                    <option value="<%= courseId %>"><%= courseTitle %></option>
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
                    <button type="submit">+ Add Cart</button>
                    <button><a href="Carts_Management.jsp">Cancel</a></button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>