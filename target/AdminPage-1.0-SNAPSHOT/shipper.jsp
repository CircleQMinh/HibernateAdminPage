<%-- 
    Document   : shipper
    Created on : Dec 24, 2020, 7:05:42 PM
    Author     : ASUS
--%>

<%@page import="Dao.EmployeeDao"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.OrderDAO"%>
<%@page import="Model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href='https://fonts.googleapis.com/css?family=Fredoka One' rel='stylesheet'>
        <!------------------------------------------>
        <title>Shipper Page</title>
        
    </head>
    <body>
        <c:if test="${(sessionScope.account==null) || (sessionScope.account.type=='customer')}">
            <c:redirect url="login-employee"></c:redirect>
        </c:if>
        <%
                Employee emp = (Employee)request.getSession().getAttribute("userInfo");
                int shipperID=emp.getEmployeeId();  
        
        %>
        
        
        
        <input type="hidden" id="shipperid" value="<%=emp.getEmployeeId()      %>">
        <div class="topnav" >  
            <a href="logout"> <i class="fas fa-sign-out-alt"></i></a>
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
                <div class="dashbosr" >
                    <p style="font-family: sans-serif"> Nhân viên đang đăng nhập : <%=emp.getEmployeeName()     %></p>
                </div>
                <div class="dashbosl" id='employeetag' >
                    <p >My Order<button class="minibtn" id="btnAdd" onclick="miniTable('myordertable','btnAdd')">-</button></p>                    
                </div>
                <div class="searhbar">
                    <button class="btn" id="myorder-refresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                </div>
                <%
                     List<Order> myOrder = OrderDAO.getAllMyOrders(shipperID);
                
                %>
                <div id="myordertable" class="divtable">                    
                    <table id="tablemyorder" class="tabledis">
                        <tr>
                            <th>OrderID</th>
                            <th>Customer Name</th>
                            <th>Order Date</th>
                            <th>Required Date</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th >Product Info</th>
                            <th colspan="2">Option</th>
                        </tr>
                        <%               
                        try {          
                                int i=0;
                                while (i< myOrder.size()) {
                                Order ord= myOrder.get(i);
                                %>
                                <tr>
                                    <td><%= ord.getOrderId() %></td>
                                    <td><%= ord.getCustomer().getCustomerName()  %></td>
                                    <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                    <td><%= ord.getOrderAdress() %></td>
                                    <td><%= ord.getOrderPhone() %></td>
                                    <td>
                                        <table class="tablediss">
                                            <%
                                                try 
                                                {
                                                    int j=0;
                                                    List<?> prolist = OrderDAO.getProductListofOrder(ord.getOrderId());
                                                    while(j<prolist.size())
                                                    {
                                                        Object[] row = (Object[])prolist.get(j);
                                                    %>
                                                    <tr>
                                                        <td><%=row[1]%></td>
                                                        <td><img src="<%=row[3]%>" class="productimg"></td>
                                                        <td><%=row[4]%></td>
                                                        <%j++;%>
                                                    </tr>
                                                    <% }
                                                }
                                                catch(Exception e)
                                                {
                                                
                                                }
                                            %>
                                        </table>
                                    </td>
                                    <td><button class="btn" id="order-complete" style=" background-color: green;"><i class="fas fa-check"></i></button></td>
                                    <td><button class="btn" id="order-remove" style=" background-color: red;"><i class="fas fa-times"></i></button></td>
                                    <%i++;%>
                                </tr>                   
                                <%}
                            }        
                            catch (Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
                    <!------------------------------------------------------------------------------------------>
                
                <div class="dashbosl" id='employeetag' >
                    <p >List of Order<button class="minibtn" id="btnAd" onclick="miniTable('ordertable','btnAd')">-</button></p>                    
                </div>
                <div class="searhbar">
                    <button class="btn" id="new-order-refresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                </div>
                <%
//                OrderDAO.deleteAllShippedOrder();
                List<Order> listOfOrders = OrderDAO.getAllOrdersDaDuyet();
                %>
                <div id="ordertable" class="divtable">                    
                    <table id="tableorder" class="tabledis">
                        <tr>
                            <th>OrderID</th>
                            <th>Customer Name</th>
                            <th>Order Date</th>
                            <th>Required Date</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th colspan="1">Product Info</th>
                            <th>Option</th>
                        </tr>
                        <%               
                        try {          
                                int i=0;
                                while (i<listOfOrders.size()) {
                                Order ord=listOfOrders.get(i);
                                %>
                                <tr>
                                    <td><%= ord.getOrderId() %></td>
                                    <td><%= ord.getCustomer().getCustomerName()  %></td>
                                    <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                    <td><%= ord.getOrderAdress() %></td>
                                    <td><%= ord.getOrderPhone() %></td>    
                                    <td>
                                        <table class="tablediss">
                                            <%
                                                try 
                                                {
                                                    int j=0;
                                                    List<?> prolist = OrderDAO.getProductListofOrder(ord.getOrderId());
                                                    while(j<prolist.size())
                                                    {
                                                        Object[] row = (Object[])prolist.get(j);
                                                    %>
                                                    <tr>
                                                        <td><%=row[1]%></td>
                                                        <td><img src="<%=row[3]%>" class="productimg"></td>
                                                        <td><%=row[4]%></td>
                                                        <%j++;%>
                                                    </tr>
                                                    <% }
                                                }
                                                catch(Exception e)
                                                {
                                                
                                                }
                                            %>
                                        </table>
                                    </td>
                                    
                                    <td><button class="btn" id="order-acc" style=" background-color: red;"><i class="fas fa-check"></i></button></td>                         
                                    <%i++;%>
                                </tr>                   
                                <%}
                            }        
                            catch (Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div> 
                    <!----------------------------------------------------------------------------------->
                <div class="dashbosl" id='employeetag' >
                    <p >Order History<button class="minibtn" id="btnAddd" onclick="miniTable('orderhistable','btnAddd')">-</button></p>                    
                </div>
                <div class="searhbar">
                    <button class="btn" id="old-order-refresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                </div>
                <%
//                OrderDAO.deleteAllShippedOrder();
                List<Order> History = OrderDAO.getAllMyOrdersHistory(shipperID);
                %>
                <div id="orderhistable" class="divtable">                    
                    <table id="tablehisorder" class="tabledis">
                        <tr>
                            <th>OrderID</th>
                            <th>Customer Name</th>
                            <th>Order Date</th>
                            <th>Required Date</th>
                            <th>Shipped Date</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th colspan="1">Product Info</th>
                        </tr>
                        <%               
                        try {          
                                int i=0;
                                while (i<History.size()) {
                                Order ord=History.get(i);
                                %>
                                <tr>
                                    <td><%= ord.getOrderId() %></td>
                                    <td><%= ord.getCustomer().getCustomerName()  %></td>
                                    <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getShippedDate()) %></td>
                                    <td><%= ord.getOrderAdress() %></td>
                                    <td><%= ord.getOrderPhone() %></td>
                                    <td>
                                        <table class="tablediss">
                                            <%
                                                try 
                                                {
                                                    int j=0;
                                                    List<?> prolist = OrderDAO.getProductListofOrder(ord.getOrderId());
                                                    while(j<prolist.size())
                                                    {
                                                        Object[] row = (Object[])prolist.get(j);
                                                    %>
                                                    <tr>
                                                        <td><%=row[1]%></td>
                                                        <td><img src="<%=row[3]%>" class="productimg"></td>
                                                        <td><%=row[4]%></td>
                                                        <%j++;%>
                                                    </tr>
                                                    <% }
                                                }
                                                catch(Exception e)
                                                {
                                                
                                                }
                                            %>
                                        </table>
                                    </td>                  
                                    <%i++;%>
                                </tr>                   
                                <%}
                            }        
                            catch (Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
            </div>  
        </div>
        <div class="divwait" id="formwait" >

        </div>
        <script>
            startTime();
        </script>
    </body>
</html>
