<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Add Course</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Add_course.css">    
</head>
<body>

<div class="container">
    <h2>Add Course</h2>
    <form action="add_course" method="post">
        <table>

            <tr>
                <td>
                    <label for="title">Title</label>
                    <textarea name="title" id="title" rows="4" required></textarea>
                </td>
            </tr>
            
            <tr>
                <td>
                    <label for="content">Content</label>
                    <textarea name="content" id="content" rows="4" required></textarea>
                </td>
            </tr>
            
            <tr>
                <td>
                    <label for="image">URL Image</label>
                    <textarea name="image" id="image" rows="4" required></textarea>
                </td>
            </tr>
            
            <tr>
                <td>
                    <label for="price">Price</label>
                    <input type="number" name="price" id="price" required>
                </td>
            </tr>
            
            <tr>
                <td>
                    <label for="category_id">Category</label>
                    <select name="category_id" id="category_id" required>
                        <%
                            // Fetch categories for the dropdown
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;
                            try {
                                DBconnect db = new DBconnect();
                                conn = db.KetNoi();
                                String sqlCategories = "SELECT id, name FROM categories";
                                pstmt = conn.prepareStatement(sqlCategories);
                                rs = pstmt.executeQuery();
                                while (rs.next()) {
                                    int catId = rs.getInt("id");
                                    String catName = rs.getString("name");
                        %>
                                    <option value="<%= catId %>"><%= catName %></option>
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
            
            <tr>
                <td>
                    <label for="detail_course">Course Lecture Details</label>
                    <textarea name="detail_course" id="detail_course" rows="4" required></textarea>
                </td>
            </tr>
            <tr>
                <td class="submit">
                    <button type="submit">+ Add Course</button>
                    <button><a href="Courses_Management.jsp">Cancel</a></button>                    
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>