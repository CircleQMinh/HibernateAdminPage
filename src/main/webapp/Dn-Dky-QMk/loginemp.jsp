<%-- 
    Document   : adminlogin
    Created on : Dec 19, 2020, 1:35:28 PM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Login </title>  
<link rel="stylesheet" href="css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>   
Body {  
  font-family: 'Poppins', sans-serif;  
  background: linear-gradient(to right,#ff105fad,#0681ff5e);  
}  
button {   
        background-color: #924caf87;   
        width: 100%;  
        color: black;   
        padding: 15px 100px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
        border-radius: 2px;
         }   
 form {   
        border: 0px solid #f1f1f1;   
        padding: 0px 500px;
        
    }   
 input[type=text], input[type=password] {   
        width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
    }  
 button:hover {   
        opacity: 0.7;   
    }   
  .cancelbtn {   
        width: auto;   
        padding: 10px 18px;  
        margin: 10px 5px;  
    }   
        
     
 .container {   
        padding: 25px;   
        background-color: lightblue;  
    }   
</style>   
</head>    
<body>    
    <center> <h1> Employee </h1> </center>   
    <form  id="login" method="POST" action="login-employee">  
        <div class="container">   
            <label>Username : ${usernameError}</label>   
            <input type="text" placeholder="Enter Username" name="username" value="${username}" required>
            <label>Password : ${passwordError}</label>   
            <input type="password" placeholder="Enter Password" name="password"  required> 
            <button type="submit" >LOGIN</button>   
            <a href="<c:url value="/forget-password"></c:url>" style="color: #333">Forgot your password?</a> 
        </div>   
    </form>     
</body>     
</html>  