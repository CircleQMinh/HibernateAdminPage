<%-- 
    Document   : login
    Created on : Nov 20, 2020, 8:57:46 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <div class="hero">
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="login()">Log In</button>
                    <button type="button" class="toggle-btn" onclick="register()">Register</button>
                </div>               
                <form class="input-group" id="login" method="POST" action="">
                    <input type="text" name="" id="" class="input-feild" placeholder="User Id" required>
                    <input type="password" name="" id="" class="input-feild" placeholder="Enter Password" required>
                    <input type="checkbox" class="check-box"><span>Remember Me</span>
                    <button type="submit" class="submit-btn">Log in</button>
                </form>
                <form class="input-group" id="register" method="POST" action="">
                    <input type="text" name="" id="" class="input-feild" placeholder="User Id" required>
                    <input type="email" name="" id="" class="input-feild" placeholder="Email" required>
                    <input type="password" name="" id="" class="input-feild" placeholder="Enter Password" required>
                    <input type="password" name="" id="" class="input-feild" placeholder="Enter Password Repeat" required>
                    <input type="checkbox" class="check-box"><span>I agree to the terms & consitions</span>
                    <button type="submit" class="submit-btn">Register</button>
                </form>
            </div>
        </div>
        <script>
            var x=document.getElementById("login");
            var y=document.getElementById("register");
            var z=document.getElementById("btn");
            function register(){
                x.style.left="-400px";
                y.style.left="50px";
                z.style.left="110px";
            }
            function login(){
                x.style.left="50px";
                y.style.left="450px";
                z.style.left="0px";
            }
        </script>
    </body>
</html>
