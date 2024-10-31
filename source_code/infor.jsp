<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Information</title>
    <link rel="stylesheet" href="infor.css">
</head>
<body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <header>
       <div class="background">
           <img src="Imgs/infor.jpg" alt="">
           <div class="nav">
               <div class="line"></div>
               <p><a class="home" href="Home.jsp">Home</a></p>
               <p><a class="sign_in" href="Sign_in.jsp">Sign in</a></p>
           </div>

           <form action="send_infor_user" method="post">
               <table>
                   <tr>
                       <td><h1>Authentication Information</h1></td>
                   </tr>
                   <tr>
                       <td class="title">Personal Information</td>
                   </tr>
                   <tr>
                       <td><label for="username">Username</label></td>
                   </tr>
                   <tr>
                       <td><input type="text" name="username" required></td>
                   </tr>
                   <tr>
                       <td><label for="phonenumber">Phone Number</label></td>
                   </tr>
                   <tr>
                       <td><input type="text" name="phonenumber" required></td>
                   </tr>
                   <tr>
                       <td><label for="address">Residential Address</label></td>
                   </tr>
                   <tr>
                       <td><input type="text" name="address"></td>
                   </tr>
                   <tr>
                       <td><label for="bio">Bio</label></td>
                   </tr>
                   <tr>
                       <td><textarea name="bio"></textarea></td>
                   </tr>

                   <!-- Hiển thị thông báo lỗi nếu có -->
                   <% 
                       request.setCharacterEncoding("UTF-8");
                       String errorMessage = request.getParameter("error");
                       if (errorMessage != null) {
                           out.println("<div class='error'>" + errorMessage + "</div>");
                       }
                   %>

                   <!-- Hiển thị thông tin người dùng -->
                   <%
                       String email = (String) request.getSession().getAttribute("email");
                       String dateOfBirth = (String) request.getSession().getAttribute("dateOfBirth");
                       String gender = (String) request.getSession().getAttribute("gender");
                       String password = (String) request.getSession().getAttribute("password");
                   %>
                   <tr style="display: none;">
                       <td><label for="email">Email:</label></td>
                       <td><input type="text" name="email" value="<%= email != null ? email : "" %>" readonly></td>
                   </tr>
                   <tr style="display: none;">
                       <td><label for="dob">Date of Birth:</label></td>
                       <td><input type="text" name="dateOfBirth" value="<%= dateOfBirth != null ? dateOfBirth : "" %>" readonly></td>
                   </tr>
                   <tr style="display: none;">
                       <td><label for="gender">Gender:</label></td>
                       <td><input type="text" name="gender" value="<%= gender != null ? gender : "" %>" readonly></td>
                   </tr>
                   <tr style="display: none;">
                       <td><label for="password">Password:</label></td>
                       <td><input type="password" name="password" value="<%= password != null ? password : "" %>" readonly></td>
                   </tr>

                   <tr>
                       <td class="submit"><input type="submit" value="NEXT"></td>
                   </tr>
               </table>
           </form>

           <div class="icon_app">
               <ul>
                   <li><p><i class="fa-brands fa-instagram"></i></p></li>
                   <li><p><i class="fa-brands fa-twitter"></i></p></li>
                   <li><p><i class="fa-brands fa-facebook"></i></p></li>
                   <li><p><i class="fa-brands fa-whatsapp"></i></p></li>
               </ul>
           </div>
       </div>
    </header>
</body>
</html>
