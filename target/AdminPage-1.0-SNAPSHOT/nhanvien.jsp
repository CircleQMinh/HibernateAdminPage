<%-- 
    Document   : nhanvien
    Created on : Dec 24, 2020, 7:05:14 PM
    Author     : ASUS
--%>

<%@page import="Dao.EmployeeDao"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
//           Hiện tại xài cứng 1 nhân viên , làm đăng nhập thì lấy int này từ session
        int EmployeeID=1;
        Employee me = EmployeeDao.getEmployee(EmployeeID);
    
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <script src="javascript/jquery-nvpage.js" type="text/javascript"></script>
        <link href='https://fonts.googleapis.com/css?family=Fredoka One' rel='stylesheet'>
        <!------------------------------------------>
        <title>Employee Page</title>
    </head>
    <body>
        <div class="topnav" >
            
            <a> <i class="fas fa-sign-out-alt"></i></a>
            <a style="margin-right: 23.5%;font-family: Showcard Gothic,serif;width: 30%">Business Manager Overview </a>
        </div>
        <nav>
            <button title="View Product"  id = 'propage'><i class="fas fa-shopping-bag"></i></button>
            <button title="View Order" id = 'orderpage'><i class="fas fa-tasks"></i></button>
            <button title="View Blog" id = 'blogpage'><i class="fab fa-blogger"></i></button>
            <button title="Logout" ><i class="fas fa-sign-out-alt"></i></button>
        </nav>
        
        <div class="divcontent" id="home">            
            <div class="divchua" id="ds">
                <div class="dashbo" id="d1">
                    <p>Dashboard</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
            </div>
        </div>
        <div class="divcontent" id="home">            
            <div class="divchua" id="ds">

            </div>
        </div>
        <div class="divform" id="updateOrder" >
            <form >
                <h1>Update Order Status</h1>
                <br>
                <label ><strong>Order ID</strong></label>
                <input type="number" id="orderid-edit" name="wd"><br>
                
                <label ><strong>Status</strong></label>
                <select name="orderStatus" id="order-status">
                    <option selected value="1">Chưa duyệt</option>
                    <option value="2">Đã duyệt</option>
                </select><br>
                <button type="button" id="editorder_status"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('updateOrder')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <div class="divform" id="form7open" style="max-width: 80%">
            <div class="divformupanh" id="form7" style="display: block">
                <form >
                    <h1>Add Product</h1>
                    <br>
                    <label ><strong>Name</strong></label>
                    <input type="text" placeholder="Enter Name" name="name" id="name-pro-add">
                    <label ><strong>Mô tả sản phẩm</strong></label><br>
                    <textarea name="mota" cols="50" rows="3" id="mota-pro-add" ></textarea><br>
                    <label ><strong>Price</strong></label>
                    <input type="text" placeholder="Enter Price" name="phone" id="price-pro-add">
                    <label ><strong>Quantity</strong></label>
                    <input type="text" placeholder="Enter Quantity" name="address" id="qua-pro-add">
                    <label ><strong>Catagory</strong></label><br>
                    <input type="text" list="category-pro" id="category-pro-add" />
                    <datalist id="category-pro">
                        <option selected>Dược liệu</option>
                        <option>Thực phẩm chức năng</option>
                        <option >Cao dược liệu</option>
                        <option>Trà cốm thuốc</option>
                    </datalist>
                    <input type="hidden" id="url-pro-add" readonly>
                          
                </form>  
            </div>
            <div class="divupanhupanh" id="form7upanh" style="display: block">
                <form action="" method="post" enctype="multipart/form-data" onsubmit="" id="uploaded-pro-form">
                <fieldset>
                    <legend><b>Upload Picture</b></legend>
                        <input type="hidden" name="upload_preset" readonly value="v0q5hczm" max="10">
                     <p>
                    <label >Select your photo:
                        <input type="file" name="file" accept="image/*" onchange="AJAXSubmit('uploaded-pro-form'); return false;"></label>
                      </p>
                      <img id="uploaded-pro" class="productimgupload" src="https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607672014/1_kkeis8.png">
                </fieldset>
                <button type="button" id="save_pro"><strong>Add</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form7open')" ><strong>Close</strong></button> 
                </form>
            </div>
        </div>
        <div class="divform" id="form7edit" style="max-width: 80%">
            <div class="divformupanh" id="form7" style="display: block">
                <form >
                    <h1>Edit Product</h1>
                    <br>
                    <label ><strong>Name</strong></label>
                    <input type="text" placeholder="Enter Name" name="name" id="name-pro-edit">
                    <label ><strong>Mô tả sản phẩm</strong></label><br>
                    <textarea name="mota" cols="50" rows="3" id="mota-pro-edit" ></textarea><br>
                    <label ><strong>Price</strong></label>
                    <input type="text" placeholder="Enter Price" name="phone" id="price-pro-edit">
                    <label ><strong>Quantity</strong></label>
                    <input type="text" placeholder="Enter Quantity" name="address" id="qua-pro-edit">
                    <label ><strong>Catagory</strong></label><br>
                    <input type="text" list="category-pro" id="category-pro-edit" />
                    <datalist id="category-pro">
                        <option selected>Dược liệu</option>
                        <option>Thực phẩm chức năng</option>
                        <option >Cao dược liệu</option>
                        <option>Trà cốm thuốc</option>
                    </datalist>
                    <input type="text" id="url-pro-edit" readonly>
                    <input type="hidden" id="id-pro-edit" readonly>      
                </form>  
            </div>
            <div class="divupanhupanh" id="form7upanh" style="display: block">
                <form action="" method="post" enctype="multipart/form-data" onsubmit="" id="uploaded-pro-form-edit">
                <fieldset>
                    <legend><b>Upload Picture</b></legend>
                        <input type="hidden" name="upload_preset" readonly value="v0q5hczm" max="10">
                     <p>
                    <label >Select your photo:
                        <input type="file" name="file" accept="image/*" onchange="AJAXSubmit_edit_product('uploaded-pro-form-edit'); return false;"></label>
                      </p>
                      <img id="uploaded-pro-edit" class="productimgupload" >
                </fieldset>
                <button type="button" id="edit_pro"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form7edit')" ><strong>Close</strong></button> 
                </form>
            </div>
        </div>
        <div class="divwait" id="formwait" >

        </div>
    </body>
</html>
