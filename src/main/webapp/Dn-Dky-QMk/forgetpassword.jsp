<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <h1 style="margin-top: 200px;">Vui lòng nhập Email của bạn</h1>
    <form method="POST" action="send-otp">
            Email: <input name="email" placeholder="" value="${email}"><br> ${emailError} <br>
            <button type="submit" style="width: 100px;background-color: whitesmoke  ;border-radius: 3px;font-family:'Poppins' " >Xác nhận</button>
        </form>
    </center>
</body>
</html>