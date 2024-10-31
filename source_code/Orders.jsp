<%-- 
    Document   : Orders
    Created on : Oct 16, 2024, 10:53:02 PM
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
    <link rel="stylesheet" href="Orders.css">
</head>
<body>
     <%  String email = request.getParameter("email"); %>
     <%  int userID = Integer.parseInt(request.getParameter("userID")); %>
     <main>
        <h1>PAYMENT</h1>
        <p><img src="Imgs/MaQR.jpg" alt="MaQR"></p>
        <h3>For more information please contact<br>hotline: <span>0396-865-585</span></h3>
        <a href="add_orders?userID=<%= userID %>&email=<%= email %>"><button>Confirmation of Payment</button></a>
        <a href="viewCart?email=<%= email %>"><button>Cancel</button></a>
     </main>
</body>
</html>
