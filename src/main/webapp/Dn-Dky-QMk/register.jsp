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
        <link rel="stylesheet" href="<c:url value="/Dn-Dky-QMk/style-login.css"></c:url>"> 
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="js/cart.js" type="text/javascript"></script>    
        </head>
        <body>
            <div class="box">

                <div class="inner-box">

                <form action="register?action=add-user" method="post"> 
                        <h2>SignUp Now</h2>
                <input type="text" name="cusName" placeholder="Your Full Name" required="" value="${name}"><br>
                <input type="text" name="username" placeholder="Username" required="" value="${username}"><small>${usernameError}</small><br>
                <input type="text" name="cusPhone" placeholder="Phone" required="" value="${phone}"><small>${phoneError}</small><br>
                    <div>
                        <input type="radio" name="cusGender" value="Nam" checked> Male
                        <input type="radio" name="cusGender" value="Nữ" <c:if test="${gender=='Nữ'}">checked</c:if>>Female
                        <input type="text" name="otp" style="width: 150px; margin-left: 81px;" placeholder="Your OTP Code"><small style="float:right">${otpError}</small><br>
                    </div>
                        <input type="email" name="email" placeholder="Email Address" required="" value="${sessionScope.userEmail}" disabled=""><br>
                    <div>    
                        <input type="password" name="password" placeholder="Password" style="width:40%;"required=""><small>${passwordError}</small>
                        <input type="password" name="confirmPassword" placeholder="Confirm Password" style="width:40%;float:right;" required="">
                        <small><center>${confirmPasswordError}</center></small><br>
                    </div>
                        <input type="text" name="cusAddress" style="height: 150px;" placeholder="Address" value="${address}"><small>${addressError}</small><br>
                        <input type="checkbox" name="agreeTerms"style="color: red"><span>Agree to terms and conditions</span>
                        <center><small>${agreeError}</small></center><br>                         
                        <input type="submit" value="SignUp">
                        <p style="text-align:center;">
                            <span>Already Registered ? </span><a class="link" href="login">Sign In</a>
                        </p>
                </form>


            </div>

        </div>    
        <!--<form action="register" method="post" style="background: radial-gradient(#fff,#ffd6d6)">
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
<center>Agree to terms and conditions</center><br> 
<center>${agreeError}</center><br>        
<center> <button type="submit "class="btn-lrg submit-btn">Register</button>    </center>    
</div>         
</div>
</form>-->
    </body>
</html>
