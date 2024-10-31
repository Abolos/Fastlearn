<%-- 
    Document   : Main_admin
    Created on : Oct 11, 2024, 8:20:24 PM
    Author     : 84396
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Pager Home Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Main_adminn.css">
</head>
<body>
<header>
        <nav>
            <ul>
                <li>
                    <p><a href="Home.jsp"><img src="Imgs/Logo.png" alt=""></a></p>
                </li>
                <li class="down_line">
                    <p><i class="fa-regular fa-bell"></i></p>
                </li>
                <li class="down_line">
                    <p><i class="fa-regular fa-message"></i></p>
                </li>
                <li class="down_line">
                    <div class="search-container">
                        <i id="icon_search" class="fas fa-magnifying-glass search-icon"></i>
                        <input type="text" id="keyword" class="search-input" placeholder="Search..." autocomplete="off">
                        <div id="results"></div>
                    </div>
                </li>
                <li class="down_line">
                    <p><i class="fa-solid fa-circle-user"></i> Fastlearn</p>
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
            <p style="background-color: #e5b589;"><a href="">Dashboard</a></p>
            <p><a href="Users_Management.jsp">Users Management</a></p>
            <p><a href="Categorys_Management.jsp">Categorys Management</a></p>
            <p><a href="Courses_Management.jsp">Courses Management</a></p>
            <p><a href="Orders_Management.jsp">Orders Management</a></p>
            <p><a href="Carts_Management.jsp">Carts Management</a></p>
        </div>

        <div class="main_show">
           <div class="Data">
               <div class="data_item">
                   <p><i class="fa-brands fa-facebook"></i> <a href="report_month.jsp">Report month</a></p>
               </div>

               <div class="data_item">
                   <p><i class="fa-brands fa-square-instagram"></i> <a href="report_year.jsp">Report year</a></p>
               </div>

               <div class="data_item">
                   <p><i class="fa-solid fa-phone"></i> <a href="report_quater.jsp">Report quater</a></p>
               </div>

               <div class="data_item">
                   <p><i class="fa-brands fa-square-twitter"></i> <a href="report_week.jsp">Report week</a></p>
               </div>
               
               <a href="report_inventory.jsp"><h3>Inventory Report</h3></a>
               
           </div>

           <div class="container">
              <div class="circle">
                <canvas id="percentageCircle"></canvas>
                <span>76%</span>
              </div>
              <div class="chart-container">
                <canvas id="myChart"></canvas>
              </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        </div>
    </main>
</body>
<script src="Main_admin.js"></script>
</html>
