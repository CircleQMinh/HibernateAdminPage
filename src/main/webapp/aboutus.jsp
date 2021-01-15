<%-- 
    Document   : aboutus.jsp
    Created on : Dec 27, 2020, 4:55:00 PM
    Author     : KHOAPHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/styleAbout.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/384d09a31e.js" crossorigin="anonymous"></script>
</head>
<body>
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
                        <li><a href="">Liên hệ</a></li>
                        <li><a href="myblog.html">Blog</a></li>
                        <li><a href="">Tài khoản</a></li>
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
            <div class="row">
                <div class="col-2">
                    <h1>Lorem ipsum cà rốt</h1>
                    <p>Giảm giá mạnh cho cà rốt Lorem ipsum.<br> Đối với chúng tôi mà nói như một người kém khôn ngoan sẽ không bao giờ từ chối một số loại kết quả từ sự yếu kém của tâm trí khi nó nhận được <br>chấp nhận dễ dàng chỉ mất một chút thời gian.</p>
                    <button value="Explore Now" class="btn">Khám phá ngay &#10132;</button>
                </div>
                <div class="col-2">
                    <img src="images/prd8.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Featured categories-->
    <div class="about">
        <section>
            <div class="container">
                <h1 class="heading">Liên hệ chi tiết</h1>
                <div class="card-wrapper">
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/cat.jpg" alt="profile image" class="profile-img">
                        <h1>Khoa Phan</h1>
                        <p class="job-title">Web Designer</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư     Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Contact</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/dongthan.jpg" alt="profile image" class="profile-img">
                        <h1>Đông Thân</h1>
                        <p class="job-title">Web Develop</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư   Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Contact</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/cat3.jpg" alt="profile image" class="profile-img">
                        <h1>Quốc Minh</h1>
                        <p class="job-title">Lead Designer</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư    Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Contact</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/cat1.jpg" alt="profile image" class="profile-img">
                        <h1>Vinh Kiều</h1>
                        <p class="job-title">Business Analyst</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư   Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Contact</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                </div>
            </div>
        </section>
    </div>
    
    
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

