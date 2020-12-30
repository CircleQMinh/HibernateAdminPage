<%-- 
    Document   : products
    Created on : Nov 20, 2020, 8:58:16 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*" %>
<%@page import="Model.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All products - TEAM16 Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
    <script src="js/cart.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(document).ready(function(){
            updateCart();
            var pageSize = 12;// 12 product in page
            showPage = function(page){
                $(".col-4.contentProduct").hide();
                $(".col-4.contentProduct").each(function(n) {
				if (n >= pageSize * (page - 1) && n < pageSize * page)
					$(this).show();
			});
            }
            showPage(1);
            var totalRows = $('#total_prd').val();//total product
            var btnPage=5;// Số nút bấm
            var iTotalPages = Math.ceil(totalRows/pageSize);
            
            var obj = $('#pagination').twbsPagination({
                totalPages: iTotalPages,
                visiblePages: btnPage,
                onPageClick: function (event, page) {
				/* console.info(page); */
				showPage(page);
			}
            });
        });
    </script>
    <style>
        #pagination {
		display: flex;
		display: -webkit-flex; /* Safari 8 */
		flex-wrap: wrap;
		-webkit-flex-wrap: wrap; /* Safari 8 */
		justify-content: center;
		-webkit-justify-content: center;
	}
	#pagination a{
            position: relative;
            float: left;
            padding: .5rem .75rem;
            margin-left: -1px;
            color: #0275d8;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
	}
    </style>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
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
            <a href="cart.jsp" ><img src="images/cart.png" width="30px" height="30px" class="imgcard"><span class="cart-item" >(0)</span></a>
            <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
            </div>
    </div>

    <div class="small-container">
        <div class="row row-2">
            <h2>All Products</h2>
            <input type="text" placeholder="Search" class="txtSearch">
            <select name="" id="">
                <option value="">Default Shorting</option>
                <option value="">Short by price</option>
                <option value="">Short by popularity</option>
                <option value="">Short by rating</option>
                <option value="">Short by sale</option>
            </select>
        </div>
        <%
        List<Product> prd = ProductDao.getAllPro();
        %>
        <input type="hidden" id="total_prd" value="<%= prd.size() %>">
        <%
        int total = prd.size();
        int first =0, last=0,pages=1;
        if(request.getParameter("pages")!=null)
        {
            pages =(int)Integer.parseInt(request.getParameter("pages"));
        }

        if(total <=12)
        {
            first=0;
            last=total;
        }
        else
        {
            first=(pages -1)*12;
            last=12;
        }
        try{
            
            for (int i=0;i<prd.size();i++) {%>
            <div class="row">
                <% if(i<prd.size()) {%>
                <form class="col-4 contentProduct" name="product"  action="CartServlet" method="post">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId() %>');">
                        <img src="<%= prd.get(i).getPicture() %>" alt="">
                        <h4><%= prd.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="submit" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prd.get(i).getProductId() %>,'<%= prd.get(i).getProductName() %>',<%= prd.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>
                <% if(i<prd.size()) {%>
                <form class="col-4 contentProduct" name="product"  action="CartServlet" method="post">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId() %>');">
                        <img src="<%= prd.get(i).getPicture() %>" alt="">
                        <h4><%= prd.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId() %>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="submit" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prd.get(i).getProductId() %>,'<%= prd.get(i).getProductName() %>',<%= prd.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>  
                <% if(i<prd.size()) {%>
                <form class="col-4 contentProduct" name="product"  action="CartServlet" method="post">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId() %>');">
                        <img src="<%= prd.get(i).getPicture() %>" alt="">
                        <h4><%= prd.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId() %>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="submit" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prd.get(i).getProductId() %>,'<%= prd.get(i).getProductName() %>',<%= prd.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% } i++;%>  
                <% if(i<prd.size()) {%>
                <form class="col-4 contentProduct" name="product"  action="CartServlet" method="post">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId() %>');">
                        <img src="<%= prd.get(i).getPicture() %>" alt="">
                        <h4><%= prd.get(i).getProductName() %></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice() %></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="submit" value="Thêm vào giỏ hàng" onclick="add_to_cart(<%= prd.get(i).getProductId() %>,'<%= prd.get(i).getProductName() %>',<%= prd.get(i).getPrice() %>)" class="btn">
                    </div>
                </form><% }%> 
            </div>
        <% }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        %>
        <div class="page-btn">
            <ul id="pagination"></ul> <!-- Hiển thị nút chuyển trang -->
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