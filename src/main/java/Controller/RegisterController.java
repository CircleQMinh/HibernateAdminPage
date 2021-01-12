/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Service.UserService;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Service.SendEmailService;
import Model.Account;
import Model.Customer;
import java.util.Random;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nhat Minh
 */
public class RegisterController extends HttpServlet {

    private SendEmailService sendEmailService = new SendEmailService();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session=request.getSession(true);
        if(session.getAttribute("userEmail")==null)
        {
            RequestDispatcher dp = getServletContext().getRequestDispatcher("/Dn-Dky-QMk/register-sendotp.jsp");
            dp.forward(request, response);
        }
        else
        {
            RequestDispatcher dp = getServletContext().getRequestDispatcher("/Dn-Dky-QMk/register.jsp");
            dp.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) // thiếu trường địa chỉ trên jsp
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String url = "";
        String emailError="";
        HttpSession session = request.getSession(true);
        String action=request.getParameter("action");
        if(action.equals("send-otp"))
        {
            String email = request.getParameter("email");
            if (userService.getAccountByEmail(email) == null) 
            {                
                session.setAttribute("userEmail", email);
                String otpCode=sendOTP(email, session); 
                session.setAttribute("otpCode", otpCode);
                RequestDispatcher dp=getServletContext().getRequestDispatcher("/Dn-Dky-QMk/register.jsp");
                dp.forward(request, response);
            }            
            else 
            {
                emailError="Email Already Assigned For Another Account!";
                request.setAttribute("emailError", emailError);
                request.setAttribute("email", email);
                RequestDispatcher dp=getServletContext().getRequestDispatcher("/Dn-Dky-QMk/register-sendotp.jsp");
                dp.forward(request, response);
            }
        }
        
        else if(action.equals("add-user"))
        {
            //account
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String[] agree = request.getParameterValues("agreeTerms");
            String otp=request.getParameter("otp");
            String OTPcode=(String)session.getAttribute("otpCode");
            String email = (String)session.getAttribute("userEmail");

            //customer information
            String name = request.getParameter("cusName");
            String address = request.getParameter("cusAddress");
            String phone = request.getParameter("cusPhone");
            String sex = request.getParameter("cusGender");
            //Errors
            //String emailError = "";
            String usernameError = "";
            String passwordError = "";
            String phoneError = "";
            String confirmPasswordError = "";
            String agreeError = "";
            String otpError="";
            //validate
            Pattern phonePattern = Pattern.compile("\\d{10}");
            Matcher phoneMatcher = phonePattern.matcher(phone);
            if (agree==null) 
            {
                agreeError = "Must agree to terms and conditions to continue";
                url = "/Dn-Dky-QMk/register.jsp";
            }
            if (!password.equals(confirmPassword)) 
            {
                confirmPasswordError = "Not match with your password";
                url = "/Dn-Dky-QMk/register.jsp";
            }

            if (!phoneMatcher.matches()) 
            {
                phoneError = "Phone number must be 10 digits";
                url = "/Dn-Dky-QMk/register.jsp";
            }
            if (userService.getAccountByUsername(username) != null) //chưa có gmail nào đăng ký
            {
                usernameError = "Username already existed";
                url = "/Dn-Dky-QMk/register.jsp";
            }
            if(!otp.equals(OTPcode))
            {
                otpError="Incorrect! Please check again!";
                url = "/Dn-Dky-QMk/register.jsp";
            }
            /*if (userService.getAccountByEmail(email) != null) 
            {
                emailError = "Email already assigned";
                url = "/Dn-Dky-QMk/register.jsp";
            }*/
            if (url.equals("/Dn-Dky-QMk/register.jsp")) 
            {
                //user's input
                request.setAttribute("username", username);
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("gender", sex);
                //errors
                request.setAttribute("usernameError", usernameError);
                request.setAttribute("passwordError", passwordError);
                request.setAttribute("confirmPasswordError", confirmPasswordError);
                request.setAttribute("emailError", emailError);
                request.setAttribute("phoneError", phoneError);
                request.setAttribute("agreeError", agreeError);
                request.setAttribute("otpError", otpError);
                RequestDispatcher dp = getServletContext().getRequestDispatcher(url);
                dp.forward(request, response);
            } 
            else 
            {            
                Customer customer = new Customer(name, address, phone,email,sex);
                if(!userService.addCustomerInformation(customer))
                    System.out.println("add customer fail");
                int idCus =userService.getCustomerInformationByEmail(email).getCustomerId(); 
                Account account = new Account(username, password, "customer", idCus,"");
                userService.addAccount(account);
                request.setAttribute("cus", customer);
                String thanksMes="<center><h2>Thank you "+customer.getCustomerName()+", for signing up to be our member</center></h2> \n"
                                +"<center><i>We will keep you up to date with our latest products and promotions!</i><center> \n"
                                +"<center>If you need any assistance please contact us at ...</center>\n "
                                +"<center><h4>Sincerely Team16STORE</h4></center>";
                sendEmailService.sendEmail("Thanks for signing up", email, thanksMes);
                url="/Dn-Dky-QMk/thanks.jsp";
                session.invalidate();
                RequestDispatcher dp = getServletContext().getRequestDispatcher(url);
                dp.forward(request, response);
            }
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
}
