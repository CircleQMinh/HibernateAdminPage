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
            String add = request.getParameter("address").trim();
            if(add==""||add==null)
            {
                errorsql="Lỗi : Chưa nhập địa chỉ của khách hàng";
            }
            String phone = request.getParameter("phone").trim();
            if(phone==""||phone==null)
            {
                errorsql="Lỗi : Chưa nhập số điện thoại của khách hàng";
            }
            if(!(phone.matches("^[0-9]*$") && phone.length() > 8)){
                errorsql="Số điện thoại không hợp lệ";
            }
            String mail = request.getParameter("mail").trim();
            if(mail==""||mail==null)
            {
                errorsql="Lỗi : Chưa nhập mail của khách hàng";
            }
            Pattern emailpat;
            emailpat = Pattern.compile("\\S+@gmail.com");
            Matcher emailmat=emailpat.matcher(mail);
            if(!emailmat.matches())
            {
               errorsql="Lỗi : Mail khách hàng không hợp lệ , hãy sử dụng gmail "; 
            }
            String name = request.getParameter("name").trim();
            if(name==""||name==null)
            {
                errorsql="Lỗi : Chưa nhập tên khách hàng";
            }
            String accountid = request.getParameter("accountid").trim();
            if(accountid==""||accountid==null)
            {
                errorsql="Lỗi : Chưa nhập số lượng";
            }
            int intaccountid=0;
            try{
                intaccountid=Integer.valueOf(accountid);
            }
            catch(Exception e){
                errorsql="Lỗi : Số lượng không hợp lệ";
            
            String username = request.getParameter("username").trim();
            if(username==""||username==null)
            {
                errorsql="Lỗi : Chưa nhập tài khoản khách hàng";
            }
            String pass = request.getParameter("pass").trim();
            if(pass==""||pass==null)
            {
                errorsql="Lỗi : Chưa nhập mật khẩu khách hàng";
            }
            
            //Set<Order> oderes = request.getParameter("oder").trim();
            if(errorsql=="")
            { 
                
                try {
              
                        Customer cus = new Customer(name,add,phone,mail,intaccountid,username,pass);
                        CustomerDAO.saveCus(cus);
                        errorsql="Thêm nhân viên thành công";
                    }        
                    catch (Exception a) 
                    {
                        e.printStackTrace();
                        errorsql=String.valueOf(e);
                        errorsql="Không thành công";
                    }
            }
            
        %>
        <p id="msg">
        <%=name%><br>   
        <%=mail%><br>  
        <%=phone%><br>  
        <%=add%><br>  
        <%=intaccountid%><br>  
        <%=username%><br> 
        <%=pass%><br> 
        <%=errorsql%><br>        
        </p>
        <div id="errormsg">
            <%=errorsql%>
        </div>
        <p id="sqlmsg"> <%=errorsql%></p>
    </body>
</html>
