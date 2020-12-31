<%-- 
    Document   : cart
    Created on : Nov 20, 2020, 8:55:12 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*" %>
<%@page import="Model.*" %>
<%@page import="Service.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.security.Provider" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - TEAM16 Store</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/cart.js" type="text/javascript"></script>
</head>
<body>
    <div class="container">
        <div class="navbar">
                <div class="gogo">
                    <img src="images/logo-default.jpg" width="125px" alt="">
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="products.jsp">Products</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Blog</a></li>
                        <li><a href="">Account</a></li>
                        <li><a href="" class="btn-login">Log In</a></li>
                        <li><a href="" class="btn-register">Register</a></li>
                    </ul>
                </nav>
                <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" class="imgcard"></a>
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
        </div>
    </div>
    <script>
        updateCart();
    </script>
    <!------- cart item ------>
    <div class="small-container cart-page">
        <%
            if(session.getAttribute("cart")==null) {
        %>
            <h4>Không có sản phẩm nào trong giỏ hàng!!!</h4>
        <% } %>
        <%
        if (session.getAttribute("cart")!=null){
        %>
        <table class='tbl-cart-item'>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>SubTotal</th>
            </tr>
            <% 
                
                Cart cart = (Cart)session.getAttribute("cart");
                List<CartItem> listItems = cart.getItems();     
                for (int i=0;i<listItems.size();i++)
                    { 
System.out.println(listItems.get(i).toString());%>
                    <tr>
                        <td>
                            <div class="cart-info">
                                <img src="<%= listItems.get(i).getPictureString()%>" alt="">
                                <div>
                                    <p><%= listItems.get(i).getProductName()%></p>
                                    <small>Price: <%= listItems.get(i).getPrice()%></small>
                                    <a href="">Remove</a>
                                </div>
                            </div>
                        </td>
                        <td><input type="number" value="<%= listItems.get(i).getQuantity() %>"></td>
                        <td><%= CartService.getCost(listItems.get(i))  %></td>
                    </tr>
            <%}%>

        </table>
        <div class="total-price">
            <table>
                <tr>
                    <td>Subtotal</td>
                    <td><%= CartService.getTotalCost(listItems)%></td>
                </tr>
                <tr>
                    <td>Tax</td>
                    <td>50.000</td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td><%= CartService.getTotalCost(listItems)%></td>
                </tr>
            </table>
        </div>
        <form class="row">
            <a href="checkout.jsp" class="btn btn-tt">Thanh toán</a>
        </form>
        <% } %>
    </div>

    <!--------- footer  --------->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Dowload Our App</h3>
                    <p>Download App for Android and ios mobie phone</p>
                    <div class="app-logo">
                        <img src="images/playstore.png" alt="">
                        <img src="images/appstore.png" alt="">
                    </div>
                </div>
                <div class="footer-col-2">
                    <img src="images/logo4.png" alt="">
                    <p>Our Purpose Is To Sustainably Make the Pleasure and
                        Benefits of Sports Accessible to the Many
                    </p>

                </div>
                <div class="footer-col-3">
                    <h3>Userful Links</h3>
                    <ul>
                        <li>Khoa Phan</li>
                        <li>Minh Mâm</li>
                        <li>Đông Thân</li>
                        <li>Nhật Minh</li>
                    </ul>
                </div>
                <div class="footer-col-3">
                    <h3>Follow us</h3>
                    <ul>
                        <li>Coupns</li>
                        <li>Blog Post</li>
                        <li>Instagram</li>
                        <li>Youtube</li>
                    </ul>
                </div>
            </div>
            <hr>
            <p class="copyright">Copyright 2020 - DongThan</p>
        </div>
    </div>
    <!---- Toggle Menu ------>
    <script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight="0px";
        function menutoggle(){
            if(MenuItems.style.maxHeight=="0px")
            {
                MenuItems.style.maxHeight="250px";
                MenuItems.style.zIndex = "800"
                
            }
            else
            {
                MenuItems.style.maxHeight="0px"
            }
        }
    </script>
</body>
</html>
