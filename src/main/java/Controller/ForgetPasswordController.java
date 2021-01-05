/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AccountDao;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Service.UserService;import Service.SendEmailService;
import Model.Account;

/**
 *
 * @author Nhat Minh
 */

public class ForgetPasswordController extends HttpServlet {

    private SendEmailService sendEmailService = new SendEmailService();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (request.getRequestURI().endsWith("/forget-password")) {
            RequestDispatcher dp = request.getServletContext().getRequestDispatcher("/forgetpassword.jsp");
            dp.forward(request, response);
        } else if (request.getRequestURI().endsWith("/check-otp")) {

            if(session.getAttribute("userEmail")==null)
                response.sendRedirect(request.getContextPath()+"/forget-password");
            else
            {
                RequestDispatcher dp = request.getServletContext().getRequestDispatcher("/fp-confirmotp.jsp");
                dp.forward(request, response);
            }            
        } else if (request.getRequestURI().endsWith("/change-password")) 
        {
            if(session.getAttribute("otpCode")==null)
                response.sendRedirect(request.getContextPath()+"/check-otp");
            else
            {
                RequestDispatcher dp = request.getServletContext().getRequestDispatcher("/fp-changepassword.jsp");
                dp.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //uri
        String uri = request.getRequestURI();       
        //set errors
        String emailError="";
        String otpError="";
        String passwordError="";
        HttpSession session = request.getSession(true);
        if (uri.endsWith("/send-otp"))  
        {
            String email = request.getParameter("email");
            if (userService.getAccountByEmail(email) != null) 
            {                
                session.setAttribute("userEmail", email);
                String otpCode=sendOTP(email, session);
                session.setAttribute("otpCode", otpCode); 
                response.sendRedirect(request.getContextPath()+"/check-otp");
            }            
            else 
            {
                emailError="No Email Found!";
                request.setAttribute("emailError", emailError);
                request.setAttribute("email", email);
                RequestDispatcher dp=getServletContext().getRequestDispatcher("/forgetpassword.jsp");
                dp.forward(request, response);
            }
        }
        else if(uri.endsWith("/check-otp")) 
        {
            String inputOTP=request.getParameter("otp");
            String OTPcode=(String)session.getAttribute("otpCode");
            if(inputOTP.equals(OTPcode))
                response.sendRedirect(request.getContextPath()+"/change-password");
            else
            {
                otpError="Incorrect code! Please check again!";
                request.setAttribute("otpError", otpError);
                RequestDispatcher dp=getServletContext().getRequestDispatcher("/fp-confirmotp.jsp");
                dp.forward(request, response);
            }
        }
        else if(uri.endsWith("/change-password"))
        {
            String newPassword=request.getParameter("newPassword");
            String email=(String)(session.getAttribute("userEmail"));
            Account account=userService.getAccountByEmail(email); 
            account.setPassword(newPassword);
            AccountDao.updateAcc(account);
            session.invalidate();
            response.sendRedirect(request.getContextPath()+"/login");
        }
    }

    public String sendOTP(String email, HttpSession session) {
        //create OTP digits
        int otp = new Random().nextInt(999999);
        System.out.println(otp + "email:" + email);       
        //send OTP digits
        String msgContent = "Your OTP code =" + otp;
        boolean flag = this.sendEmailService.sendEmail("OTP Confirmation code from TEAM16", email, msgContent); //(subject,to,content)
        if (flag) {
            return ""+otp;
        } else {
            return "fail";
        }

    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}