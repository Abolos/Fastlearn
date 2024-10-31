<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Add Order</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Add_order.css">    
</head>
<body>

<div class="container">
    <h2>Add Order</h2>
    <form action="add_order" method="post">
        <table>
            <tr> <td><label for="status">Status</label></td></tr>
            <tr>
                <td>
                    <select style="width: 300px;" name="status" id="status" required>
                        <option value="">Select status</option>
                        <option value="pending">Pending</option>
                        <option value="completed">Completed</option>
                        <option value="failed">Failed</option>
                    </select>
                </td>
            </tr>
            
            <tr><td><label for="user_id">User</label></td></tr>
            <tr>
                <td>
                    <select style="width: 300px;" name="user_id" id="user_id" required>
                        <option value="">Select User</option>
                        <%
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            try {
                                DBconnect db = new DBconnect();
                                conn = db.KetNoi();
                                String sqlUsers = "SELECT id, name FROM users";
                                pstmt = conn.prepareStatement(sqlUsers);
                                rs = pstmt.executeQuery();
                                
                                while (rs.next()) {
                                    int userId = rs.getInt("id");
                                    String username = rs.getString("name");
                        %>
                                    <option value="<%= userId %>"><%= username %></option>
                        <%
                                }
                            } catch (SQLException e) {
                                out.println("Error: " + e.getMessage());
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                                if (conn != null) try { conn.close(); } catch (SQLException e) {}
                            }
                        %>
                    </select>
                </td>
            </tr>
            
            <tr><td><label for="course_id">Course</label></td></tr>
            <tr>
                <td>
                    <select style="width: 300px;" name="course_id" id="course_id" required>
                        <option value="">Select Course</option>
                        <%
                            try {
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
                                out.println("Error: " + e.getMessage());
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                                if (conn != null) try { conn.close(); } catch (SQLException e) {}
                            }
                        %>
                    </select>
                </td>
            </tr>
            
            <tr><td><label for="total_price">Total Price</label></td></tr>
            <tr>
                <td><input type="number" name="total_price" id="total_price" required></td>
            </tr>
            <tr>
                <td colspan="2" class="submit">
                    <button type="submit">+ Add Order</button>
                    <button type="button" onclick="window.location.href='Orders_Management.jsp'">Cancel</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>