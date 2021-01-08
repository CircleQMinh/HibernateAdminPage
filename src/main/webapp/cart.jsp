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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div id="page">
        <div class="container">
            <div class="navbar">
                    <div class="gogo">
                        <img src="images/logo-default.jpg" width="125px" alt="">
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="products.jsp">Products</a></li>
                            <li><a href="aboutus.jsp">About</a></li>
                            <li><a href="myblog.jsp">Blog</a></li>
                            <li><a href="customer-account.jsp">Account</a></li>
                            <c:choose>
                                <c:when test="${sessionScope.account==null}" >
                                    <li><a href="login" class="btn-login">Log In</a></li>
                                    <li><a href="register" class="btn-register">Register</a></li>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${sessionScope.account.type=='customer'}">
                                            <li><a href="" class="btn-login"><c:out value="${sessionScope.userInfo.customerName}"/></a></li>
                                            <li><a href="logout" class="btn-register">Logout</a></li>
                                        </c:when>
                                        <c:when test="${sessionScope.account.type=='employee'}">
                                            <li><a href="" class="btn-login"><c:out value="${sessionScope.userInfo.employeeName}"/></a></li>                                   
                                            <li><a href="logout" class="btn-register">Logout</a></li>
                                        </c:when>  
                                        <c:otherwise>
                                             <li><a href="" class="btn-login"><c:out value="${sessionScope.userInfo.name}"/></a></li>
                                              <li><a href="logout" class="btn-register">Logout</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
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
                Cart cart=(Cart)session.getAttribute("cart");
            %>
            <table class='tbl-cart-item'>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>SubTotal</th>
                </tr>
                <% 
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
                                        <a href="RemoveCartItem?prd_id=<%= listItems.get(i).getProductID() %>">Remove</a>
                                    </div>
                                </div>
                            </td>
                            <td><input class="cart-quantity" type="number" value="<%= listItems.get(i).getQuantity() %>"></td>
                            <td><%= CartService.getCost(listItems.get(i))  %></td>
                        </tr>
                <%} %>

            </table>
            <div class="total-price">
                <table>
                    <tr>
                        <td>Subtotal</td>
                        <td><%= CartService.getTotalCost(listItems)%></td>
                    </tr>
                    <tr>
                        <td>Tax</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td><%= CartService.getTotalCost(listItems)%></td>
                    </tr>
                </table>
            </div>
            <div class="row">
                <button id="btn-tt" class="btn btn-tt">Thanh toán</button>
            </div>
            <%  }%>
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
    </div>
    <div class="choose-payment-method" id="choose-payment-method" style="display: none;">
        <h3>Chọn phương thức thanh toán      <button id="exit-payment" ><i class="fa fa-times" aria-hidden="true"></i></button></h3>
        <hr>
        <div>
            <input type="radio" name="payment-method" class="payment-method" value="cash">
            <span>Tiền mặt (Thanh toán khi nhận hàng)</span>
        </div>
        <div>
            <input type="radio" name="payment-method" class="payment-method" value="team16-acc">
            <span>Tài khoản team 16</span>
        </div>
        <div>
            <input type="radio" name="payment-method" class="payment-method" value="vnpay">
            <span>Thanh toán qua VNPay</span>
        </div>
        <div>
            <input type="radio" name="payment-method" class="payment-method" value="paypal">
            <span>Thanh toán qua Paypal</span>
        </div>
        <button class="btn " id="btn-pay" >OK</button>
    </div>
    
</body>

</html>
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
        $(function(){
           $('#btn-tt').click(function(){
               $('#choose-payment-method').show();
               document.getElementById("page").style.opacity = "0.5";
           }); 
           $('#exit-payment').click(function(){
               $('#choose-payment-method').hide();
               document.getElementById("page").style.opacity = "1";
           });
           $('#btn-pay').click(function(){
               var list = document.getElementsByName("payment-method");
                for(i=0;i<list.length;i++){
                var a = list[i];
                if(a.checked === true){
                    if(a.value == 'cash'){
                        location.assign('checkout.jsp');
                    }
                    if(a.value == 'vnpay'){
                        location.assign('checkout-vnpay.jsp');
                    }
                    if(a.value == 'paypal'){
                        location.assign('');
                    }
                    if(a.value == 'team16-acc'){
                        location.assign('');
                    }
                }
                
            }
           });
           
        });
    </script>