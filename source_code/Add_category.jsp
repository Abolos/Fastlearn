<%-- 
    Document   : Add_category
    Created on : Oct 12, 2024, 9:56:25 AM
    Author     : 84396
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Add category</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Add_category.css">    
</head>
<body>

<div class="container">
    <h2>Add Category</h2>
    <form action="add_category" method="post">
        <table>
            <tr>
                <td>
                    <label for="name">Category name</label>
                    <input type="text" name="name" id="name" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="description">Description</label>
                    <input type="text" name="description" id="description" required>
                </td>
            </tr>
            <tr>
                <td class="submit"">
                    <button type="submit">+ Add category</button>
                    <button><a href="Categorys_Management.jsp">Cancel</a></button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>