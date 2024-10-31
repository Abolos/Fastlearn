<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Edit Course</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="edit_courses.css">    
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String title = "", content = "", image = "", detail_course = "";
    Double price = 0.00;
    int category_id = 0;

    try {
        // Kết nối đến cơ sở dữ liệu
        DBconnect db = new DBconnect();
        conn = db.KetNoi();

        // Sử dụng PreparedStatement để tránh SQL Injection
        String sqlSelect = "SELECT c.*, cat.name AS category_name FROM courses c " +
                           "LEFT JOIN categories cat ON c.category_id = cat.id WHERE c.id = ?";
        pstmt = conn.prepareStatement(sqlSelect);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("content");
            image = rs.getString("image");
            price = rs.getDouble("price");
            category_id = rs.getInt("category_id");
            detail_course = rs.getString("detail_course");
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
    <h2>Edit Course</h2>
    <form action="edit_courses" method="post">
        <table>
            <tr>
                <td>
                    <input type="hidden" name="id" id="id" value="<%= id %>">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="title">Title</label>
                    <textarea name="title" id="title" rows="4"><%= title %></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="content">Content</label>
                    <textarea name="content" id="content" rows="4"><%= content %></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="image">URL Image</label>
                    <textarea name="image" id="image" rows="4"><%= image %></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="price">Price</label>
                    <input type="number" name="price" id="price" value="<%= price %>" required>
                </td>
            </tr>
            <tr>
                <td> <label for="category_id">Category</label></td>
            </tr>
            <tr>
                <td>
                    <select style="width:300px;" name="category_id" id="category_id" required>
                        <%
                            // Fetch categories for the dropdown
                            Connection connCategories = null;
                            PreparedStatement pstmtCategories = null;
                            ResultSet rsCategories = null;
                            try {
                                DBconnect dbCategories = new DBconnect();
                                connCategories = dbCategories.KetNoi();
                                String sqlCategories = "SELECT id, name FROM categories";
                                pstmtCategories = connCategories.prepareStatement(sqlCategories);
                                rsCategories = pstmtCategories.executeQuery();
                                while (rsCategories.next()) {
                                    int catId = rsCategories.getInt("id");
                                    String catName = rsCategories.getString("name");
                                    String selected = (catId == category_id) ? "selected" : "";
                        %>
                        <option value="<%= catId %>" <%= selected %>><%= catName %></option>
                        <%
                                }
                            } catch (SQLException e) {
                                out.println("Lỗi: " + e.getMessage());
                            } finally {
                                if (rsCategories != null) try { rsCategories.close(); } catch (SQLException e) {}
                                if (pstmtCategories != null) try { pstmtCategories.close(); } catch (SQLException e) {}
                                if (connCategories != null) try { connCategories.close(); } catch (SQLException e) {}
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="detail_course">Course Lecture Details</label>
                    <textarea name="detail_course" id="detail_course" rows="4"><%= detail_course %></textarea>
                </td>
            </tr>
            <tr>
                <td class="submit">
                    <button type="submit">Edit Course</button>
                    <button><a href="Courses_Management.jsp" class="cancel-button">Cancel</a></button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>