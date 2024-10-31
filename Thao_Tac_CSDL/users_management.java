package Thao_Tac_CSDL;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class users_management {
    public String HienThi() {
        DBconnect db = new DBconnect();
        Connection conn = db.KetNoi();
        String sql = "SELECT * FROM users";
        String st = "";
        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                st += "<tr>";
                st += "<td>" + rs.getInt("id") + "</td>";
                st += "<td>" + rs.getString("email") + "</td>";
                st += "<td>" + rs.getString("password") + "</td>";
                st += "<td class='operation'><a href='edit_users.jsp?id=" + rs.getInt("id") + "'><i class='fa-solid fa-pencil' title='Edit'></i></a> <a href='javascript:void(0);' onclick='confirmDelete(" + rs.getInt("id") + ")'><i class='fa-solid fa-trash' title='Delete'></i></a></td>";
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
              "       window.location.href = 'delete_users.jsp?id=' + id;" +
              "   }" +
              "}" +
              "</script>";

        return st;
    }
}