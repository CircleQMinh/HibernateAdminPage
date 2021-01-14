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
                <center style="margin-top: 50px;">Đăng nhập</center>
                <form class="input-group" id="login" method="POST" action="login" style="height:300px; ">
                    <input type="text" name="username"  class="input-feild" placeholder="Username:" value="${username}"
                           style="margin-bottom: 10px;"required>${usernameError}
                    <input type="password" name="password"  class="input-feild" placeholder="Mật khẩu:"
                           style="margin-bottom: 10px;"required>${passwordError}
                    <button type="submit" class="submit-btn" style="margin-top: 20px;width: 50%; ">Đăng nhập</button>
                     <a href="forget-password" style="margin-top: 50px;">Quên mật khẩu?</a>
                </form>
            </div>
        </div>
        
    </body>
</html>
