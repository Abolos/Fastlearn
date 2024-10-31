<%-- 
    Document   : delete_users
    Created on : Oct 13, 2024, 11:03:13 PM
    Author     : 84396
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import =" Thao_Tac_CSDL.DBconnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%  
     
        // Lấy ID sản phẩm từ tham số "MaHang"
        String id = request.getParameter("id");

        // Kiểm tra xem ID có null hay không
        if (id == null || id.isEmpty()) {
            out.println("<p>Vui lòng cung cấp id để xóa.</p>");
        } else {
            DBconnect db = new DBconnect();
            Connection conn = null;
            PreparedStatement pstmt = null;
           
            try {
                conn = db.KetNoi();
                String sql = "DELETE FROM courses WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<p>Course đã được xóa thành công!</p>");
                    response.sendRedirect("Courses_Management.jsp");
                } else {
                    out.println("<p>Không tìm thấy course với id: " + id + "</p>");
                }
            } catch (SQLException e) {
                out.println("<p>Đã xảy ra lỗi SQL: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    </body>
</html>
