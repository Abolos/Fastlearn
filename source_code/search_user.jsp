<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Thao_Tac_CSDL.DBconnect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Users Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Users_Management.css">
</head>
<body>
<header>
    <nav>
        <ul>
            <li>
                <p><a href="Home.jsp"><img src="Imgs/Logo.png" alt=""></a></p>
            </li>
            <li class="down_line">
                <p><a href=""><i class="fa-regular fa-bell"></i></a></p>
                <p><a href=""><i class="fa-regular fa-message"></i></a></p>
                <p><a href=""><i class="fa-solid fa-circle-user"></i> Fastlearn</a></p>
            </li>
        </ul>
    </nav>

    <div class="checked" onclick="Mychecked()">
        <p><i class="fa-solid fa-bars"></i></p>
        <div class="search-container">
            <i class="fas fa-magnifying-glass search-icon"></i>
            <input type="text" class="search-input" placeholder="Search...">
        </div>
    </div>
    <div id="checked" class="line_nav">
        <ul>
            <li class="down_line">
                <p><a href=""><i class="fa-regular fa-bell"></i></a></p>
            </li>
            <li class="down_line">
                <p><a href=""><i class="fa-regular fa-message"></i></a></p>
            </li>
            <li class="down_line">
                <p><a href=""><i class="fa-solid fa-circle-user"></i> Fastlearn</a></p>
            </li>
        </ul>
    </div>
</header>

<main>
    <div class="nav_left">
        <p class="avata"><a href=""><i class="fa-regular fa-circle-user"></i></a></p>
        <h3>Fastlearn</h3>
        <p><a href="Main_admin.jsp">Dashboard</a></p>
        <p style="background-color: #e5b589;"><a href="Users_Management.jsp">Users Management</a></p>
        <p><a href="Categorys_Management.jsp">Categorys Management</a></p>
        <p><a href="Courses_Management.jsp">Courses Management</a></p>
        <p><a href="Orders_Management.jsp">Orders Management</a></p>
        <p><a href="Carts_Management.jsp">Carts Management</a></p>
    </div>

    <div id="student-list" class="student-list">        
        <table>
            <tr>
                <td><h2>List</h2></td>
                <td colspan="2">
                    <div class="search-container">
                        <i id="icon_search" class="fas fa-magnifying-glass search-icon"></i>
                        <input type="text" id="keyword" class="search-input" placeholder="Search..." autocomplete="off">
                    </div>
                </td>
                <td class="export"><a href="Users_Management.jsp">Cancel</a> <span class="add_account"><a href="Add_account.jsp">+ Add Account</a></span></td>
            </tr>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Password</th>
                <th>Operation</th>
            </tr>
            <tbody>
                <%
                    String name = request.getParameter("search-input");
                    String st = "";
                    Connection conn = null;
                    PreparedStatement pstmt = null; // Sử dụng PreparedStatement để ngăn chặn SQL Injection
                    ResultSet rs = null;
                    

                    try {
                        DBconnect db = new DBconnect();
                        conn = db.KetNoi();
                        String sql = "SELECT * FROM users WHERE email LIKE ?";
                        pstmt = conn.prepareStatement(sql);
                        
                        if (name != null && !name.isEmpty()) {
                            pstmt.setString(1, "%" + name + "%"); // Thêm ký tự % cho phép tìm kiếm
                        } else {
                            pstmt.setString(1, "%"); // Hiển thị tất cả nếu không có tìm kiếm
                        }

                        rs = pstmt.executeQuery();

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
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }

                    // In ra các dòng đã tạo
                    out.print(st);
                %>
            </tbody>
        </table>
    </div>
</main>

<script>
    function confirmDelete(id) {
        if (confirm('Bạn có chắc chắn muốn xóa mục này?')) {
            window.location.href = 'delete_users.jsp?id=' + id;
        }
    }
</script>

<script src="Users_Management.js"></script>
</body>
</html>