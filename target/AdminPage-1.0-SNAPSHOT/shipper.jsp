<%-- 
    Document   : shipper
    Created on : Dec 24, 2020, 7:05:42 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery-shipper-page.js" type="text/javascript"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <!------------------------------------------>
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="topnav" >  
            <a> <i class="fas fa-sign-out-alt"></i></a>
            <a style="margin-right: 23.5%;font-family: Showcard Gothic,serif;width: 30%">Shipping Order</a>
        </div>
        <nav>
            <button title="Visit Dashboard" id="dashboard"><i class="fas fa-home"></i></button>
            <button title="View Account"  id = 'acc-setting'><i class="fas fa-key"></i></button>
            <button title="View Order" id = 'order-view'><i class="fas fa-tasks"></i></button>
            <button title="Logout" ><i class="fas fa-sign-out-alt"></i></button>
        </nav>
        <div class="divcontent" id="home" > 
            <div class="divchua" id="employee">
                <div class="dashbo" id="d1">
                    <p>Shipping</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
            </div>
        </div>
    </body>
</html>
