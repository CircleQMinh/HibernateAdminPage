<%-- 
    Document   : ajax-insert-customer
    Created on : Dec 13, 2020, 9:29:48 PM
    Author     : KHOAPHAN
--%>
<%@page import="java.util.Set"%>
<%@page import="Model.Order"%>
<%@page import="Dao.CustomerDAO"%>
<%@page import="Model.Customer"%>
<%@page import="Dao.CategoryDao"%>
<%@page import="Dao.EmployeeDao"%>
<%@page import="Model.Employee"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="mycssadminpage.css" type="text/css">
        <script src="testjavascript.js" type="text/javascript"></script>
        <style>
            .tabledis{
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            margin-left: 1%;
            margin-bottom: 1%;
            font-size: 14px;
        }
        .tabledis td,th{
            border: 1px solid #ddd;
            padding: 8px;
        }
        .tabledis tr:nth-child(even){background-color: #f2f2f2;}
        .tabledis tr:hover{background-color: #ddd;}
        .tabledis th{
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            background-color: DodgerBlue;
            border: none; 
            color: white; 
            padding: 12px 16px;
            font-size: 12px; 
            cursor: pointer;
            margin-left: 1%;
            margin-bottom: 1%;
          }
        </style>
        <script>
            
            
        </script>
        <title>Testing</title>
    </head>
    <body>
        <%
            String errorsql="";
            String cid=request.getParameter("cid").trim();
            String aid=request.getParameter("accountid").trim();
            /*String accountid = request.getParameter("accountid ").trim();         
            if(accountid ==""||accountid ==null)
            {
                errorsql="Lỗi : Chưa nhập ID của tài khoản";
            }
            try{
                int accountidint =Integer.parseInt(accountid);  
                if(accountidint<0)
                {
                    errorsql="Lỗi : ID của tài khoản không hợp lệ (phải lớn hơn 0)";
                }
            }
            catch(Exception e)
            {
                errorsql="Lỗi : ID của tài khoản không hợp lệ (nhập số)";
            }*/
            String add = request.getParameter("address").trim();
            if(add==""||add==null)
            {
                errorsql="Lỗi : Chưa nhập địa chỉ người dùng";
            }
            String phone = request.getParameter("phone").trim();
            if(phone==""||phone==null)
            {
                errorsql="Lỗi : Chưa nhập số điện thoại người dùng";
            }
            if(!(phone.matches("^[0-9]*$") && phone.length() > 8)){
                errorsql="Số điện thoại không hợp lệ";
            }
            String mail = request.getParameter("mail").trim();
            if(mail==""||mail==null)
            {
                errorsql="Lỗi : Chưa nhập mail người dùng";
            }
            Pattern emailpat;
            emailpat = Pattern.compile("\\S+@gmail.com");
            Matcher emailmat=emailpat.matcher(mail);
            if(!emailmat.matches())
            {
               errorsql="Lỗi : Mail nhân viên không hợp lệ , nhập sử dụng gmail "; 
            }
            String name = request.getParameter("name").trim();
            if(name==""||name==null)
            {
                errorsql="Lỗi : Chưa nhập tên nhân viên";
            }
            String username = request.getParameter("username").trim();
            if(username==""||username==null)
            {
                errorsql="Lỗi : Chưa nhập tên nhân viên";
            }
            
            String pass = request.getParameter("pass").trim();
            if(pass==""||pass==null)
            {
                errorsql="Lỗi : Chưa nhập tên nhân viên";
            }
                      
           
            if(errorsql=="")
            {
                try{
                    int inteid=Integer.valueOf(cid);
                    int intaid=Integer.valueOf(aid);
                        CustomerDAO.editCus(inteid, name, add, phone, mail, intaid, username, pass);
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
            <p><%=cid%></p>
            <p><%=name%></p>
            <p><%=aid%></p>
            <p><%=mail%></p>
            <p><%=phone%></p>
            <p><%=add%></p>
            <p><%=username%></p>
            <p><%=pass%></p>
        </div>
    </body>
</html>
