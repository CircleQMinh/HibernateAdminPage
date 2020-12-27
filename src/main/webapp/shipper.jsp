<%-- 
    Document   : shipper
    Created on : Dec 24, 2020, 7:05:42 PM
    Author     : ASUS
--%>

<%@page import="Dao.OrderDAO"%>
<%@page import="Model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
//        Hiện tại xài cứng 1 nhân viên , làm đăng nhập thì lấy int này từ session
        int shipperID=1;
        
    
    
    %>
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
                            <th colspan="1">Product Info</th>
                             <th>Option</th>
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
                                    <td>
                                        <table class="tabledis">
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
                                                        <td><%=row[0]%></td>
                                                        <td><img src="<%=row[2]%>" class="productimg"></td>
                                                        <td><%=row[3]%></td>
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
                            <th>Status</th>
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
                                    <%
                                    if (ord.getStatus()==1){
                                    %>
                                        <td>Chưa duyệt</td>
                                    <%
                                    }
                                    else if (ord.getStatus()==2){
                                    %>
                                        <td>Đã duyệt</td>
                                    <%
                                    }                                    
                                    %>
                                    <td>
                                        <table class="tabledis">
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
                                                        <td><%=row[0]%></td>
                                                        <td><img src="<%=row[2]%>" class="productimg"></td>
                                                        <td><%=row[3]%></td>
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
            </div>  
        </div>
        <script>
            startTime();
        </script>
    </body>
</html>
