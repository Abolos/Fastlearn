<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Sign Up</title>
    <link rel="stylesheet" href="Sign_up.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">

</head>
<body>
   <main>
    <form class="form_logon" method="post" action="SendOTPServlet">
       <div class="main_form">
        <h1>Create An Account</h1>
        <table>
            <tr>
                <td>Email</td>
            </tr>
            <tr>
                <td colspan="3"><input class="email" type="email" name="email" required></td>
            </tr>
            <tr>
                <td style="width: 45%;">Password:</td>
                <td style="width: 10%;"></td>
                <td style="width: 45%;">Enter password again:</td>
            </tr>
            <tr>
                <td><input type="password" name="password" required></td>
                <td></td>
                <td><input type="password" name="confirm_password" required></td>
            </tr>
            <tr>
                <td>Date of birth:</td>
                <td></td>
                <td>Gender:</td>
            </tr>
            <tr>
                <td><input type="date" name="date_of_birth" required></td>
                <td></td>
                <td class="click" style="display:flex; justify-content: space-around;"><input type="radio" name="gender" value="male" required> Boy  <input type="radio" name="gender" value="female" required> Girl  </td>
            </tr>
            <tr>
                <td class="click text_red" colspan="3"><input type="checkbox" name="agree"  required> i?ve read and agree to the <span> terms of service</span></td>
            </tr>
            <tr>
                <td colspan="3"><p><input type="submit" name="submit" value="Sign up"></p></td>
            </tr>
            <tr>
                <td class="text_red note" colspan="3">Already have account? <Span><a href="Sign_in.jsp">Sign in</a></Span></td>
            </tr>
        </table>
       </div>
      
       <div class="form_img">
        <img src="Imgs/image1.png" alt="">
        <p>Ready to learn fast ?</p>
       </div>
    </form>
    
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
   </main>
</body>

</html>