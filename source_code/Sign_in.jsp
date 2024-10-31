<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Sign in</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="Sign_In.css">
</head>
<body>
    <form  class="sign_in" method="post" action="send_sign_in">
       <table>
        <tr>
            <td colspan="3"><h1>Login</h1></td>
        </tr>
        <tr>
            <td>Email:</td>
        </tr>
        <tr>
            <td colspan="3"><input autocomplete="username" class="email" type="email" name="email" required></td>
        </tr>
        <tr>
            <td colspan="3">Password:</td>
        </tr>
        <tr>
            <td colspan="3"><input autocomplete="current-password" type="password" name="password" required></td>
        </tr>
        <tr>
            <td colspan="3"><p><input  type="submit" name="submit" value="Sign in"></p></td>
        </tr>
        <tr class="form_check_item">
            <td><input type="checkbox" name="remember" autocomplete="on"> Remember Me</td>
            <td></td>
            <td class="forgot"><a href="">Forgot password</a></td>
        </tr>
       </table>
    </form>
    <% 
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <div style="color: red; margin-left: 10%">
            <p><%= error %></p>
        </div>
    <% 
        } 
    %>

    <div class="footer">
        <div class="icon_app">
            <ul>
                <li> <p><i class="fa-brands fa-instagram"></i></p></li>
                <li> <p><i class="fa-brands fa-instagram"></i></p></li>
                <li> <p><i class="fa-brands fa-facebook"></i></p></li>
                <li> <p><i class="fa-brands fa-whatsapp"></i></p></li>
            </ul>
            
        </div>
        
        <div class="icon_message"><i class="fa-solid fa-comments"></i></div>
        
    </div>
</body>
</html>