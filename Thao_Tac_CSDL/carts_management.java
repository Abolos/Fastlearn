package Thao_Tac_CSDL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class carts_management {
    public String HienThi() {
        DBconnect db = new DBconnect();
        Connection conn = db.KetNoi();
        String sql = "SELECT c.id, u.name AS username, co.title AS course_title " +
                     "FROM cart c " +
                     "JOIN users u ON c.user_id = u.id " +
                     "JOIN courses co ON c.course_id = co.id";
        String st = "";
        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                st += "<tr>";
                st += "<td>" + rs.getInt("id") + "</td>";
                st += "<td>" + rs.getString("username") + "</td>";
                st += "<td>" + rs.getString("course_title") + "</td>";
                st += "<td class='operation'><a href='edit_carts.jsp?id=" + rs.getInt("id") + "'><i class='fa-solid fa-pencil' title='Edit'></i></a> <a href='javascript:void(0);' onclick='confirmDelete(" + rs.getInt("id") + ")'><i class='fa-solid fa-trash' title='Delete'></i></a></td>";
                st += "</tr>";
            }
          
        } catch (SQLException ex) {
            st = "<p>Đã xảy ra lỗi: " + ex.getMessage() + "</p>";
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // Thêm script JavaScript cho xác nhận xóa
        st += "<script>" +
              "function confirmDelete(id) {" +
              "   if (confirm('Bạn có chắc chắn muốn xóa mục này?')) {" +
              "       window.location.href = 'delete_carts.jsp?id=' + id;" +
              "   }" +
              "}" +
              "</script>";

        return st;
    }
}