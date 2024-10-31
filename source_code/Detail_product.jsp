<%-- 
    Document   : Detail_product
    Created on : Oct 8, 2024, 1:08:04 PM
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
    <link rel="stylesheet" href="Detail_product1.css">
</head>
<body>
    <header>
        <nav>
            <ul> 
                <li>
                    <p><a href="Home_login.jsp?email=${email}"><img src="Imgs/Logo.png" alt=""></a></p>
                </li>
                <li>
                    <div class="search-container">
                        <i class="fas fa-magnifying-glass search-icon"></i>
                        <input type="text" class="search-input" placeholder="Search...">
                    </div>
                </li>
                <li>
                    <p><a href=""><h3>Study</h3></a></p>
                </li>
                 <li>
                    <p><i class="fa-regular fa-heart"></i></p>
                 </li>
                 <li>
                    <a href="viewCart?email=${email}"><p><i class="fa-solid fa-cart-shopping"></i></p></a>
                  </li>
                  <li>
                     <p><i class="fa-regular fa-bell"></i></p>
                  </li>
                  <li>
                     <p><i class="fa-regular fa-circle-user"></i></p>
                  </li>
                  <li>
                      <p><a href=""><h3>${email}</h3></a></p>
                  </li>
            </ul>
          </nav>
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
                      <p><a href="">Study</a></p>
                  </li>
                   <li>
                      <p><a href=""><i class="fa-regular fa-heart"></i></a></p>
                   </li>
                   <li>
                      <p><a href=""><i class="fa-solid fa-cart-shopping"></i></a></p>
                    </li>
                    <li>
                       <p><a href=""><i class="fa-regular fa-bell"></i></a></p>
                    </li>
                    <li>
                       <p><a href=""><i class="fa-regular fa-circle-user"></i></a></p>
                    </li>
                    <li>
                        <p><a href="">${email}</a></p>
                    </li>
              </ul>
            </div> 
    </header>   
    
    <main>
        <div class="advertise">
            <h3>${title}</h3>
            <h4>${content}<br>
                <p> <i class="fa-solid fa-check"></i> Read More</p>
            </h4>
            <p class="star">5.0 <span><i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i></span></p>
            <p class="Channel">Created by <span>NSS Channel</span></p>       
            <div class="update">
                <p><span><i class="fa-solid fa-lightbulb"></i></span> Last updated 9/2024</p>
                <p><span><i class="fa-solid fa-globe"></i></span> Last updated 9/2024</p>
            </div>    
        </div>

        <div class="Img_Produc_tprice">
            <img src="${image}" alt="">
            <h2>${price}$</h2>
            <div class="leave_cart">
                <button><a href="addToCart?email= ${email}&id_course=${id_course}">Add to cart</a></button>
                <p> <i class="fa-regular fa-heart"></i></p>
            </div>
            <div class="buy_now"><div><p><a href="addToCart?email= ${email}&id_course=${id_course}">Buy Now</a></p></div></div>
            <p class="Guarantee">30 Day Money Back Guarantee</p>
            <ul>
                <li>
                    <h4>This course includes :</h4>
                </li>
                <table>
                    <tr>
                        <td><i class="fa-solid fa-mobile"></i</td>
                        <td>Access on mobile and TV</td>
                    </tr>
                    <tr>
                        <td><i class="fa-solid fa-link"></i></td>
                        <td>Full lifetime access</td>
                    </tr>
                    <tr>
                        <td><i class="fa-solid fa-trophy"></i></td>
                        <td>Certificate of Completion</td>
                    </tr>
                </table>
            </ul>
        </div>

         
         <!-- nss_chanel -->
          <h1 class="main_content">Main content of the course</h1>
         <div class="nss_chanel">
          ${detail_course}
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
<script src="Detail_product.js"></script>
</html>