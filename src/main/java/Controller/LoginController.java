/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CustomerDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import Model.Account;import Model.Customer;import Model.Admin;import Model.Employee;
import Service.UserService;

/**
 *
 * @author Nhat Minh
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login","/login/admin","/login/employee"})
public class LoginController extends HttpServlet {    

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = "";
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) // nếu session đang ko có account
        {
            if (request.getRequestURI().endsWith("/admin")) {
                page = "/loginadmin.jsp";
            } else if (request.getRequestURI().endsWith("/employee")) {
                page = "/loginemp.jsp";
            } else if (request.getRequestURI().endsWith("/login")) {
                page = "/login.jsp";
            }
           RequestDispatcher dp = getServletContext().getRequestDispatcher(page);
            dp.forward(request, response);           
        } else {
            RequestDispatcher dp = getServletContext().getRequestDispatcher("/index.jsp");
            dp.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        System.out.println(uri);
        String url = "";
        String userName = request.getParameter("username");
        String password = request.getParameter("password");        
        
        String userNameError = "";
        String passwordError = "";
        if (uri.endsWith("/login")) { // login as customer
            
            if (userName.equals("") || password.equals(""))
            {
                if (userName.equals("")) {
                    userNameError = "Username must not be empty";
                }                
                if (password.equals("")) {
                    passwordError = "Password must not be empty";
                }
                url = "/login.jsp";
            } else {
                try {                    
                    Account account = userService.getAccountByUsername(userName);
                    
                    if (account != null) //có tồn tại username
                    {   
                        if (account.getPassword().equals(password)) // đúng password
                        {
                            Object userInfo=Object.class;
                            if(account.getType().equals("customer"))
                                userInfo=(Customer)userService.getAccountInformation(account);
                            else if(account.getType().equals("employee"))
                                userInfo =(Employee)userService.getAccountInformation(account);
                            else if(account.getType().equals("admin"))
                                userInfo =(Admin)userService.getAccountInformation(account);
                            HttpSession session = request.getSession();
                            session.setAttribute("account", account);
                            session.setAttribute("userInfo", userInfo);
                            url = "/index.jsp";
                        } else {
                            passwordError = "Wrong Password";
                            url = "/login.jsp";
                        }
                    } 
                    else // ko tồn tại username
                    {
                        userNameError = "Username Not Found";
                        url = "/login.jsp";
                    }                    
                } catch (Exception e) {
                    System.out.println("customer Login Exception ");
                }                
            }
        } 
        else if(uri.endsWith("employee")) 
        {
             if (userName.equals("") || password.equals("")) // empty tk or mk
            {
                if (userName.equals("")) {
                    userNameError = "Username must not be empty";
                }                
                if (password.equals("")) {
                    passwordError = "Password must not be empty";
                }
                url = "/login.jsp";
            } 
            else {
                try {                    
                    Account account = userService.getAccountAdminEmployeeByUsername(userName);
                    if (account != null) //có tồn tại username
                    {
                        if (account.getPassword().equals(password)) // đúng password
                        {
                            Object userInfo = null;
                            if(account.getType().equals("employee"))
                                userInfo =(Employee)userService.getAccountInformation(account);
                            else if(account.getType().equals("admin"))
                                userInfo =(Admin)userService.getAccountInformation(account);
                            HttpSession session = request.getSession();
                            session.setAttribute("account", account);
                            session.setAttribute("userInfo", userInfo);
                            url="/nhanvien.jsp";
                        } else {
                            passwordError = "Wrong Password";
                            url = "/loginemp.jsp";
                        }
                    } else // ko tồn tại username
                    {
                        userNameError = "Username Not Found";
                        url = "/loginemp.jsp";
                    }                    
                } catch (Exception e) {
                    System.out.println("employee Login Exception ");
                }                
            }
        }
        else if (uri.endsWith("admin")) //login as admin
        {
            if (userName.equals("") || password.equals("")) 
            {
                if (userName.equals("")) {
                    userNameError = "Username must not be empty";
                }                
                if (password.equals("")) {
                    passwordError = "Password must not be empty";
                }
                url = "/login.jsp";
            } 
            else {
                try {                    
                    Account account = userService.getAccountAdminByUsername(userName);
                    if (account != null) //có tồn tại username
                    {
                        if (account.getPassword().equals(password)) // đúng password
                        {
                            Object userInfo = (Admin)userService.getAccountInformation(account);
                            HttpSession session = request.getSession();
                            session.setAttribute("account", account);
                            session.setAttribute("userInfo", userInfo);
                            url="/dashboard.jsp";
                        } else {
                            passwordError = "Wrong Password";
                            url = "/loginadmin.jsp";
                        }
                    } else // ko tồn tại username
                    {
                        userNameError = "Username Not Found";
                        url = "/loginadmin.jsp";
                    }                    
                } catch (Exception e) {
                    System.out.println("Admin Login Exception ");
                }                
            }
        }
        if(url.startsWith("/login"))
        {
            request.setAttribute("usernameError", userNameError);
            request.setAttribute("passwordError", passwordError);
            RequestDispatcher dp=getServletContext().getRequestDispatcher(url);
            dp.forward(request, response);
        }
        else 
        {
            response.sendRedirect(request.getContextPath()+url);
        }
        
        
    }
    
}