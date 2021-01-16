<%-- 
    Document   : customer-account
    Created on : Dec 23, 2020, 2:21:51 AM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <%
        String msg = (String)request.getAttribute("msg"); 
        
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Account</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/cart.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/32884b7746.js" crossorigin="anonymous"></script>
        <style>
            body {
                background: radial-gradient(#fff,#ffd6d6);
                padding-top: 85px;
                width: 100%;
                height: 100%;
            }
            h1 {
                font-family: 'Poppins', sans-serif, 'arial';
                font-weight: 600;
                font-size: 72px;
                color: white;
                text-align: center;
            }
            h4 {
                font-family: 'Roboto', sans-serif, 'arial';
                font-weight: 400;
                font-size: 20px;
                color: #9b9b9b;
                line-height: 1.5;
            }
        </style>
        
        <script>
            <%
                if(msg==null){
                    
                }
                else{%>
                  alert('<%=msg%>')  ;
                <%}
            %>
        </script>
    </head>
    <body >
        <c:if test="${(sessionScope.account==null)}">
            <c:redirect url="/Dn-Dky-QMk/login.jsp"></c:redirect>
        </c:if>
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
                    <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" class="imgcard"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                </div>

            </div>
        </div>
    <c:if test="${sessionScope.account.type=='customer'}">
        <h4 class="myarticle-title">Thông tin của tôi</h4>
        <article class="myarticle">
            <p>Tên : ${sessionScope.userInfo.customerName}</p>
            <p>Email : ${sessionScope.userInfo.email}</p>
            <p>Điện thoại : ${sessionScope.userInfo.phone}</p>
            <p>Địa chỉ : ${sessionScope.userInfo.address}</p>
            <p>Giới tính : ${sessionScope.userInfo.sex}</p>
            <p>Tài khoản : ${sessionScope.userInfo.money} </p>
        </article>
        <h4 class="myarticle-title">Tùy chọn</h4>
        <button class="btn" onclick="openForm('Modal-password')" style="margin-left: 3%">Thay đổi mật khẩu</button>
        <button class="btn" onclick="openForm('Modal-info')">Thay đổi thông tin</button>
        <div id="Modal-password" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-password')">&times;</span>
                <p>Thay đổi mật khẩu</p>
                <form id="new-password" action="NewPassword" method="post">
                    <input type="hidden" value="${sessionScope.account.accountId}" name="Id">
                    <p>Username :</p>
                    <input type="text" name="user-name" readonly="true" value="${sessionScope.account.username}" required="true">
                    <p>Mật khẩu hiện tại : </p>
                    <input type="text" name="cur-pass" required="true">
                    <p>Mật khẩu mới : </p>
                    <input type="text" name="new-pass" required="true"><br>
                    
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        <div id="Modal-info" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-info')">&times;</span>
                <p>Thay đổi info</p>
                <form id="new-info" action="NewInfo" method="post">
                    <input type="hidden" value="customer" name="type">
                    <p>Tên :</p>
                    <input type="text" name="name" value="${sessionScope.userInfo.customerName}" required="true">
                    <p>Điện thoại : </p>
                    <input type="text" name="phone" value="${sessionScope.userInfo.email}" required="true">
                    <p> Email : </p>
                    <input type="text" name="email" value="${sessionScope.userInfo.phone}" required="true">
                    <p> Địa chỉ : </p>
                    <input type="text" name="address" value="${sessionScope.userInfo.address}" required="true">
                    <p> Giới  tính</p>
                    <select name="sex" id="sex">
                        <option selected value="1">Nam</option>
                        <option>Nữ</option>
                    </select><br>
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>    
    </c:if>
    <c:if test="${sessionScope.account.type=='employee'}">
        <h4 class="myarticle-title">My info</h4>
        <article class="myarticle">
            <p>Name : ${sessionScope.userInfo.employeeName}</p>
            <p>Email : ${sessionScope.userInfo.email}</p>
            <p>Phone : ${sessionScope.userInfo.phone}</p>
            <p>Gender : ${sessionScope.userInfo.sex}</p>
        </article>
        <h4 class="myarticle-title">Option</h4>
        <button class="btn" onclick="location.href='nhanvien.jsp'"  style="margin-left: 3%">Đến trang nhân viên</button>
        <button class="btn" onclick="location.href='shipper.jsp'" >Đến trang giao hàng</button>
        <button class="btn" onclick="openForm('Modal-password')">Thay đổi mật khẩu</button>
        <button class="btn" onclick="openForm('Modal-info')">Thay đổi thông tin</button>
        <div id="Modal-password" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-password')">&times;</span>
                <p>Thay đổi mật khẩu</p>
                <form id="new-password" action="NewPassword" method="post">
                    <input type="hidden" value="${sessionScope.account.accountId}" name="Id">
                    <p>Username :</p>
                    <input type="text" name="user-name" readonly="true" value="${sessionScope.account.username}" required="true">
                    <p>Mật khẩu hiện tại : </p>
                    <input type="text" name="cur-pass" required="true">
                    <p>Mật khẩu mới : </p>
                    <input type="text" name="new-pass" required="true"><br>
                    
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        <div id="Modal-info" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-info')">&times;</span>
                <p>Thay đổi info</p>
                <form id="new-info" action="NewInfo" method="post">
                    <input type="hidden" value="employee" name="type">
                    <p>Tên :</p>
                    <input type="text" name="name" value="${sessionScope.userInfo.employeeName}" required="true">
                    <p>Điện thoại : </p>
                    <input type="text" name="phone" value="${sessionScope.userInfo.email}" required="true">
                    <p> Email : </p>
                    <input type="text" name="email" value="${sessionScope.userInfo.phone}" required="true">
                    <p> Địa chỉ : </p>
                    <input type="text" name="address" value="${sessionScope.userInfo.address}" required="true">
                    <p> Giới  tính</p>
                    <select name="sex" id="sex">
                        <option selected value="1">Nam</option>
                        <option>Nữ</option>
                    </select><br>
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
    </c:if>
    <c:if test="${sessionScope.account.type=='admin'}">
        <h4 class="myarticle-title">My info</h4>
        <article class="myarticle">
            <p>Name : ${sessionScope.userInfo.name}</p>
            <p>Email : ${sessionScope.userInfo.email}</p>
            <p>Phone : ${sessionScope.userInfo.phone}</p>
            <p>Gender : ${sessionScope.userInfo.sex}</p>
        </article>
        <h4 class="myarticle-title">Option</h4>
        <button class="btn" onclick="location.href='dashboard.jsp'"  style="margin-left: 3%">Đến trang quản lý</button>
        <button class="btn" onclick="openForm('Modal-password')">Thay đổi mật khẩu</button>
        <button class="btn" onclick="openForm('Modal-info-admin')">Thay đổi thông tin</button>
        <div id="Modal-password" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-password')">&times;</span>
                <p>Thay đổi mật khẩu</p>
                <form id="new-password" action="NewPassword" method="post">
                    <input type="hidden" value="${sessionScope.account.accountId}" name="Id">
                    <p>Username :</p>
                    <input type="text" name="user-name" readonly="true" value="${sessionScope.account.username}" required="true">
                    <p>Mật khẩu hiện tại : </p>
                    <input type="text" name="cur-pass" required="true">
                    <p>Mật khẩu mới : </p>
                    <input type="text" name="new-pass" required="true"><br>
                    
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        <div id="Modal-info-admin" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-info-admin')">&times;</span>
                <p>Thay đổi info</p>
                <form id="new-info" action="NewInfo" method="post">
                    <input type="hidden" value="admin" name="type">
                    <input type="hidden" value="admin" name="address">
                    <p>Tên :</p>
                    <input type="text" name="name" value="${sessionScope.userInfo.name}" required="true">
                    <p>Điện thoại : </p>
                    <input type="text" name="phone" value="${sessionScope.userInfo.email}" required="true">
                    <p> Email : </p>
                    <input type="text" name="email" value="${sessionScope.userInfo.phone}" required="true">
                    <p> Giới  tính</p>
                    <select name="sex" id="sex">
                        <option selected value="1">Nam</option>
                        <option>Nữ</option>
                    </select><br>
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        
    </c:if>
        <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Liên hệ</h3>
                    <ul>
                        <li><i class="fas fa-map-marker-alt" style="padding-right: 8.5px"></i> Địa chỉ: 1 Võ Văn Ngân, Linh Chiểu, Thủ Đức</li>
                        <li><i class="fas fa-mobile-alt" style="padding-right: 9px"></i> Tel: 0909999999</li>
                        <li><i class="fas fa-phone-alt" style="padding-right: 5px"></i> Phone: 082.686868</li>
                        <li><i class="fas fa-fax" style="padding-right: 5px"></i> Fax: 024.3294.7979</li>
                    </ul>
                    </br>
                    <h3>Ứng dụng trên điện thoại</h3>
                    <div class="app-logo">
                        <img src="images/playstore.png" alt="">
                        <img src="images/appstore.png" alt="">           
                    </div>
                </div>
                <div class="footer-col-2">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4972148751713!2d106.77022543613889!3d10.849736223750991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175270ad28d48ab%3A0xa6c02de0a7c40d6c!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBTxrAgUGjhuqFtIEvhu7kgVGh14bqtdCBUcC5IQ00!5e0!3m2!1svi!2s!4v1610775978281!5m2!1svi!2s" width="250" height="200" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></li>

                </div>
                <div class="footer-col-3">
                    <img src="images/logo-default-2.jpg" alt="" style="width: 180px"/>
                    <p>Sức khỏe hôm nay - Hạnh phúc ngày mai  </p>
                </div>
                <div class="footer-col-3">
                    <h3 style="padding-bottom: 8px">Theo dõi</h3>
                    <ul>
                        <li>
                            
                            <i class="fab fa-facebook-square fa-4x" style="padding: 10px"></i>
                            <i class="fas fa-blog fa-4x" style="padding: 10px"></i>

                        </li>
         
                        <li>
                          
                            <i class="fab fa-instagram-square fa-4x" style="padding: 10px"></i>
                            <i class="fab fa-youtube fa-4x" style="padding: 10px"></i>
 
                        </li>
                    </ul>
                    
                </div>
            </div>
            <hr>
            <p class="copyright">Copyright 2020 - Team16</p>
        </div>
    </div>
</body>
</html>