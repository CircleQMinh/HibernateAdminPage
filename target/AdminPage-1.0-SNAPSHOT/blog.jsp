<%-- 
    Document   : blog
    Created on : Dec 7, 2020, 10:59:37 AM
    Author     : ASUS
--%>

<%@page import="Dao.BlogDao"%>
<%@page import="Model.Blog"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List < Blog > listblo=BlogDao.getAllBlog();
    int i=0;
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
        <title>Blog Page</title>
    </head>
    <body>
        <div class="divchua" id="blog">
            <div class="dashbo" id="d1">
                <p>Blog</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl"  >
                 <p >Blog<button class="minibtn" id="btnblog" onclick="miniTable('blogtable','btnblog')">-</button></p>                    
            </div>   
            <div class="searhbar">
                <button class="btn" onclick="openForm('form7open')"><i class="fas fa-plus"></i></button>
                <button class="btn" id="blogrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="blogsearchbar" type="text" class="myInput" onkeyup="FilterTable('tableblog','blogsearchbar','blogrefresh','blogselect')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="blogselect">
                    <option value="0" >ID</option>
                    <option value="1" selected>Name</option>
                </select>
            </div>
            <div id="blogtable" class="divtable">                    
                <table id="tableblog" class="tabledis">
                    <tr>
                        <th>BID</th>
                        <th>Name</th>
                        <th>Content</th>
                        <th>Picture</th>
                        <th colspan="2">Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listblo.size()) {
                            Blog blo=listblo.get(i);
                            %>
                            <tr>
                                <td><%=blo.getBlogId()%></td>
                                <td><%=blo.getBlogName()%></td>
                                <td><%=blo.getBlogContent()%></td>                                
                                <td><img src="<%=blo.getPicture()%>" class="blogimg"></td>
                                <td><button class="btn" id="blog_edit"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="blog_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
