<%-- 
    Document   : Orders_Management
    Created on : Oct 12, 2024, 12:55:52 AM
    Author     : 84396
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import =" Thao_Tac_CSDL.orders_management"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Orders Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Orders_Management.css">
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
                    <p><a href=""><i class="fa-solid fa-circle-user"></i> Jessie</a></p>
                </li>
            </ul>
        </div>
    </header>


    <main>
    <div class="nav_left">
            <p class="avata"><a href=""><i class="fa-regular fa-circle-user"></i></a></p>
            <h3>Fastlearn</h3>
            <p><a href="Main_admin.jsp">Dashboard</a></p>
            <p><a href="Users_Management.jsp">Users Management</a></p>
            <p><a href="Categorys_Management.jsp">Categorys Management</a></p>
            <p><a href="Courses_Management.jsp">Courses Management</a></p>
            <p style="background-color: #e5b589;"><a href="Orders_Management.jsp">Orders Management</a></p>
            <p><a href="Carts_Management.jsp">Carts Management</a></p>
        </div>

        <div id="student-list" class="student-list">        
        <table>
            <tr>
                <td><h2>List</h2></td>
                <form method="post" action="search_order.jsp">
                    <td colspan="2">
                        <div class="search-container">
                            <i id="icon_search" class="fas fa-magnifying-glass search-icon"></i>
                            <input type="text" id="keyword" name="search-input" class="search-input" placeholder="Search...">
                        </div>
                    </td>
                    <td colspan="1" class="export">
                        <input style="padding: 7px 25px; background-color: #71AAE7; order: none; border-radius: 30px; font-weight: bold; font-size: 20px; color: white; border: none;" type="submit" value="Search" />
                    </td>
                </form>
                <td colspan="2" class="add_account"><a href="Add_order.jsp">+ Add Order</a></td>
            </tr>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Course</th>
                <th>Total price</th>
                <th>Status</th>
                <th>Operation</th>
            </tr>
            <tbody >
                <%
                     orders_management tb = new orders_management();
                     String st = tb.HienThi();
                 %>
                 <%=st%>
            </tbody>
        </table>
    </div>
    </div>
    </main>
</body>
<script src="Orders_Management.js"></script>
</html>
