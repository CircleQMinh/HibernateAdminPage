<%@page import="ConfigVNPay.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : vnpay_return
    Created on : Sep 29, 2015, 7:23:56 PM
    Author     : xonv
    Description: Su dung de thong bao ket qua thanh toan toi khach hang. 
                 Khong thuc hien cap nhat vao db tai file nay
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Receipt</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/cart.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <style>

        </style>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = (String) params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }
            
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
            
        %>
        <!--Begin display -->
        <div class="header">
            <div class="container">
                <div class="navbar">
                    <div class="gogo">
                        <img src="images/logo-default.jpg" width="125px" alt=""/>
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="index.jsp">Trang chủ</a></li>
                            <li><a href="products.jsp">Sản phẩm</a></li>
                            <li><a href="aboutus.jsp">Liên hệ</a></li>
                            <li><a href="myblog.jsp">Blog</a></li>
                            <li><a href="account-info.jsp">Tài khoản</a></li>
                            <c:choose>
                                <c:when test="${sessionScope.account==null}" >
                                    <li><a href="login" class="btn-login">Đăng nhập</a></li>
                                    <li><a href="register" class="btn-register">Đăng ký</a></li>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${sessionScope.account.type=='customer'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.customerName}"/></a></li>
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                        </c:when>
                                        <c:when test="${sessionScope.account.type=='employee'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.employeeName}"/></a></li>                                   
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                        </c:when>  
                                        <c:otherwise>
                                             <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.name}"/></a></li>
                                              <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>
                    <a href="cart.jsp" class="cart-day-ne">
                        <img src="images/cart.png" width="30px" height="30px" class="imgcard">
                        <span class="cart-item" >0</span>
                    </a><!-- comment -->
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                </div>
                <h4 class="myarticle-title" style="background-color: wheat">Thông tin hóa đơn</h4>
                <article class="myarticle"> 

                        <label >Người nhận:</label>
                        <label><%=request.getParameter("CustomerNameShip")%></label>
                        <br>
                        <label >Địa chỉ nhận hàng:</label>
                        <label><%=request.getParameter("AddressShip")%></label>
                        <br>
                        <label >Email: </label>
                        <label><%=request.getParameter("EmailShip")%></label>
                        <br>
                        <%
                            if(request.getParameter("vnp_TxnRef")!=null){%>
                            <label >Mã đơn hàng:</label>
                            <label><%=request.getParameter("vnp_TxnRef")%></label>
                            <br>   
                            <%}                       
                        %>
                        <label >Số tiền:</label>
                        <label><%=request.getParameter("vnp_Amount")%></label>
                        <br>
                        <label >Nội dung thanh toán:</label>
                        <label><%=request.getParameter("vnp_OrderInfo")%></label>
                        <br>
                        <%
                            if(request.getParameter("vnp_PayDate")!=null){%>
                            <label >Thời gian thanh toán:</label>
                            <label><%=request.getParameter("vnp_PayDate")%></label>
                            <br>   
                            <%}                       
                        %>
                        <label >Kết quả:</label>
                        <label>
                            <%
                                if(request.getAttribute("status_pay")!=null){
                                    if (request.getAttribute("status_pay").equals("success")) {
                                            out.print("Giao dịch Thành công - Cảm ơn quý khách");
                                        } else {
                                            out.print("Giao dịch Không thành công");
                                        }
                                }
                                else
                                {
                                    if (signValue.equals(vnp_SecureHash)) {
                                        if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                                            out.print("Giao dịch Thành công - Cảm ơn quý khách");
                                        } else {
                                             out.print("Giao dịch Không thành công");
                                        }

                                    } else {
                                        out.print("Chữ ký không hợp lệ");
                                    }
                                }
                            %>
                        </label>
                        </article> 
                    </div>
                </div>
            </div>
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
                        <img src="images/logo-default-2.jpg" alt=""/>
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
    </body>
</html>
<script>
    $(function(){
       alert('Đơn hàng đã được ghi lại , cửa hàng sẽ liên lạc với bạn để xác nhận việc đặt hàng') 
    });
</script>