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
            <div class="searhbar">
                <button class="btn" id="orderrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="ordsearchbar" type="text" class="myInput" onkeyup="FilterTable('tableorder','ordsearchbar','orderrefresh','ordselect')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="ordselect">
                    <option value="0" >EID</option>
                    <option value="1" selected>Customer Name</option>
                    <option value="5">Status</option>
                </select>
            </div>
            <%
          //  OrderDAO.deleteAllShippedOrder();
            List<Order> listOfOrders = OrderDAO.getAllOrders();
            %>
            <div id="ordertable" class="divtable">                    
                <table id="tableorder" class="tabledis">
                    <tr>
                        <th>OrderID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Required Date</th>
                        <th>Status</th>
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
                                else if (ord.getStatus()==3){
                                %>
                                    <td>Đang giao</td>
                                <%
                                }
                                else if (ord.getStatus()==4){
                                %>
                                    <td>Đã giao</td>
                                <% } %>
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
        </div>
        <script>  
            startTime();       
        </script>
    </body>
</html>