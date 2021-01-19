<%-- 
    Document   : index
    Created on : Nov 20, 2020, 8:52:58 PM
    Author     : ASUS
--%>
<%@page import="Model.FeaProduct"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TEAM16 Store</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/styles/metro/notify-metro.css" />
    <script src="js/cart.js" type="text/javascript"></script>
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="gogo">
                    <img src="images/logo-default.jpg" width="125px" alt="" class="myimg"/>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="products.jsp">Sản phẩm</a></li>
                        <li><a href="aboutus.jsp">Liên Hệ</a></li>
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
            <div class="row">
                <div class="col-2">
                    <h1>Chào mừng đến với TEAM16</h1>
                    <p>Hãy đăng kí ngay hôm nay<br>Để nhận được những ưu đãi siêu khủng từ chúng tôi......</p>
                    <button value="Explore Now" class="btn">Khám phá ngay &#10132;</button>
                </div>
                <div class="col-2">
                    <img src="images/prd8.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Featured categories-->
    <div class="categories">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <img src="images/prd1.png" alt="">
                </div>
                <div class="col-3">
                    <img src="images/prd2.jpg" alt="">
                </div>
                <div class="col-3">
                    <img src="images/prd3.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Featured products-->
    
    <div class="small-container">
        <h2 class="title">Sản phẩm nổi bật</h2>
            <%
            try{
            List<FeaProduct> prds = ProductDao.getFeaturedProduct();
            for (int i=0;i<prds.size();i++) {
            %>
            <div class="row">
                <% if(i<prds.size()) { Product prdsss = ProductDao.getPro(prds.get(i).getId()); 
                %>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdsss.getProductId() %>');">
                        <img src="<%= prdsss.getPicture() %>" alt="">
                        <h4><%= prdsss.getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdsss.getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdsss.getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdsss.getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdsss.getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdsss.getProductId() %>,'<%= prdsss.getProductName() %>',<%= prdsss.getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>
                <% if(i<prds.size()) { Product prdsss = ProductDao.getPro(prds.get(i).getId()); 
                %>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdsss.getProductId() %>');">
                        <img src="<%= prdsss.getPicture() %>" alt="">
                        <h4><%= prdsss.getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdsss.getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdsss.getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdsss.getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdsss.getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdsss.getProductId() %>,'<%= prdsss.getProductName() %>',<%= prdsss.getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>
                <% if(i<prds.size()) { Product prdsss = ProductDao.getPro(prds.get(i).getId()); 
                %>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdsss.getProductId() %>');">
                        <img src="<%= prdsss.getPicture() %>" alt="">
                        <h4><%= prdsss.getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdsss.getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdsss.getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdsss.getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdsss.getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdsss.getProductId() %>,'<%= prdsss.getProductName() %>',<%= prdsss.getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>
                <% if(i<prds.size()) { Product prdsss = ProductDao.getPro(prds.get(i).getId()); 
                %>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdsss.getProductId() %>');">
                        <img src="<%= prdsss.getPicture() %>" alt="">
                        <h4><%= prdsss.getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdsss.getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdsss.getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdsss.getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdsss.getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdsss.getProductId() %>,'<%= prdsss.getProductName() %>',<%= prdsss.getPrice() %>)" class="btn">
                    </div>
                </form><% }%>     
            </div>
        <%if(i==3) break;%>
        <% }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        %>
        <!--Lastest Products-->
        <h2 class="title">Sản phẩm mới</h2>
        <%
        try{
            List<Product> prdss = ProductDao.getAllProSortbyDate(); 
            for (int i=0;i<prdss.size();i++) {%>
            <div class="row">
                <% if(i<prdss.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdss.get(i).getProductId() %>');">
                        <img src="<%= prdss.get(i).getPicture() %>" alt="">
                        <h4><%= prdss.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdss.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdss.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdss.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdss.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdss.get(i).getProductId() %>,'<%= prdss.get(i).getProductName() %>',<%= prdss.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>
                <% if(i<prdss.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdss.get(i).getProductId() %>');">
                        <img src="<%= prdss.get(i).getPicture() %>" alt="">
                        <h4><%= prdss.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdss.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdss.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdss.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdss.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdss.get(i).getProductId() %>,'<%= prdss.get(i).getProductName() %>',<%= prdss.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>
                <% if(i<prdss.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdss.get(i).getProductId() %>');">
                        <img src="<%= prdss.get(i).getPicture() %>" alt="">
                        <h4><%= prdss.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdss.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdss.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdss.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdss.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdss.get(i).getProductId() %>,'<%= prdss.get(i).getProductName() %>',<%= prdss.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>
                <% if(i<prdss.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prdss.get(i).getProductId() %>');">
                        <img src="<%= prdss.get(i).getPicture() %>" alt="">
                        <h4><%= prdss.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prdss.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prdss.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prdss.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prdss.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prdss.get(i).getProductId() %>,'<%= prdss.get(i).getProductName() %>',<%= prdss.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% } %>
            </div>
        <% if(i==11) break; %>
        <% }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        %>
    </div>
    <!----offer----->
    <div class="offer">
        <div class="small-container">
            <div class="row">
                <div class="col-2">
                    <img src="https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/40_bkkg0s.jpg" class="offer-img" alt="">
                </div>
                <div class="col-2">
                    <p>Thực phẩm chức năng</p>
                    <h1>Poly VIETMEC</h1>
                    <small>Hỗ trợ nhuận tràng, thông tiện, giảm táo bón.</small><br>
                        <button value="Buy Now" onclick="location.assign('product-details.jsp?prdID_item=40');" class="btn">Mua ngay &#10132;</button>
                </div>
            </div>
        </div>
    </div>
    <!-----testomonial-->
    <div class="testimonial">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <i class="fa fa-quote-left"></i>
                    <p>Lương y như từ mẫu</p>
                    <i class="fa fa-quote-right"></i>
                    <div class="rating">
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star-half-o" ></i>
                        <i class="fa fa-star-o" ></i>
                    </div>
                    <img src="images/HCM.jpg" alt="">
                    <h3>Chủ tịch Hồ Chí Minh</h3>
                </div>
                <div class="col-3">
                    <i class="fa fa-quote-left"></i>
                    <p>Chính sức khỏe mới là sự giàu có thực sự, không phải vàng và bạc</p>
                    <i class="fa fa-quote-right"></i>
                    <div class="rating">
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star-half-o" ></i>
                        <i class="fa fa-star-o" ></i>
                    </div>
                    <img src="images/Benjamin Franklin.jpg" alt="">
                    <h3>Benjamin Franklin</h3>
                </div>
                <div class="col-3">
                    <i class="fa fa-quote-left"></i>
                    <p>Sức khỏe tốt và trí tuệ minh mẫn là hai điều hạnh phúc nhất của cuộc đời</p>
                    <i class="fa fa-quote-right"></i>
                    <div class="rating">
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star-half-o" ></i>
                        <i class="fa fa-star-o" ></i>
                    </div>
                    <img src="images/Mark Twain.jpg" alt="">
                    <h3>Mark Twain</h3>
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
    <!---- Toggle Menu ------>
    <script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight="0px";
        function menutoggle(){
            if(MenuItems.style.maxHeight=="0px")
            {
                MenuItems.style.maxHeight="250px"
            }
            else
            {
                MenuItems.style.maxHeight="0px"
            }
        }
    </script>
</body>
</html>
<script>
    const buttons =document.querySelectorAll("button")
    buttons.forEach(btn =>{
        btn.addEventListener('click',function(e){
            btn.style.border= "none" ;
            let x=e.clientX - e.target.left;
            let y=e.clientY - e.target.top;
            let ripples =document.createElement('span');
            ripples.style.left=x+'px';
            ripples.style.top=y+'px';
            this.appendChild(ripples);

            setTimeout(()=>{
                ripples.remove()
            },1000);
        })
    })
</script>
<script>
    function notify() {
	$.notify("Thêm thành công", "success");
    }
    $(function(){
            $("input[id|='add_item']").click( function(){
                var postData = $(this).closest('div').closest('form').serialize();
                 $.ajax({
                    type: "POST",
                    url: "ajax/customerpage/ajax_add_item.jsp",
                    data: postData,
                    success: function ( response ) {
                        notify();
                    }  
                });
            });
    });
</script>