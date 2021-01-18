<%-- 
    Document   : customer-account
    Created on : Dec 23, 2020, 2:21:51 AM
    Author     : Nhat Minh
--%>

<%@page import="Model.Customer"%>
<%@page import="Model.Order"%>
<%@page import="Dao.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <%
        String msg = (String)request.getAttribute("msg"); 
        
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Account</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/styles/metro/notify-metro.css" />
        <script src="js/cart.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <style>
            body {
                background: radial-gradient(#fff,#ffd6d6);
                padding-top: 85px;
                width: 100%;
                height: 100%;
            }
/*            h1 {
                font-family: 'Poppins', sans-serif, 'arial';
                font-weight: 600;
                font-size: 72px;
                color: white;
                text-align: center;
            }*/
            h4 {
                font-family: 'Roboto', sans-serif, 'arial';
                font-weight: 400;
                font-size: 20px;
                color: #9b9b9b;
                line-height: 1.5;
            }
            .divorderinfo {
            justify-content: center;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 17px;
            display: none;
            position: fixed;
            bottom: 1%;
            right: 2%;
            border: 3px solid #f1f1f1;
            z-index: 9;
            background-color: #7ca7eb;
            max-width: 40%;
            min-width: 30%;
            overflow-y: scroll;
            max-height: 80%;

            }
            .btn-000{
            background-color: DodgerBlue;
            border: none; 
            color: white; 
            padding: 12px 16px;
            font-size: 12px; 
            cursor: pointer;
            margin-left: 1%;
            margin-bottom: 1%;
            float: left;
            }
            .dashbosr{
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
               font-size: 20px;
               width: 100%;
               height: 50%;
               background-color: #e1eaf7;
               text-align: right;
               margin-bottom: 1%;   
               padding-top: 5px;
            }
        </style>
        
        <script>
            <%
                if(msg==null){
                    
                }
                else{%>
                  alert('<%=msg%>')  ;
                <%}
            %>
                function notify() {
                    $.notify("Hủy đơn hàng thành công", "success");
                }
                function notify_fail() {
                    $.notify("Hủy đơn hàng thất bại", "success");
                }
            $(document).ready(function(){
                $("button[id|='ord_info'").click(function(){
                    var id =$(this).closest('tr').find('td').eq(0).text();
                    $.ajax({
                        type: "post",
                        url: "ajax/order/ajax-view-order-info.jsp", //this is my servlet
                        data: {
                            ID:id               
                        },
                        success: function ( response ){   
                            //handleData(response);
                            var success =  $($.parseHTML(response)).filter("#info").html();
                            $("#order-info-form").html(success);
                        },
                        error: function(xhr, textStatus, error){
                            console.log(xhr.statusText);
                            console.log(textStatus);
                            console.log(error);
                            console.log("Fail");
                            notify_fail();
                        }
                    });
                     openForm("order-info-form");
                });
                $("button[id|='order-remove']").click(function(){
                    if(confirm('bạn có chắc muốn hủy đơn hàng này?')){
                        var id =$(this).closest('tr').find('td').eq(0).text();
                        var temp=$(this).closest('tr').find('td');
                        $.ajax({
                        type: "post",
                        url: "ajax/order/ajax-edit-ord.jsp", //this is my servlet
                        data: {
                            eid: id,
                            status: 6
                        },
                        success: function ( response ){   
                            //handleData(response);
                            var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                            console.log(success); // div#success
                            notify();
                            temp.hide();
                        },
                        error: function(xhr, textStatus, error){
                            console.log(xhr.statusText);
                            console.log(textStatus);
                            console.log(error);
                        }
                    });
                    }
                });
                
            });       
        </script>
    </head>
    <body >
        <c:if test="${(sessionScope.account==null)}">
            <c:redirect url="/Dn-Dky-QMk/login.jsp"></c:redirect>
        </c:if>
        <div class="header">
            <div class="container">
                <div class="navbar">
                    <div class="gogo">
                        <img src="images/logo-default.jpg" width="125px" alt=""/>
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="index.jsp">Trang chủ</a></li>
                            <li><a href="products.jsp">Sản phẩm</a></li>
                            <li><a href="aboutus.jsp">Liên hệ</a></li>
                            <li><a href="myblog.jsp">Blog</a></li>
                            <li><a href="account-info.jsp">Tài khoản</a></li>
                                <c:choose>
                                    <c:when test="${sessionScope.account==null}" >
                                    <li><a href="login" class="btn-login">Đăng nhập</a></li>
                                    <li><a href="register" class="btn-register">Đăng ký</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${sessionScope.account.type=='customer'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.customerName}"/></a></li>
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                            </c:when>
                                            <c:when test="${sessionScope.account.type=='employee'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.employeeName}"/></a></li>                                   
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                            </c:when>  
                                            <c:otherwise>
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.name}"/></a></li>
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </nav>
                    <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" class="imgcard"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                </div>

            </div>
        </div>
    <c:if test="${sessionScope.account.type=='customer'}">
        <%
                Customer cus = (Customer)request.getSession().getAttribute("userInfo");
                List<Order> listOfOrders = OrderDAO.getAllOrdersByUserID(cus.getCustomerId());
        
        %>
        <h4 class="myarticle-title">Thông tin của tôi</h4>
        <article class="myarticle">
            <p>Tên : ${sessionScope.userInfo.customerName}</p>
            <p>Email : ${sessionScope.userInfo.email}</p>
            <p>Điện thoại : ${sessionScope.userInfo.phone}</p>
            <p>Địa chỉ : ${sessionScope.userInfo.address}</p>
            <p>Giới tính : ${sessionScope.userInfo.sex}</p>
            <p>Tài khoản : ${sessionScope.userInfo.money} </p>
        </article>
        <h4 class="myarticle-title">Tùy chọn</h4>
        <button class="btn" onclick="openForm('Modal-password')" style="margin-left: 3%">Thay đổi mật khẩu</button>
        <button class="btn" onclick="openForm('Modal-info')">Thay đổi thông tin</button>
        <h4 class="myarticle-title">Lịch sử giao dịch</h4>
        <div id="customerhistory" class="divtable">                    
            <%
                if(listOfOrders.size()!=0){
            %>
            <table id="tablehistory" class="tabledis">
                <tr>
                    <th>OrderID</th>
                    <th>Tình trạng</th>
                    <th>Ngày đặt</th>
                    <th>Ngày yêu cầu</th>
                    <th>Ngày nhận</th>
                    <th>Thanh toán</th>
                    <th>DS sản phẩm</th>
                    <th>Hủy đơn hàng</th>
                </tr>
                <%               
                try {          
                        int i=0;
                        while (i<listOfOrders.size()) {
                        Order ord=listOfOrders.get(i);
                        %>
                        <tr style="">
                            <td><%= ord.getOrderId() %></td>
                            <td><%= OrderDAO.returnStatus(ord.getStatus())  %></td>
                            <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                            <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                            <td><%= OrderDAO.returnDate(ord.getShippedDate()) %></td>
                            <td><%= ord.getPaymentType()            %></td>
                            <td>
                                <button class="btn-000" id="ord_info">Xem danh sách sản phẩm</button>
                            </td> 
                            <td style="text-align:left;"><% if(ord.getStatus()!=4) {%><button class="btn" id="order-remove" style=" background-color: red;"><i class="fas fa-times"></i></button><% } %></td>
                            <%i++;%>
                        </tr>                   
                        <%}
                    }        
                    catch (Exception e)
                    {
                        e.printStackTrace();
                    }
                %>
                <%}else{%>
                <div id="tablehistory">
                   <div class="dashbo" id="d1">
                        <p>Không có lịch sử được lưu lại</p>
                    </div>
                </div>
                <%}%>
            </table>
        </div>
        <div id="Modal-password" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-password')">&times;</span>
                <p>Thay đổi mật khẩu</p>
                <form id="new-password" action="NewPassword" method="post">
                    <input type="hidden" value="${sessionScope.account.accountId}" name="Id">
                    <p>Username :</p>
                    <input type="text" name="user-name" readonly="true" value="${sessionScope.account.username}" required="true">
                    <p>Mật khẩu hiện tại : </p>
                    <input type="text" name="cur-pass" required="true">
                    <p>Mật khẩu mới : </p>
                    <input type="text" name="new-pass" required="true"><br>
                    
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        <div id="Modal-info" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-info')">&times;</span>
                <p>Thay đổi info</p>
                <form id="new-info" action="NewInfo" method="post">
                    <input type="hidden" value="customer" name="type">
                    <p> Tên :</p>
                    <input type="text" name="name" value="${sessionScope.userInfo.customerName}" required="true">
                    <p> Email : </p>
                    <input type="text" name="email" value="${sessionScope.userInfo.email}" required="true">
                    <p> Điện thoại : </p>
                    <input type="text" name="phone" value="${sessionScope.userInfo.phone}" required="true">
                    <p> Địa chỉ : </p>
                    <input type="text" name="address" value="${sessionScope.userInfo.address}" required="true">
                    <p> Giới  tính</p>
                    <select name="sex" id="sex">
                        <option selected value="1">Nam</option>
                        <option>Nữ</option>
                    </select><br>
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>    
    </c:if>
    <c:if test="${sessionScope.account.type=='employee'}">
        <h4 class="myarticle-title">My info</h4>
        <article class="myarticle">
            <p>Name : ${sessionScope.userInfo.employeeName}</p>
            <p>Email : ${sessionScope.userInfo.email}</p>
            <p>Phone : ${sessionScope.userInfo.phone}</p>
            <p>Gender : ${sessionScope.userInfo.sex}</p>
        </article>
        <h4 class="myarticle-title">Option</h4>
        <button class="btn" onclick="location.href='nhanvien.jsp'"  style="margin-left: 3%">Đến trang nhân viên</button>
        <button class="btn" onclick="location.href='shipper.jsp'" >Đến trang giao hàng</button>
        <button class="btn" onclick="openForm('Modal-password')">Thay đổi mật khẩu</button>
        <button class="btn" onclick="openForm('Modal-info')">Thay đổi thông tin</button>
        <div id="Modal-password" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-password')">&times;</span>
                <p>Thay đổi mật khẩu</p>
                <form id="new-password" action="NewPassword" method="post">
                    <input type="hidden" value="${sessionScope.account.accountId}" name="Id">
                    <p>Username :</p>
                    <input type="text" name="user-name" readonly="true" value="${sessionScope.account.username}" required="true">
                    <p>Mật khẩu hiện tại : </p>
                    <input type="text" name="cur-pass" required="true">
                    <p>Mật khẩu mới : </p>
                    <input type="text" name="new-pass" required="true"><br>
                    
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        <div id="Modal-info" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-info')">&times;</span>
                <p>Thay đổi info</p>
                <form id="new-info" action="NewInfo" method="post">
                    <input type="hidden" value="employee" name="type">
                    <p> Tên :</p>
                    <input type="text" name="name" value="${sessionScope.userInfo.employeeName}" required="true">
                    <p> Email : </p>
                    <input type="text" name="email" value="${sessionScope.userInfo.email}" required="true">
                    <p> Điện thoại : </p>
                    <input type="text" name="phone" value="${sessionScope.userInfo.phone}" required="true">
                    <p> Địa chỉ : </p>
                    <input type="text" name="address" value="${sessionScope.userInfo.address}" required="true">
                    <p> Giới  tính</p>
                    <select name="sex" id="sex">
                        <option selected value="1">Nam</option>
                        <option>Nữ</option>
                    </select><br>
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
    </c:if>
    <c:if test="${sessionScope.account.type=='admin'}">
        <h4 class="myarticle-title">My info</h4>
        <article class="myarticle">
            <p>Name : ${sessionScope.userInfo.name}</p>
            <p>Email : ${sessionScope.userInfo.email}</p>
            <p>Phone : ${sessionScope.userInfo.phone}</p>
            <p>Gender : ${sessionScope.userInfo.sex}</p>
        </article>
        <h4 class="myarticle-title">Option</h4>
        <button class="btn" onclick="location.href='dashboard.jsp'"  style="margin-left: 3%">Đến trang quản lý</button>
        <button class="btn" onclick="openForm('Modal-password')">Thay đổi mật khẩu</button>
        <button class="btn" onclick="openForm('Modal-info-admin')">Thay đổi thông tin</button>
        <div id="Modal-password" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-password')">&times;</span>
                <p>Thay đổi mật khẩu</p>
                <form id="new-password" action="NewPassword" method="post">
                    <input type="hidden" value="${sessionScope.account.accountId}" name="Id">
                    <p>Username :</p>
                    <input type="text" name="user-name" readonly="true" value="${sessionScope.account.username}" required="true">
                    <p>Mật khẩu hiện tại : </p>
                    <input type="text" name="cur-pass" required="true">
                    <p>Mật khẩu mới : </p>
                    <input type="text" name="new-pass" required="true"><br>
                    
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        <div id="Modal-info-admin" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeForm('Modal-info-admin')">&times;</span>
                <p>Thay đổi info</p>
                <form id="new-info" action="NewInfo" method="post">
                    <input type="hidden" value="admin" name="type">
                    <input type="hidden" value="admin" name="address">
                    <p> Tên :</p>
                    <input type="text" name="name" value="${sessionScope.userInfo.name}" required="true">
                    <p> Email : </p>
                    <input type="text" name="email" value="${sessionScope.userInfo.email}" required="true">
                    <p> Điện thoại :</p>
                    <input type="text" name="phone" value="${sessionScope.userInfo.phone}" required="true">
                    <p> Giới  tính</p>
                    <select name="sex" id="sex">
                        <option selected value="1">Nam</option>
                        <option>Nữ</option>
                    </select><br>
                    <input type="submit" value="OK" class="btn" style="width: 100px">
                </form>
            </div>
        </div>
        
    </c:if>
        <div class="divorderinfo" id="order-info-form" >

        </div>
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Dowload Our App</h3>
                        <p>Download App for Android and ios mobie phone</p>
                        <div class="app-logo">
                            <img src="images/playstore.png" alt="">
                            <img src="images/appstore.png" alt="">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="images/logo-default-2.jpg" alt=""/>
                        <p>Our Purpose Is To Sustainably Make the Pleasure and
                            Benefits of Sports Accessible to the Many
                        </p>

                    </div>
                    <div class="footer-col-3">
                        <h3>Userful Links</h3>
                        <ul>
                            <li>Khoa Phan</li>
                            <li>Minh Mâm</li>
                            <li>Đông Thân</li>
                            <li>Nhật Minh</li>
                        </ul>
                    </div>
                    <div class="footer-col-3">
                        <h3>Follow us</h3>
                        <ul>
                            <li>Coupns</li>
                            <li>Blog Post</li>
                            <li>Instagram</li>
                            <li>Youtube</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2020 - DongThan</p>
            </div>
        </div>
</body>
</html>
