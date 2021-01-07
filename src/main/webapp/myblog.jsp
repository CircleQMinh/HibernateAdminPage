<%-- 
    Document   : myblog
    Created on : Dec 30, 2020, 7:56:13 PM
    Author     : KHOAPHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DONG Store</title>
    <link href="css/style1.css" rel="stylesheet" type="text/css"/>
    <script src="https://kit.fontawesome.com/384d09a31e.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="gogo">
                    <img src="images/logo-default.jpg" width="70" height="70
                    " alt=""/>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="products.jsp">Products</a></li>
                        <li><a href="aboutus.jsp">About</a></li>
                        <li><a href="myblog.jsp">Blog</a></li>
                        <li><a href="">Account</a></li>
                        <li><a href="" class="btn-login btn">Log In</a></li>
                        <li><a href="" class="btn-register btn">Register</a></li>
                        <li><a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" class="imgcard" ></a></li>
                        
                    </ul>
                </nav>
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
    <!--Trang blog-->
    <section class="our_blog py-lg-5 py-md-5 py-3">
        <div class="container">
            <div class="inner-sec py-lg-5  py-3">
                <h3 class="tittle-wthree text-center mb-lg-5 mb-3">Our Blog</h3>
                <div class="row mt-lg-5 mt-md-4 mt-4">
                    <!--Bên trái của màn hình sẽ chưa những nội dung tóm tắt của các thẻ blog-->
                    <div class = "col-lg-8 left-blog-info text-left">
                        <!--Các kí hiệu mb-4 và mx-2 là thứ tự căn khoảng cách ở bootrap-->
                        <!--link : https://getbootstrap.com/docs/4.0/utilities/spacing/-->
                        <div class = "row mb-4"> 
                            <!--mỗi tấm card sẽ là 1 tóm tắt nội dung-->
                            <!--link tìm hiểu : https://getbootstrap.com/docs/4.0/components/card/-->
                            
                            <!--Thẻ tóm tắt 1-->
                            <div class="col-md-6 card">

                                    <a href="blog1.jsp">
                                        <img src="images/tea3.jpg" class="img-fluid" alt="">
                                    </a>

                                    <div class= "card-body">
                                        <!--nội dung người dùng xem được-->
                                        <ul class="blog-icons my-4">
                                            <!--thời gian blog được đăng lên-->
                                            <li>
                                                <a href="#"><i class="far fa-calendar-alt"></i>Feb 20 2020</a>
                                            </li>
                                            <!--số cmt trong blog-->
                                            <li>
                                                <a href="#"><i class="fas fa-comments"></i>23</a>
                                            </li>
                                            <!--số người đã theo dõi-->
                                            <li>
                                                <a href="#"><i class="fas fa-eye"></i>1500</a>
                                            </li>
                                        </ul>
                                        <!--Thanh tiêu đề-->
                                        <h5 class="card-title">
                                            <a href="blog1.jsp">Trà gừng có tác dụng gì? 8 công dụng tuyệt vời của trà gừng</a>
                                        </h5>
                                        <!--Nội dung tóm tắt của blog-->
                                        <p class="card-text">Gừng có vị cay, tính ấm vào 3 kinh vị, phế, tỳ nhưng ít ai biết được những công dụng của gừng cũng như trà của nó. Hôm nay chúng tôi sẽ giúp mọi người trả lời câu hỏi trà gừng có tác dụng gì?</p>
                                        <!--Nút đọc tiếp-->
                                        <div class="read inner mt-4">
                                            <a href="blog1.jsp" class="btn btn-sm animated-button victoria-two">Read More</a>
                                        </div>
                                    </div>

                            </div>
                            <!--Kết thúc 1 thẻ tóm tắt-->

                            <!--Thẻ tóm tắt 2-->
                            <div class="col-md-6 card">

                                <a href="blog2.jsp">
                                    <img src="images/om2.jpg" class="img-fluid" alt="">
                                </a>

                                <div class= "card-body">
                                    <!--nội dung người dùng xem được-->
                                    <ul class="blog-icons my-4">
                                        <!--thời gian blog được đăng lên-->
                                        <li>
                                            <a href="#"><i class="far fa-calendar-alt"></i>Feb 20 2020</a>
                                        </li>
                                        <!--số cmt trong blog-->
                                        <li>
                                            <a href="#"><i class="fas fa-comments"></i>23</a>
                                        </li>
                                        <!--số người đã theo dõi-->
                                        <li>
                                            <a href="#"><i class="fas fa-eye"></i>1500</a>
                                        </li>
                                    </ul>
                                    <!--Thanh tiêu đề-->
                                    <h5 class="card-title">
                                        <a href="blog/blog2.jsp">Mẹo hay chữa cảm lạnh, cảm cúm mùa đông không cần dùng thuốc</a>
                                    </h5>
                                    <!--Nội dung tóm tắt của blog-->
                                    <p class="card-text">Mùa đông là thời điểm mọi người rất dễ bị cảm lạnh, cảm cúm, nhất là đối với trẻ nhỏ. Bài viết sau đây sẽ giúp bạn có cách chữa cảm lạnh, cảm cúm không cần dùng thuốc rất hiệu quả và bổ ích.</p>
                                    <!--Nút đọc tiếp-->
                                    <div class="read inner mt-4">
                                        <a href="blog2.jsp" class="btn btn-sm animated-button victoria-two">Read More</a>
                                    </div>
                                </div>

                            </div>
                            <!--Kết thúc 1 thẻ tóm tắt-->

                            <!--Thẻ tóm tắt 3-->
                            <div class="col-md-6 card">

                                <a href="blog3.jsp">
                                    <img src="images/aaa.jpg" class="img-fluid" alt="">
                                </a>

                                <div class= "card-body">
                                    <!--nội dung người dùng xem được-->
                                    <ul class="blog-icons my-4">
                                        <!--thời gian blog được đăng lên-->
                                        <li>
                                            <a href="#"><i class="far fa-calendar-alt"></i>Feb 20 2020</a>
                                        </li>
                                        <!--số cmt trong blog-->
                                        <li>
                                            <a href="#"><i class="fas fa-comments"></i>23</a>
                                        </li>
                                        <!--số người đã theo dõi-->
                                        <li>
                                            <a href="#"><i class="fas fa-eye"></i>1500</a>
                                        </li>
                                    </ul>
                                    <!--Thanh tiêu đề-->
                                    <h5 class="card-title">
                                        <a href="blog3.jsp">7 Danh y kiệt xuất trong lịch sử y học Việt Nam</a>
                                    </h5>
                                    <!--Nội dung tóm tắt của blog-->
                                    <p class="card-text">Trong lịch sử y dược ngàn năm dân tộc Việt Nam đã sinh thành và nuôi dưỡng những vị danh y kiệt xuất, có những đóng góp và cống hiến lớn lao với cộng đồng mà ngành y dược nước nhà sử sách vẫn còn in những dấu son vàng.Vậy chúng ta cùng tìm hiểu xem 7 danh y nổi tiếng của nước Việt Nam là ai nhé</p>
                                    <!--Nút đọc tiếp-->
                                    <div class="read inner mt-4">
                                        <a href="blog3.jsp" class="btn btn-sm animated-button victoria-two">Read More</a>
                                    </div>
                                </div>

                            </div>
                            <!--Kết thúc 1 thẻ tóm tắt-->

                            <!--Thẻ tóm tắt 4-->
                            <div class="col-md-6 card">

                                <a href="blog4.jsp">
                                    <img src="images/traicay.jpg" class="img-fluid" alt="">
                                </a>

                                <div class= "card-body">
                                    <!--nội dung người dùng xem được-->
                                    <ul class="blog-icons my-4">
                                        <!--thời gian blog được đăng lên-->
                                        <li>
                                            <a href="#"><i class="far fa-calendar-alt"></i>Feb 20 2020</a>
                                        </li>
                                        <!--số cmt trong blog-->
                                        <li>
                                            <a href="#"><i class="fas fa-comments"></i>23</a>
                                        </li>
                                        <!--số người đã theo dõi-->
                                        <li>
                                            <a href="#"><i class="fas fa-eye"></i>1500</a>
                                        </li>
                                    </ul>
                                    <!--Thanh tiêu đề-->
                                    <h5 class="card-title">
                                        <a href="blog4.jsp">Mùa hè, ăn trái cây nào tốt nhất?</a>
                                    </h5>
                                    <!--Nội dung tóm tắt của blog-->
                                    <p class="card-text">Mùa hè đến, thời tiết nắng nóng làm cơ thể chúng ta mệt mỏi, rã rời, sức đề kháng giảm sút nên rất dễ bị cảm nắng, say nắng nóng… bổ sung vitamin từ các loại rau tươi, quả chín sẽ giúp cơ thể tăng sức đề kháng chống lại bệnh tật... Vậy nên ăn quả gì, uống nước gì tốt trong ngày hè?</p>
                                    <!--Nút đọc tiếp-->
                                    <div class="read inner mt-4">
                                        <a href="blog4.jsp" class="btn btn-sm animated-button victoria-two">Read More</a>
                                    </div>
                                </div>

                            </div>
                            <!--Kết thúc 1 thẻ tóm tắt-->

                            <!--Thẻ tóm tắt 5-->
                            <div class="col-md-6 card">

                                <a href="blog5.jsp">
                                    <img src="images/me.jpg" class="img-fluid" alt="">
                                </a>

                                <div class= "card-body">
                                    <!--nội dung người dùng xem được-->
                                    <ul class="blog-icons my-4">
                                        <!--thời gian blog được đăng lên-->
                                        <li>
                                            <a href="#"><i class="far fa-calendar-alt"></i>Feb 20 2020</a>
                                        </li>
                                        <!--số cmt trong blog-->
                                        <li>
                                            <a href="#"><i class="fas fa-comments"></i>23</a>
                                        </li>
                                        <!--số người đã theo dõi-->
                                        <li>
                                            <a href="#"><i class="fas fa-eye"></i>1500</a>
                                        </li>
                                    </ul>
                                    <!--Thanh tiêu đề-->
                                    <h5 class="card-title">
                                        <a href="blog5.jsp">Chế độ ăn uống sau sinh: 12 thực phẩm cho bà mẹ mới</a>
                                    </h5>
                                    <!--Nội dung tóm tắt của blog-->
                                    <p class="card-text">Trong thời kỳ mang thai,nhu cầu dinh dưỡng của bà bầu vô cùng quan trọng bởi nó cung cấp chất dinh dưỡng cho cả mẹ và bé. Tuy nhiên,chế độ ăn sau sinh cho sản phụ cũng quan trọng không kém. Nó giúp cho cơ thể người mẹ nhanh chóng được phục hồi, đồng thời cung cấp năng lượng và chất dinh dưỡng cần thiết để chăm sóc, nuôi dưỡng trẻ.</p>
                                    <!--Nút đọc tiếp-->
                                    <div class="read inner mt-4">
                                        <a href="blog5.jsp" class="btn btn-sm animated-button victoria-two">Read More</a>
                                    </div>
                                </div>

                            </div>
                            <!--Kết thúc 1 thẻ tóm tắt-->

                            <!--Thẻ tóm tắt 6-->
                            <div class="col-md-6 card">

                                <a href="blog6.jsp">
                                    <img src="images/thuocnam2.jpg" class="img-fluid" alt="">
                                </a>

                                <div class= "card-body">
                                    <!--nội dung người dùng xem được-->
                                    <ul class="blog-icons my-4">
                                        <!--thời gian blog được đăng lên-->
                                        <li>
                                            <a href="#"><i class="far fa-calendar-alt"></i>Feb 20 2020</a>
                                        </li>
                                        <!--số cmt trong blog-->
                                        <li>
                                            <a href="#"><i class="fas fa-comments"></i>23</a>
                                        </li>
                                        <!--số người đã theo dõi-->
                                        <li>
                                            <a href="#"><i class="fas fa-eye"></i>1500</a>
                                        </li>
                                    </ul>
                                    <!--Thanh tiêu đề-->
                                    <h5 class="card-title">
                                        <a href="blog6.jsp">Thuốc nam chữa bệnh suy thận đơn giản và hiệu quả</a>
                                    </h5>
                                    <!--Nội dung tóm tắt của blog-->
                                    <p class="card-text">Để chữa bệnh suy thận hiệu quả, bạn cần phát hiện bệnh sớm và sử dụng đúng thuốc. Bìa viết hôm nay, Thuốc Nam Đông Thân xin chia sẻ bài thuốc nam chữa suy thận hiệu quả và rất đơn giản. Mời các bạn tìm hiểu bài viết dưới đây để có thể nắm rõ hơn về cách chữa suy thận bằng thuốc nam hiệu quả.Hi vọng bài viết sẽ giúp bạn chữa bệnh hiệu quả</p>
                                    <!--Nút đọc tiếp-->
                                    <div class="read inner mt-4">
                                        <a href="blog6.jsp" class="btn btn-sm animated-button victoria-two">Read More</a>
                                    </div>
                                </div>

                            </div>
                            <!--Kết thúc 1 thẻ tóm tắt-->
                            
                        </div>
                    </div>
                    <!--Kết thúc phần bên trái-->

                    <!--Bên phải sẽ chưa thông tin đăng nhập, top các blog,...-->
                    <aside class = "col-lg-4 right-blog-con text-left" >
                        <div class="right-blog-info text-left">

                            <div class="tech-btm"><!--LƯU Ý-->
                                <img src="images/prd5.jpg" class="img-fluid" alt="">
                            </div>

                            <!--Nơi đăng kí email để nhận thông báo về các bài blog mới nhất-->
                            <div class="tech-btm">
                                <h4>Đăng kí để nhận những thông báo mới nhất</h4>
                                <p>Vui lòng điền email của bạn vào đây</p>
                                <form action="#" method="POST">
                                    <input class="form-control" type="email" placeholder="Email" required="">
                                    <input class="form-control" type="submit" value="Subscribe">
                                </form>
                            </div>

                            <!--Phân chia blog theo các thể loại-->
                            <!--<div class="tech-btm">
                                <h4>Các thể loại</h4>
                                <ul class="list-group-single">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Thuốc Nam
                                        <span class="badge badge-primary badge-pill">14 bài</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Chất lượng PV
                                        <span class="badge badge-primary badge-pill">2 bài</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Trải nghiệm người dùng
                                        <span class="badge badge-primary badge-pill">1 bài</span>
                                    </li>
                                </ul>
                            </div>-->

                            <!--Top blog của tuần-->
                            <div class="tech-btm">
                                <h4>Top Blog của tuần</h4>
                                <!--Top 1-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="#">
                                            <img src="images/traicay.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Mùa hè, ăn trái cây nào tốt nhất?</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!--Top 2-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="#">
                                            <img src="images/om2.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Mẹo hay chữa cảm lạnh, cảm cúm mùa đông không cần dùng thuốc</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <!--Link các mạng xã hội để dễ tiếp cận với người dùng hơn-->
                            <div class="tech-btm widget_social text-left">
                                <h4>Liên hệ với chúng tôi tại</h4>
                                <ul>
                                    <li>
                                        <a class="twitter" href="#">
										<i class="fab fa-twitter"></i>
										<span class="count">317K</span> Twitter Followers</a>
                                    </li>
                                    <li>
                                        <a class="facebook" href="#">
										<i class="fab fa-facebook-f"></i>
										<span class="count">218k</span> Facebook Followers</a>
                                    </li>
                                    <li>
                                        <a class="dribble" href="#">
                                        <i class="fab fa-youtube"></i>

										<span class="count">215k</span> Youtube Subrice </a>
                                    </li>
                                    <li>
                                        <a class="pin" href="#">
                                        <i class="fab fa-amazon"></i>
										<span class="count">190k đơn hàng</span> Amazone</a>
                                    </li>
                                </ul>
                            </div>

                            <!--Bài viết gần đây-->
                            <div class="tech-btm">
                                <h4>Bài viết gần đây</h4>

                                <!--Bài viết 1-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="#">
                                            <img src="images/om2.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Mẹo hay chữa cảm lạnh, cảm cúm mùa đông không cần dùng thuốc</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!--Bài viết 2-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="blog5.jsp">
                                            <img src="images/me.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Chế độ ăn uống sau sinh: 12 thực phẩm cho bà mẹ mới</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!--Bài viết 3-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="blog2.jsp">
                                            <img src="images/thuocnam.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>7 Danh y kiệt xuất trong lịch sử y học Việt Nam</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </aside>
                    <!--Kết thúc phần bên phải-->

                </div>
            </div>
        </div>
    </section>

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
                MenuItems.style.maxHeight="200px"
            }
            else
            {
                MenuItems.style.maxHeight="0px"
            }
        }
    </script>
    </body>
</html>