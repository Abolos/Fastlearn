<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unsold Courses Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 20px;
        }
        h1 {
            text-align: center;
            color: #6E6AFF;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #6E6AFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .cancel-button {
            background-color: #FA630E;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
        }
        .cancel-button:hover {
            background-color: #d32f2f; /* Darker red */
        }
    </style>
</head>
<body>
    <h1>Unsold Courses in the Last Year</h1>
    <table>
        <thead>
            <tr>
                <th>Course Title</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    // Establish database connection
                    DBconnect db = new DBconnect();
                    conn = db.KetNoi();
                    
                    // Query data for unsold courses in the last year
                    String sql = "SELECT c.title " +
                                 "FROM courses c " +
                                 "LEFT JOIN orders o ON c.id = o.course_id AND o.created_at >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) " +
                                 "WHERE o.id IS NULL";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    // Display data
                    while (rs.next()) {
                        String title = rs.getString("title");
            %>
            <tr>
                <td><%= title %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close connection
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            %>
        </tbody>
    </table>
    
    <div class="button-container">
        <a href="Main_admin.jsp" class="cancel-button">Cancel</a>
    </div>
</body>
</html>