<%-- 
    Document   : ajax-edit-blog
    Created on : Dec 16, 2020, 5:55:53 AM
    Author     : KHOAPHAN
--%>

<%@page import="Dao.BlogDao"%>
<%@page import="java.sql.Date"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.EmployeeDao"%>
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
            String errorsql="";
            String bid=request.getParameter("bid").trim();          
            String name = request.getParameter("name").trim();
            if(name==""||name==null)
            {
                errorsql="Lỗi : Chưa nhập tên blog";
            }
            String content = request.getParameter("content").trim();
            if(content==""||content==null)
            {
                errorsql="Lỗi : Chưa nhập content cho blog";
            }
            String url = request.getParameter("url").trim();
            if(url==""||url==null)
            {
                errorsql="Lỗi : Chưa chọn ảnh";
            }
            
            if(errorsql=="")
            {
                try{
                    int intbid=Integer.valueOf(bid);
                    BlogDao.editBlog(intbid, name, content, url);                   
                    errorsql="Chỉnh sửa thành công";
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
            <p><%=bid%></p>
            <p><%=name%></p>
            <p><%=url%></p>
            <p><%=content%></p>           
        </div>
    </body>
</html>
