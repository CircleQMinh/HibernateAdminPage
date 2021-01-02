<%-- 
    Document   : aboutus.jsp
    Created on : Dec 27, 2020, 4:55:00 PM
    Author     : KHOAPHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="products.jsp">Products</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="myblog.html">Blog</a></li>
                        <li><a href="">Account</a></li>
                        <li><a href="" class="btn-login">Log In</a></li>
                        <li><a href="" class="btn-register">Register</a></li>
                    </ul>
                </nav>
                <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" class="imgcard"></a>
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
            </div>
            <div class="row">
                <div class="col-2">
                    <h1>Lorem ipsum dolor sit amet.</h1>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<br> Nobis ut minus numquam reiciendis modi consequuntur mollitia quo sapiente suscipit animi cum <br>tempore recusandae facilis assumenda iusto a sunt, iure officiis.</p>
                    <button value="Explore Now" class="btn">Explore Now &#10132;</button>
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
                <h1 class="heading">Meet The Team</h1>
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

