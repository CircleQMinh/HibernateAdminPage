<%-- 
    Document   : register
    Created on : Dec 21, 2020, 10:14:11 AM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | Register</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/cart.js" type="text/javascript"></script>    
        <style>
            body {
                background: radial-gradient(#fff,#ffd6d6);
                padding-top: 85px;
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

            /* ///// inputs /////*/

            input:focus ~ label, textarea:focus ~ label, input:valid ~ label, textarea:valid ~ label {
                font-size: 0.75em;
                color: #999;
                top: -5px;
                -webkit-transition: all 0.225s ease;
                transition: all 0.225s ease;
            }

            .styled-input {
                float: left;
                width: 293px;
                margin: 1rem 0;
                position: relative;
                border-radius: 4px;
            }

            @media only screen and (max-width: 768px){
                .styled-input {
                    width:100%;
                }
            }

            .styled-input label {
                color: #999;
                padding: 1.3rem 30px 1rem 30px;
                position: absolute;
                top: 10px;
                left: 0;
                -webkit-transition: all 0.25s ease;
                transition: all 0.25s ease;
                pointer-events: none;
            }

            .styled-input.wide { 
                width: 650px;
                max-width: 100%;
            }

            input,
            textarea {
                padding: 30px;
                border: 0;
                width: 100%;
                font-size: 1rem;
                background-color: #2d2d2d;
                color: white;
                border-radius: 4px;
            }

            input:focus,
            textarea:focus { outline: 0; }

            input:focus ~ span,
            textarea:focus ~ span {
                width: 100%;
                -webkit-transition: all 0.075s ease;
                transition: all 0.075s ease;
            }

            textarea {
                width: 100%;
                min-height: 15em;
            }

            .input-container {
                width: 650px;
                max-width: 100%;
                margin: 20px auto 25px auto;
            }

            .submit-btn {
                float: right;
                padding: 7px 35px;
                border-radius: 60px;
                display: inline-block;
                background-color: #4b8cfb;
                color: white;
                font-size: 18px;
                cursor: pointer;
                box-shadow: 0 2px 5px 0 rgba(0,0,0,0.06),
                    0 2px 10px 0 rgba(0,0,0,0.07);
                -webkit-transition: all 300ms ease;
                transition: all 300ms ease;
            }

            .submit-btn:hover {
                transform: translateY(1px);
                box-shadow: 0 1px 1px 0 rgba(0,0,0,0.10),
                    0 1px 1px 0 rgba(0,0,0,0.09);
            }

            @media (max-width: 768px) {
                .submit-btn {
                    width:100%;
                    float: none;
                    text-align:center;
                }
            }

            input[type=checkbox] + label {
                color: #ccc;
                font-style: italic;
            } 

            input[type=checkbox]:checked + label {
                color: #f00;
                font-style: normal;
            }
        </style>
    </head>
    <body>
        <!-- header -->
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
                            <li><a href="login">Blog</a></li>
                            <li><a href="customer-account.jsp">Account</a></li>
                            <c:choose>
                                <c:when test="${sessionScope.account==null}" >
                                    <li><a href="" class="btn-login">Log In</a></li>
                                    <li><a href="" class="btn-register">Register</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="" class="btn-login"><c:out value="${sessionScope.account.username}"/></a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>
                    <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" class="imgcard"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                </div>

            </div>
        </div>
        <!-- end header -->       
        <form action="register" method="post" style="background: #ccc">
            <div class="container">
                <div class="row">
                    <h1 style="text-align:center;color :red" >♥</h1>
                </div>

                <div class="row input-container">
                    <div style="width:100%;">
                        <div class="styled-input" style="width:100%;">
                            <input type="text" name="username"required value="${username}"/>
                            <label>Username ${usernameError}</label> 
                        </div>
                    </div>
                        
                    <div>
                        <div class="col-md-6 col-sm-12" style="float: left">
                            <div class="styled-input" style="float:right;">
                                <input type="password" name="password" required />
                                <label>Password ${passwordError}</label> 
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12" style="float: right">
                            <div class="styled-input" style="float:right;">
                                <input type="password" name="confirmPassword" required />
                                <label>Confirm Password ${confirmPasswordError}</label> 
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="cusName" value="${name}"required/> 
                            <label>Name</label> 
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="email" name="email" value="${email}"required/> 
                            <label>Email ${emailError}</label> 
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="cusPhone" value="${phone}"required /> 
                            <label>Phone ${phoneError}</label> 
                        </div>
                    </div>
                        <div style="width:40%; float:left;">
                            <input type="radio" name="cusGender" class="gender"  value="Nam" checked ><center>Male</center>
                        </div>
                        <div style="width:40%; float:right;">
                            <input type="radio" name="cusGender" class="gender"  value="Nữ" 
                                   <c:if test="${gender=='Nữ'}">checked</c:if>><center>Female</center>
                        </div>                         
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="cusAddress" value="${address}" style="height: 250px;"required >
                            <label>Address</label> 

                        </div>
                    </div>                

                    <div class="col-xs-12">
                        <input type="checkbox" name="agreeTerms"style="color: red">
                        Agree to terms and conditions ${agreeError}<br>        
                        <center> <button type="submit "class="btn-lrg submit-btn">Register</button>    </center>    
                    </div>         
                </div>
        </form>
    </body>
</html>
