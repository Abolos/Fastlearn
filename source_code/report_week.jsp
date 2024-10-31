<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Report of Courses</title>
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
    <h1>Weekly Course Sales Report</h1>
    <table>
        <thead>
            <tr>
                <th>Course Title</th>
                <th>Quantity Sold</th>
                <th>Total Amount</th>
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
                    
                    // Query data
                    String sql =    "SELECT c.title, COUNT(o.id) AS total_quantity, SUM(o.total_price) AS total_amount " +
                                    "FROM orders o " +
                                    "JOIN courses c ON o.course_id = c.id " +
                                    "WHERE o.created_at >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) " +
                                    "GROUP BY c.id " +
                                    "ORDER BY total_amount DESC";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();
                    double revenue =0.0;

                    // Display data
                    while (rs.next()) {
                        String title = rs.getString("title");
                        int totalQuantity = rs.getInt("total_quantity");
                        double totalAmount = rs.getDouble("total_amount");
            %>
            <tr>
                <td><%= title %></td>
                <td><%= totalQuantity %></td>
                <td><%= String.format("%.2f", totalAmount) %> USD</td>
            </tr>
            <%
                revenue += totalAmount; 
                    }
            %>
            <tr>
                <td colspan="2"><h2>Revenue</h2></td>
                <td><%= String.format("%.2f", revenue) %> USD</td>                
            </tr>
            <%
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