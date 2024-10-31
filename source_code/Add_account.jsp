<%-- 
    Document   : Add_account
    Created on : Oct 12, 2024, 8:57:13 AM
    Author     : 84396
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Add account</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Add_account.css">    
</head>
<body>

<div class="container">
    <h2>Add Account</h2>
    <form action="add_account" method="post">
        <table>
            <tr>
                <td>
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="email">Username</label>
                    <input type="email" name="email" id="email" required>
                </td>
            </tr>
            <tr>
                <td class="submit"">
                    <button type="submit">+ Add Account</button>
                    <button><a href="Users_Management.jsp">Cancel</a></button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>