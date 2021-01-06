/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Account;
/**
 *
 * @author Nhat Minh
 */
public class LogoutController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
        }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        try{
            Account account=(Account)session.getAttribute("account");
            if(account!=null)
            {    
                session.removeAttribute("account");
                session.removeAttribute("userInfo");
                session.invalidate();
                String url="";
                if(account.getType().equals("customer"))
                    url="/index.jsp";
                else if(account.getType().equals("employee"))
                    url="/login-employee";
                else if(account.getType().equals("admin"))
                    url="/login-admin";
                System.out.println("logout ok");
                response.sendRedirect(request.getContextPath()+url);
                    }
            else
                response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
        catch(Exception e)
        {
            System.out.println("logout exception");
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
