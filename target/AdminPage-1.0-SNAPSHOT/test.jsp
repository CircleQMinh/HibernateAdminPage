<%-- 
    Document   : test
    Created on : Dec 14, 2020, 12:01:08 PM
    Author     : ASUS
--%>

<%@page import="Model.Account"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.AccountDao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List <Object [] > listEmpAcc=AccountDao.getAllEmpAccount();
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            for (Object[] result : listEmpAcc) {
                Employee emp = (Employee) result[0];
                Account acc = (Account) result[1];
                %>
                <p><%=emp.getEmployeeName()%>  </p>
                <p><%=acc.getUsername()%>  </p>
            <%    
            }
            %>
        
        

    </body>
</html>
