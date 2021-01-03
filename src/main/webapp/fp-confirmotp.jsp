<%-- 
    Document   : fp-confirmotp
    Created on : Jan 3, 2021, 3:17:01 PM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find Password</title>
        <link rel="stylesheet" href="css/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body style=" background: linear-gradient(to right,#ffad063b,#ff105fb0);font-family: 'Poppins', sans-serif;">
        <center>
            <h1 style="margin-top: 200px;">Submit Your Code</h1>       
            <form method="POST" action="check-otp">
                OTP Code : <input name="otp" placeholder="" >${otpError} <br>           
                <button type="submit" style="width: 100px;background-color: whitesmoke  ;border-radius: 3px;font-family:'Poppins' " >Submit</button>
            </form>
        </center>
    </body>
</html>
