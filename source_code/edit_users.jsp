<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Edit Account</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="edit_users.css">    
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String password = "", email = "";

    try {
        // Kết nối đến cơ sở dữ liệu
        DBconnect db = new DBconnect();
        conn = db.KetNoi();

        // Sử dụng PreparedStatement để tránh SQL Injection
        String sqlSelect = "SELECT * FROM users WHERE id = ?";
        pstmt = conn.prepareStatement(sqlSelect);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            password = rs.getString("password");
            email = rs.getString("email");
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
    <h2>Edit Account</h2>
    <form action="edit_users" method="post">
        <table>
            <tr>
                <td>
                    <input type="hidden" name="id" id="id" value="<%= id %>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" value="<%= password %>" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="email">Username</label>
                    <input type="email" name="email" id="email" value="<%= email %>" required>
                </td>
            </tr>
            <tr>
                <td class="submit">
                    <button type="submit">+ Edit Account</button>
                    <button><a href="Users_Management.jsp" class="cancel-button">Cancel</a></button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>