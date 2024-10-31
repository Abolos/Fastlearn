<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Thao_Tac_CSDL.viewCart.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Shopping Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Shopping_cartt.css">
</head>
<body>
     <%  String email = request.getParameter("email"); %>
     <%  int userID = Integer.parseInt(request.getParameter("userID")); %>
     <header>
        <nav>
          <ul> 
              <li>
                  <p><a href="Home_login.jsp?email=<%=email%>"><img src="Imgs/Logo.png" alt=""></a></p>
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
                  <p><i class="fa-solid fa-cart-shopping"></i></p>
                </li>
                <li>
                   <p><i class="fa-regular fa-bell"></i></p>
                </li>
                <li>
                   <p><i class="fa-regular fa-circle-user"></i></p>
                </li>
                <li>
                    <p><a href=""><h3><%=email%></h3></a></p>
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
                      <p><a href="">Alex</a></p>
                  </li>
            </ul>
          </div>
    </header>
   <main>             
    <table>
        <h1 style="text-align: center;">Your Shopping Cart</h1>
    <tr>
        <th class="titlecourse" colspan="2">Course</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <%
        List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
        if (cartItems != null && !cartItems.isEmpty()) {
            double totalprice = 0.0;
            for (CartItem item : cartItems) {
                totalprice += item.getPriceCourse().doubleValue();
    %>
    <tr>
        <td><img src="<%= item.getImageCourse() %>" alt="<%= item.getTitleCourse() %>"></td>
        <td><%= item.getTitleCourse() %></td>
        <td><%= item.getPriceCourse().setScale(2, BigDecimal.ROUND_HALF_UP) %> USD</td>
        <td><a href="removeFromCart?id=<%= item.getCartId() %>&email=<%= email %>"><i class="fa-solid fa-trash"></i></a></td>
    </tr>
    <%
            }
    %>
    <tr class="payment">
        <td style="text-align: center;" colspan="2">Your Cart Total</td>
        <td><%= new BigDecimal(totalprice).setScale(2, BigDecimal.ROUND_HALF_UP) %> USD</td>
        <td><a href="Orders.jsp?userID=<%= userID %>&email=<%= email %>">Payment</a></td>
    </tr>
    <%
        } else {
    %>
    <tr>
        <td colspan="4">Giỏ hàng của bạn trống.</td>
    </tr>
    <%
        }
    %>
   </table>
   </main>
   <p  class="toOrder"> <a href="orderList?userID=<%= userID %>&email=<%= email %>">To Orders</a></p>
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
<script src="Shopping_cart.js"></script>
</html>