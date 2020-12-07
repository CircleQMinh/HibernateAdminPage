<%-- 
    Document   : dashboard
    Created on : Dec 7, 2020, 8:17:55 AM
    Author     : ASUS
--%>



<%@page import="java.util.List"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.EmployeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Business Manager Overview </title>
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                startTime();
//                các nút chuyển trang
                $('#dashboard').click(function(){
                     $("#home").load( "dashboard.jsp #ds", function() {
                         startTime();
                    });
                });
                $('#emppage').click(function(){
                     $("#home").load( "employee.jsp #employee", function() {
                         startTime();
                    });
                });
                $('#propage').click(function(){
                     $("#home").load( "product.jsp #product", function() {
                         startTime();
                    });
                });
                $('#cuspage').click(function(){
                     $("#home").load( "customer.jsp #customer", function() {
                         startTime();
                    });
                });
                $('#accpage').click(function(){
                     $("#home").load( "account.jsp #account", function() {
                         startTime();
                    });
                });
                $('#salespage').click(function(){
                     $("#home").load( "sales.jsp #sales", function() {
                         startTime();
                    });
                });
                $('#blogpage').click(function(){
                     $("#home").load( "blog.jsp #blog", function() {
                         startTime();
                    });
                });
                $('#stapage').click(function(){
                     $("#home").load( "statistic.jsp #statistic", function() {
                         startTime();
                    });
                });
            });
        </script>
        
    </head>
    <body>
        <div class="topnav" >
            
            <a> <i class="fas fa-sign-out-alt"></i></a>
            <a style="margin-right: 23.5%;font-family: Showcard Gothic,serif;width: 30%">Business Manager Overview </a>
        </div>
        <nav>
            <button title="Visit Dashboard" id="dashboard"><i class="fas fa-home"></i></button>
            <button title="View Employee" id="emppage"><i class="fas fa-id-card"></i></button>
            <button title="View Product"  id = 'propage'><i class="fas fa-shopping-bag"></i></button>
            <button title="View Customer"  id = 'cuspage'><i class="fas fa-users"></i></button>
            <button title="View Account"  id = 'accpage'><i class="fas fa-key"></i></button>
            <button title="View Sales" id = 'salespage'><i class="fas fa-money-check-alt"></i></button>
            <button title="View Blog" id = 'blogpage'><i class="fab fa-blogger"></i></button>
            <button title="View Statistic" id="stapage"><i class="fas fa-chart-line"></i></button>
            <button title="Logout" ><i class="fas fa-sign-out-alt"></i></button>
        </nav>
        <!--        Dashboard code ở đây-->
        <div class="divcontent" id="home">            
            <div class="divchua" id="ds">
                <div class="dashbo" id="d1">
                    <p>Dashboard</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
                <div class="card">
                    <p><i class="fas fa-user-tie"></i></p>
                    <h3>2</h3>
                    <p>Admin</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-id-card"></i></p>
                    <h3>55</h3>
                    <p>Employee</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-money-bill-wave"></i></p>
                    <h3>10</h3>
                    <p>Paycheck</p>   
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-envelope-square"></i></p>
                    <h3>3</h3>
                    <p>Mail</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fa fa-user"></i></p>
                    <h3>11</h3>
                    <p>Customer</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fa fa-check"></i></p>
                    <h3>25</h3>
                    <p>Order</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-tshirt"></i></p>
                    <h3>128</h3>
                    <p>Product</p>   
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-comment-dollar"></i></p>
                    <h3>3</h3>
                    <p>Sales</p>
                    <a>View</a>
                </div>

            </div>
        </div>
    </body>
</html>
