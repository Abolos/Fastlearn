<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Đơn Hàng</title>
    <link rel="stylesheet" href="orderList.css">
</head>
<body>
    <div class="container">
        <h1>Order List</h1>
         <%  String email = request.getParameter("email"); %>
        
        <%
            List<List<String>> orders = (List<List<String>>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
        %>
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Tile</th>
                        <th>Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (List<String> order : orders) {
                    %>
                        <tr>
                            <td><img src="<%= order.get(0) %>" alt="<%= order.get(1) %>" class="order-image"></td>
                            <td><%= order.get(1) %></td>
                            <td><%= order.get(2) %></td>
                            <td><%= order.get(3) %></td>
                        </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="4"> <a href="viewCart?email=<%= email %>">To Cart</a></td>
                    </tr>
                </tbody>
            </table>
        <%
            } else {
        %>
            <p>Không có đơn hàng nào.</p>
        <%
            }
        %>
    </div>
</body>
</html>