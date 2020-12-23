<%-- 
    Document   : ajax-edit-ord
    Created on : Dec 9, 2020, 9:39:04 PM
    Author     : ASUS
--%>
<%@page import="java.sql.Date"%>
<%@page import="Model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String errorsql = "";
            String eid=request.getParameter("eid").trim();
            String status = request.getParameter("status").trim();
            if(errorsql=="")
            {
                try{
                    int inteid=Integer.valueOf(eid);
                    int intstt=Integer.valueOf(status);
                    OrderDAO.editOrd(inteid, intstt);
                    errorsql="Chỉnh sửa thành công";
                    if (intstt == 4){
                        OrderDAO.deleteOrd(inteid);
                        errorsql = "Chỉnh sửa và xóa thành công";
                    }
                }
                catch(Exception e)
                {
                    errorsql="Lỗi DAO";
                }

            }
        %>
        <p id="sqlmsg"> <%=errorsql%></p>
        <div id="debug">
            <p><%=errorsql%></p>
            <p><%=eid%></p>
            <p><%=status%></p>

        </div>
    </body>
</html>
