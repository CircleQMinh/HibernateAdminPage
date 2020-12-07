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
        <script src="javascript/jquery-adminpage.js" type="text/javascript"></script>
        <script>
            
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
        <!--Hidden form ở đây-->
        <div class="divform" id="form1" >
            <form >
                <h1>Add a new Employee</h1>
                <label ><strong>Name</strong></label>
                <input type="text" placeholder="Enter Name" name="name" id="name-emp">
                <label ><strong>E-mail</strong></label>
                <input type="text" placeholder="Enter E-mail" name="mail" id="mail-emp">
                <label ><strong>Phone</strong></label>
                <input type="text" placeholder="Enter Phone" name="phone" id="phone-emp">
                <label ><strong>Address</strong></label>
                <input type="text" placeholder="Enter Address" name="address" id="add-emp">
                <label ><strong>Salary</strong></label>
                <input type="text" placeholder="Enter Salary" name="salary" id="salary-emp">
                <label ><strong>Sex</strong></label>
                <select name="sex" id="sex-emp">
                    <option selected>Nam</option>
                    <option>Nữ</option>
                </select><br>
                <button type="button" id="save_emp"><strong>Add</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form1')" ><strong>Close</strong></button>        
            </form>  
        </div> 
        <div class="divform" id="form2" >
            <form >
                <h1>Edit Employee</h1>
                <label ><strong>Name</strong></label>
                <input type="text" placeholder="Enter Name" name="name" id="name-emp-edit">
                <label ><strong>E-mail</strong></label>
                <input type="text" placeholder="Enter E-mail" name="mail" id="mail-emp-edit">
                <label ><strong>Phone</strong></label>
                <input type="text" placeholder="Enter Phone" name="phone" id="phone-emp-edit">
                <label ><strong>Address</strong></label>
                <input type="text" placeholder="Enter Address" name="address" id="add-emp-edit">
                <label ><strong>Salary</strong></label>
                <input type="text" placeholder="Enter Salary" name="salary" id="salary-emp-edit">
                <label ><strong>Sex</strong></label>
                <select name="sex" id="sex-emp-edit">
                    <option selected>Nam</option>
                    <option>Nữ</option>
                </select><br>
                <label ><strong>Paycheck</strong></label>
                <input type="date" id="paycheck-emp-edit" name="paycheck"><br>
                <input type="hidden" id="eid-emp-edit">
                <button type="button" id="edit-emp"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form2')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <div class="divform" id="form3" >
            <form >
                <h1>Edit Employee Attendance</h1>
                <br>
                <label ><strong>Works Day</strong></label>
                <input type="number" id="workdayempatt-edit" name="wd"><br>
                
                <label ><strong>Paycheck</strong></label>
                <input type="date" id="paycheckempatt-edit" name="pay"><br>
                <label ><strong>Last Attendance</strong></label>
                <input type="date" id="lastempatt-edit" name="ld"><br>
                <input type="hidden" id="eidempatt-edit">
                <button type="button" id="editattemp"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form3')" ><strong>Close</strong></button>        
            </form>  
        </div>
        
<!--        // thông báo tải trang -->
        <div class="divwait" id="formwait" >
            <form >
                <h1>Đang tải trang ...</h1>      
            </form>  
        </div>
    </body>
</html>
