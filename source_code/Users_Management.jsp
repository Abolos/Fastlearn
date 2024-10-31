<%-- 
    Document   : Users_Managemen
    Created on : Oct 11, 2024, 11:39:53 PM
    Author     : 84396
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import =" Thao_Tac_CSDL.users_management"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
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
            <form method="post" action="search_user.jsp">
                <td colspan="2">
                    <div class="search-container">
                        <i id="icon_search" class="fas fa-magnifying-glass search-icon"></i>
                        <input type="text" id="keyword" name="search-input" class="search-input" placeholder="Search...">
                    </div>
                </td>
                <td class="export">
                    <input style="padding: 7px 25px; background-color: #71AAE7; order: none; border-radius: 30px; font-weight: bold; font-size: 20px; color: white; border: none;" type="submit" value="Search" />
                    <span class="add_account"><a href="Add_account.jsp">+ Add Account</a></span>
                </td>
            </form>
            </tr>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Password</th>
                <th>Operation</th>
            </tr>
            <tbody>
                
                 <%
                     users_management tb = new users_management();
                     String st = tb.HienThi();
                 %>
                 <%=st%>
            </tbody>
        </table>
    </div>
    </div>
    </main>
</body>
<script src="Users_Management.js"></script>
</html>
