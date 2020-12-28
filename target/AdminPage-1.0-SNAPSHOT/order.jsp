<%-- 
    Document   : order
    Created on : Dec 9, 2020, 2:37:45 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Dao.*"%>
<%@page import="Model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <title>Order Page</title>
    </head>
    <body>
        <div class="divchua" id="order">
            <div class="dashbo" id="d1">
                <p>Order</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl" id='employeetag' >
                <p >Unchecked Order <button class="minibtn" id="btnUnck" onclick="miniTable('ordertable','btnUnck')">-</button></p>                    
            </div>
            <div class="searhbar">
                <button class="btn" id="orderrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            List<Order> listOfOrders = OrderDAO.getAllOrdersChuaDuyet();
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
                        <th>Order Info</th>
                        <th colspan="2">Option</th>
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
                                <td><button class="btn" id="ord_edit"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="ord_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
                
                
<!----------------------------------------------------------------------------------------------------------------->
            <div class="dashbosl" id='employeetag' >
                <p >Checked Order <button class="minibtn" id="btnCk" onclick="miniTable('ordertableCk','btnCk')">-</button></p>                    
            </div>
            <div class="searhbar">
                <button class="btn" id="orderrefreshCk" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            listOfOrders = OrderDAO.getAllOrdersDaDuyet();
            %>
            <div id="ordertableCk" class="divtable">                    
                <table id="tableorderCk" class="tabledis">
                    <tr>
                        <th>OrderID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Required Date</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Order Info</th>
                        <th colspan="2">Option</th>
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
                                <td><button class="btn" id="ord_edit_Ck"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="ord_del_Ck" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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




<!----------------------------------------------------------------------------------------------------------------->
            <div class="dashbosl" id='employeetag' >
                <p >Delivering Order <button class="minibtn" id="btnDv" onclick="miniTable('ordertableDv','btnDv')">-</button></p>                    
            </div>
            <div class="searhbar">
                <button class="btn" id="orderrefreshDv" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            List <Object [] > danggiao = OrderDAO.getOrderDangGiao();
            %>
            <div id="ordertableDv" class="divtable">                    
                <table id="tableorderDv" class="tabledis">
                    <tr>
                        <th>OrderID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Required Date</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Shipper Name</th>
                        <th>Order Info</th>
                    </tr>
                    <%               
                    try {          
                            for (Object[] result : danggiao) {
                            Employee emp = (Employee) result[1];
                            Order ord = (Order) result[0];
                            %>
                            <tr>
                                <td><%= ord.getOrderId() %></td>
                                <td><%= ord.getCustomer().getCustomerName()  %></td>
                                <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                <td><%= ord.getOrderAdress() %></td>
                                <td><%= ord.getOrderPhone() %></td>
                                <td><%= emp.getEmployeeName() %></td>
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
                <p >Order History <button class="minibtn" id="btnHis" onclick="miniTable('ordertableHis','btnHis')">-</button></p>                    
            </div>
            <div class="searhbar">
                <button class="btn" id="orderrefreshHis" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            List <Object [] > dagiao = OrderDAO.getOrderDaGiao();
            %>
            <div id="ordertableHis" class="divtable">                    
                <table id="tableorderHis" class="tabledis">
                    <tr>
                        <th>OrderID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Required Date</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Shipper Name</th>
                        <th>Order Info</th>
                    </tr>
                    <%               
                    try {          
                            for (Object[] result : dagiao) {
                            Employee emp = (Employee) result[1];
                            Order ord = (Order) result[0];
                            %>
                            <tr>
                                <td><%= ord.getOrderId() %></td>
                                <td><%= ord.getCustomer().getCustomerName()  %></td>
                                <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                <td><%= ord.getOrderAdress() %></td>
                                <td><%= ord.getOrderPhone() %></td>
                                <td><%= emp.getEmployeeName() %></td>
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
<!--------------------------------------------------------------------------------------------------->
        </div>
        <script>  
            startTime();       
        </script>
    </body>
</html>