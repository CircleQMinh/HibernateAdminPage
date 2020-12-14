<%-- 
    Document   : index
    Created on : Nov 20, 2020, 8:52:58 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <script src="js/cart.js" type="text/javascript"></script>
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
                        <li><a href="">Blog</a></li>
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
        <h2 class="title">Featured Products</h2>
        <div class="row">
            <div class="col-4">
                <img src="images/prd4.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd5.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd6.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd7.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-half-o" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
        </div>
        <!--Lastest Products-->
        <h2 class="title">Lastest Products</h2>
        <div class="row">
            <div class="col-4">
                <img src="images/prd4.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd5.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd6.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd7.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-half-o" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <img src="images/prd4.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd5.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd6.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
            <div class="col-4">
                <img src="images/prd7.jpg" alt="">
                <div class="overlay">
                    <input type="button" value="Thêm vào giỏ hàng" class="btn">
                </div>
                <h4>Thuốc A</h4>
                <div class="rating">
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star" ></i>
                    <i class="fa fa-star-half-o" ></i>
                    <i class="fa fa-star-o" ></i>
                </div>
                <p>$50.00</p>
            </div>
        </div>
    </div>
    <!----offer----->
    <div class="offer">
        <div class="small-container">
            <div class="row">
                <div class="col-2">
                    <img src="images/exclusive.jpg" class="offer-img" alt="">
                </div>
                <div class="col-2">
                    <p>Anh Kiều Xưn Dinh</p>
                    <h1>Dược phẩm Kiều Xưn</h1>
                    <small>Lorem ipsum dolor sit amet consectetur adipisicing 
                        elit. Nihil explicabo fuga minus non aliquid totam maiores 
                        numquam eos dolores sit culpa omnis debitis, reiciendis quibusdam 
                        magni dolor aut, quae, nisi id soluta voluptate?</small><br>
                        <button value="Buy Now" class="btn">Buy Now &#10132;</button>
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
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                    Ullam hic dignissimos quisquam sed provident ab dolorum .</p>
                    <i class="fa fa-quote-right"></i>
                    <div class="rating">
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star-half-o" ></i>
                        <i class="fa fa-star-o" ></i>
                    </div>
                    <img src="images/exclusive.jpg" alt="">
                    <h3>Giáo sư Kiều Xuân Vinh</h3>
                </div>
                <div class="col-3">
                    <i class="fa fa-quote-left"></i>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                    Ullam hic dignissimos quisquam sed provident ab dolorum .</p>
                    <i class="fa fa-quote-right"></i>
                    <div class="rating">
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star-half-o" ></i>
                        <i class="fa fa-star-o" ></i>
                    </div>
                    <img src="images/exclusive.jpg" alt="">
                    <h3>Giáo sư Kiều Xuân Vinh</h3>
                </div>
                <div class="col-3">
                    <i class="fa fa-quote-left"></i>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                    Ullam hic dignissimos quisquam sed provident ab dolorum .</p>
                    <i class="fa fa-quote-right"></i>
                    <div class="rating">
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star" ></i>
                        <i class="fa fa-star-half-o" ></i>
                        <i class="fa fa-star-o" ></i>
                    </div>
                    <img src="images/exclusive.jpg" alt="">
                    <h3>Giáo sư Kiều Xuân Vinh</h3>
                </div>
            </div>
        </div>
    </div>
    <!-------- brands ------->
    <div class="brands">
        <div class="small-container">
            <div class="row">
                <div class="col-5">
                    <img src="images/logo2.jpg" alt="">
                </div>
                <div class="col-5">
                    <img src="images/logo3.jpg" alt="">
                </div>
                <div class="col-5">
                    <img src="images/logo4.png" alt="">
                </div>
                <div class="col-5">
                    <img src="images/logo5.png" alt="">
                </div>
                <div class="col-5">
                    <img src="images/logo6.jpg" alt="">
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