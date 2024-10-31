<%-- 
    Document   : Add_category
    Created on : Oct 12, 2024, 9:56:25 AM
    Author     : 84396
--%>

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>edit category</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="edit_categorys.css">    
</head>
<body>
    
<%  
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = "", description = "";

    try {
        // Kết nối đến cơ sở dữ liệu
        DBconnect db = new DBconnect();
        conn = db.KetNoi();

        // Sử dụng PreparedStatement để tránh SQL Injection
        String sqlSelect = "SELECT * FROM categories WHERE id = ?";
        pstmt = conn.prepareStatement(sqlSelect);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            description = rs.getString("description");
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
    <h2>edit Category</h2>
    <form action="edit_categorys" method="post">
        <table>
             <tr>
                <td>
                    <input type="hidden" name="id" id="id" value="<%= id %>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="name">Category name</label>
                    <input type="text" name="name" id="name" value="<%= name %>" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="description">Description</label>
                    <input type="text" name="description" id="description" value="<%= description %>" required>
                </td>
            </tr>
            <tr>
                <td class="submit"">
                    <button type="submit">+ edit category</button>
                    <button><a href="Categorys_Management.jsp">Cancel</a></button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>