<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import= "Thao_Tac_CSDL.DBconnect" %>
<%  String email = request.getParameter("email"); %>
<%
    if ( email == null) {
        response.sendRedirect("Sign_in.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Pager Home Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Home_login.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li>
                    <p><a href="Home.jsp"><img src="Imgs/Logo.png" alt=""></a></p>
                </li>
                  <li class="down_line">
                    <div class="search-container">
                        <i id="icon_search" class="fas fa-magnifying-glass search-icon"></i>
                        <input type="text" id="keyword" class="search-input" placeholder="Search..." autocomplete="off" onkeyup="searchCourses()">
                        <div id="results" class="results-container" style="display:none;"></div>
                    </div>
                  </li>
                <li class="down_line">
                    <p><a href=""><h3>Study</h3></a></p>
                </li>
                <li class="down_line">
                    <p><i class="fa-regular fa-heart"></i></p>
                </li>
                <li class="down_line">
                    <a href="viewCart?email=<%= email %>"><p><i class="fa-solid fa-cart-shopping"></i></p></a>
                </li>
                <li class="down_line">
                    <p><i class="fa-regular fa-bell"></i></p>
                </li>
                <li class="down_line">
                    <p><i class="fa-regular fa-circle-user"></i></p>
                </li>
                <li class="down_line">
                    <p><a href="user_profile?email=<%= email %>">
                        <h3>
                            <% 
                                if (email != null) {
                            %>
                                <%= email %>
                            <% 
                                } else { 
                            %>
                                Guest
                            <% 
                                } 
                            %>
                        </h3>
                    </a></p>
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
                <li><p><a href="">Study</a></p></li>
                <li><p><a href=""><i class="fa-regular fa-heart"></i></a></p></li>
                <li><p><a href="viewCart?email="+email"><i class="fa-solid fa-cart-shopping"></i></a></p></li>
                <li><p><a href=""><i class="fa-regular fa-bell"></i></a></p></li>
                <li><p><a href=""><i class="fa-regular fa-circle-user"></i></a></p></li>
                <li>
                    <p><a href="Public_profile.html"></a></p>
                </li>
            </ul>
        </div>
        <div class="header_content">
            <div class="header_content_left">
                <p><i class="fa-regular fa-circle-user"></i> Welcome back!</p>
                <h1>ONLINE</h1>
                <h2>learning</h2>
                <button>READ MORE</button>
            </div>
            <div class="header_content_right">
                <img src="Imgs/Home_login_1.png" alt="">
            </div>
        </div>
    </header>
                        
<!-- Main content -->                  
    <main>
        <nav>
            <ul>
         <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Kết nối đến cơ sở dữ liệu
                DBconnect db = new DBconnect();
                conn = db.KetNoi();

                // Lấy danh sách categories
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM categories");

                while (rs.next()) {
                    int categoryId = rs.getInt("id");
                    String categoryName = rs.getString("name");
        %>
                    <div class="category">
                        <a href="Home_login.jsp?categoryId=<%= categoryId %>&email=<%= email %>"><%= categoryName %></a>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
            </ul>
        </nav>        
      
         <!-- Danh muc sang pham -->
         <div class="product"  >
         <%
            String categoryId = request.getParameter("categoryId");
            try {
                DBconnect db = new DBconnect();
                conn = db.KetNoi();
                stmt = conn.createStatement();

                String sql;
                if (categoryId != null) {
                    sql = "SELECT * FROM courses WHERE category_id = " + categoryId;
                } else {
                    sql = "SELECT * FROM courses"; // Hiển thị tất cả khóa học nếu không có danh mục nào được chọn
                }
                
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
        %>
                    <div class="course product_item">
                        <a href="detail_product?email=<%= email %>&title=<%=title%>"><img src="<%= image %>" alt="<%= title %>"></a>
                        <h3 class="title_main"><%= title %></h3>
                        <h3 ><%= content %></h3>
                        <h2>Price: $<%= price %></h2>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
     </div>
     
     
      <!-- bar line down top display products  -->

        <div class="advertisement">
            <ul>
                <li>
                    <p class="icon"><i class="fa-regular fa-circle-play"></i></p>
                    <p>
                        Learn in-demand 
                        skills with<br>
                        over 250.000 video course 
                    </p>
                </li>
                <li>
                    <p class="icon"><i class="fa-solid fa-star"></i></p>
                    <p>
                        Choose courses taught by<br>
                        real-world experts
                    </p>
                </li>
                <li>
                    <p class="icon"><i class="fa-solid fa-link"></i></p>
                    <p>
                        Learn at your own pace, with lifetime<br>
                        access on mobile and desktop
                    </p>
                </li>
            </ul>
        </div>
      
      <!-- Hien thi san pham theo danh muc -->
      
      <h2 class="category_course">Programming</h2>
      <div class="product category_course_item"  >
         <%
            try {
                DBconnect db = new DBconnect();
                conn = db.KetNoi();
                stmt = conn.createStatement();

                String sql = "SELECT * FROM courses WHERE category_id = 1"; 
             
                
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
        %>
                    <div class="course product_item">
                        <a href="detail_product?email=<%= email %>&title=<%=title%>"><img src="<%= image %>" alt="<%= title %>"></a>
                        <h3 class="title_main"><%= title %></h3>
                        <h3 ><%= content %></3>
                        <h2>Price: $<%= price %></h2>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
     </div>
     
     <h2 class="category_course">Graphic Design</h2>
      <div class="product category_course_item"  >
         <%
            try {
                DBconnect db = new DBconnect();
                conn = db.KetNoi();
                stmt = conn.createStatement();

                String sql = "SELECT * FROM courses WHERE category_id = 2"; 
             
                
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
        %>
                    <div class="course product_item">
                        <a href="detail_product?email=<%= email %>&title=<%=title%>"><img src="<%= image %>" alt="<%= title %>"></a>
                        <h3 class="title_main"><%= title %></h3>
                        <h3 ><%= content %></3>
                        <h2>Price: $<%= price %></h2>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
     </div>
     
     
     <h2 class="category_course">Marketing</h2>
      <div class="product category_course_item"  >
         <%
            try {
                DBconnect db = new DBconnect();
                conn = db.KetNoi();
                stmt = conn.createStatement();

                String sql = "SELECT * FROM courses WHERE category_id = 3"; 
             
                
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
        %>
                    <div class="course product_item">
                        <a href="detail_product?email=<%= email %>&title=<%=title%>"><img src="<%= image %>" alt="<%= title %>"></a>
                        <h3 class="title_main"><%= title %></h3>
                        <h3 ><%= content %></3>
                        <h2>Price: $<%= price %></h2>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
     </div>
     
     <h2 class="category_course">Business</h2>
      <div class="product category_course_item"  >
         <%
            try {
                DBconnect db = new DBconnect();
                conn = db.KetNoi();
                stmt = conn.createStatement();

                String sql = "SELECT * FROM courses WHERE category_id = 4"; 
             
                
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
        %>
                    <div class="course product_item">
                        <a href="detail_product?email=<%= email %>&title=<%=title%>"><img src="<%= image %>" alt="<%= title %>"></a>
                        <h3 class="title_main"><%= title %></h3>
                        <h3 ><%= content %></3>
                        <h2>Price: $<%= price %></h2>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
     </div>
     
     <h2 class="category_course">Languages</h2>
      <div class="product category_course_item"  >
         <%
            try {
                DBconnect db = new DBconnect();
                conn = db.KetNoi();
                stmt = conn.createStatement();

                String sql = "SELECT * FROM courses WHERE category_id = 5"; 
             
                
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
        %>
                    <div class="course product_item">
                        <a href="detail_product?email=<%= email %>&title=<%=title%>"><img src="<%= image %>" alt="<%= title %>"></a>
                        <h3 class="title_main"><%= title %></h3>
                        <h3 ><%= content %></3>
                        <h2>Price: $<%= price %></h2>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
     </div>
     
     
     
     
      
    </main>
     
    <footer>
        <div class="menu">
          <ul>
            <li>
              <p>Fast Learn course</p>
            </li>
            <li>
              <p>Teach fast</p>
            </li>
            <li>
              <p>Get our app</p>
            </li>
            <li>
              <p>About us</p>
            </li>
            <li>
              <p>Contact us</p>
            </li>
          </ul> 
          
          <ul>
            <li>
              <p>Careers</p>
            </li>
            <li>
              <p>Blog</p>
            </li>
            <li>
              <p>Help and Support</p>
            </li>
            <li>
              <p>Affiliate</p>
            </li>
            <li>
              <p>Investor</p>
            </li>
          </ul>  
          
          <ul>
            <li>
              <p>Terms</p>
            </li>
            <li>
              <p>Privacy policy</p>
            </li>
            <li>
              <p>Cookie settings</p>
            </li>
            <li>
              <p>Sitemap</p>
            </li>
            <li>
              <p>Accessbility statement</p>
            </li>
          </ul>   
          
          <div class="english"><button>Vietnamese</button></div>
        </div>
        <div><img src="Imgs/logo_footer_home.png" alt=""></div>
    </footer>
</body>
<script src="Home_loginn.js"></script>

<script>
let timeout;

function searchCourses() {
    clearTimeout(timeout); // Xóa timeout trước đó

    timeout = setTimeout(() => {
        const keyword = document.getElementById("keyword").value.trim();
        const resultsContainer = document.getElementById("results");

        if (keyword === "") {
            resultsContainer.innerHTML = ""; // Xóa kết quả
            resultsContainer.style.display = "none"; // Ẩn kết quả
            return;
        }

        const xhr = new XMLHttpRequest();
        const randomParam = Math.random(); // Tham số ngẫu nhiên để ngăn bộ đệm
        xhr.open("POST", "search?email=<%= email%>", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    resultsContainer.innerHTML = xhr.responseText;
                    resultsContainer.style.display = 'block'; // Hiện kết quả
                } else {
                    console.error("Error fetching results:", xhr.status, xhr.statusText);
                    resultsContainer.innerHTML = "<div>Error fetching results. Please try again.</div>";
                    resultsContainer.style.display = 'block'; // Hiện thông báo lỗi
                }
            }
        };

        xhr.send("keyword=" + encodeURIComponent(keyword) + "&rand=" + randomParam); // Gửi từ khóa và tham số ngẫu nhiên
    }, 300); // Thay đổi độ trễ nếu cần
}
</script>
</html>