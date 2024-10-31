<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import= "Thao_Tac_CSDL.DBconnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Pager Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Home_1.css">
</head>
<body>
    <header>
          <nav>
            <ul> 
                <li>
                    <p><img src="Imgs/Logo.png" alt=""></p>
                </li>
                <li>
                    <div class="search-container">
                        <i class="fas fa-magnifying-glass search-icon"></i>
                        <input type="text" class="search-input" placeholder="Search...">
                    </div>
                </li>
                <li>
                    <p><a href=""><h3>Fast Learn Business</h3></a></p>
                </li>
                <li>
                    <p><i class="fa-solid fa-cart-shopping"></i></p>
                </li>
                <li>
                    <p><button class="sign-in"><a href="Sign_in.jsp">Sign in</a></button></p>
                </li>
                <li>
                    <p><button class="sign-up"><a href="Sign_up.jsp">Sign up</a></button></p>
                </li>
                <li>
                    <p><i class="fa-solid fa-globe"></i></p>
                </li>
            </ul>
          </nav>

          <div class="header_content">
            <div class="header_content_left">
                <h1>Learning<br>From Home</h1>
                <button>READ MORE</button>
            </div>

            <div class="header_content_right">
                <div class="line_top"></div>
                <img src="Imgs/home_img_1.png" alt="">
            </div>
          </div>
          <div  class="checked" onclick="Mychecked()">
            <p><i class="fa-solid fa-bars"></i></p>
            <div class="search-container">
              <i class="fas fa-magnifying-glass search-icon"></i>
              <input type="text" class="search-input" placeholder="Search...">
            </div>
          </div>
          <div id="checked" class="line_nav">
            <ul>
              <li>
                <p><a href="Home.jsp">Fast Learn Business</a></p>
              </li>
              <li>
                <p><a href="Sign_in.jsp">Sign in</a></p>
              </li>
              <li>
                <p><a href="Sign_up.jsp">Sign up</a></p>
              </li>
            </ul>
          </div>
    </header>
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
                        <a href="Home.jsp?categoryId=<%= categoryId %>"><%= categoryName %></a>
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

<!-- Danh m?c s?n ph?m -->
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
                        <img src="<%= image %>" alt="<%= title %>">
                        <h3 id="title"><%= title %></h3>
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
<!-- Trung bay -->
       <div class="Danh_Muc" id="danh_muc">
        <h2>Top Genres</h2>
        <div class="Danh_Muc_item">
          <div class="item">
            <img src="Imgs/home_img_6.png" alt="">
            <h3>Design</h3>
          </div>

          <div class="item">
            <img src="Imgs/home_img_7.png" alt="">
            <h3>Web Development</h3>
          </div>

          <div class="item">
            <img src="Imgs/home_img_8.png" alt="">
            <h3>Business</h3>
          </div>

          <div class="item">
            <img src="Imgs/home_img_9.png" alt="">
            <h3>Cyber security</h3>
          </div>
          
        </div>
       </div>


<!-- Phan business -->

       <div class="fastlearn_business">
         <div class="busisess_item">
            <h3><span class="fast">FAST </span> <span class="learn">LEARN</span> Business</3>
            <h4>Upskill your staff with FAST LEARN Business</h4>
            <ul>
              <li>
                <p>Ulimited access to over 27,000 top FAST LEARN course, anywhere, anytime</p>
              </li>
              <li>
                <p>International course collection in 14 languages</p>
              </li>
              <li>
                <p>Top certifications in technology and business</p>
              </li>
            </ul>
            <div class="business_button">
              <button><a href="">Join FAST LEARN Business</a></button>
              <button><a href="">Learn More</a></button>
            </div>
         </div>

         <div class="business_img">
          <img src="Imgs/home_img_10.png" alt="">
         </div>
       </div>
<!-- Phan Nhung cau chuyen -->
       
       <div class="story">
        <div class="story_main">
          <div class="story_content">
            <p>Helping FAST LEARN Business, Booz Allen has equippedour workforce, especially data scientists, with relevant<br>
              and in-demand technology skills, enabling consultants<br>
              stay ahead of the big data trend and raise standards of<br>
              qualifications, skills and capabilities to meet customer<br>
              needs</p>
  
          </div>
  
          <div class="story_avata">
            <p><img src="Imgs/home_img_11.png" alt=""></p>
            <h3>Jim Hemgen</h3>
            <p>Principal</p>
            <p class="boox">Booz Allen Hamilton</p>
          </div>
        </div>

        <div class="show_read">
          <h3>Read the full story</h3>
          <div></div>
        </div>
       </div>


<!-- Phan tro thanh huong dan vien  -->
       <div class="tour_guide">
         <div class="tour_guide_img">
          <img src="Imgs/home_img_12.png" alt="">
         </div>

         <div class="tour_guide_content">
          <h1>Become a lecturer</h1>
          <p>Instructors from around the worls teach <br>millions of students on FAST LEARN.<br>
            We give you the tools and skills to teach<br>what you love.<br></p>
          <button><a href="">Start teaching today</a></button>
         </div>
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
<script src="Home.js"></script>
</html>