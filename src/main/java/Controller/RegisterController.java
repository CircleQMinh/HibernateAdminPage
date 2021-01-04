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

/**
 *
 * @author Nhat Minh
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    private SendEmailService sendEmailService = new SendEmailService();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        RequestDispatcher dp = getServletContext().getRequestDispatcher("/register.jsp");
        dp.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String url = "";
        //account
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String confirmPassword = request.getParameter("confirmPassword");
        String[] agree = request.getParameterValues("agreeTerms");
        //customer information
        String name = request.getParameter("cusName");
        String address = request.getParameter("cusAddress");
        String phone = request.getParameter("cusPhone");
        String sex = request.getParameter("cusGender");
        //Errors
        String emailError = "";
        String usernameError = "";
        String passwordError = "";
        String phoneError = "";
        String confirmPasswordError = "";
        String agreeError = "";

        //validate
        Pattern phonePattern = Pattern.compile("\\d{10}");
        Matcher phoneMatcher = phonePattern.matcher(phone);
        if (agree==null) 
        {
            agreeError = "Must agree to terms and conditions to continue";
            url = "/register.jsp";
        }
        if (!password.equals(confirmPassword)) 
        {
            confirmPasswordError = "Not Match";
            url = "/register.jsp";
        }

        if (!phoneMatcher.matches()) 
        {
            phoneError = "Phone number must be 10 digits";
            url = "/register.jsp";
        }
        if (userService.getAccountByUsername(username) != null) //chưa có gmail nào đăng ký
        {
            usernameError = "Username already existed";
            url = "/register.jsp";
        }
        if (userService.getAccountByEmail(email) != null) 
        {
            emailError = "Email already assigned";
            url = "/register.jsp";
        }
        System.out.println(url);
        System.out.println(name+" "+address+" "+phone+" "+email+" "+sex);
        if (url.equals("/register.jsp")) 
        {
            //user's input
            request.setAttribute("username", username);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
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
            RequestDispatcher dp = getServletContext().getRequestDispatcher(url);
            dp.forward(request, response);
        } 
        else 
        {            
            Customer customer = new Customer(name, address, phone,email,sex);
            if(!userService.addCustomerInformation(customer))
                System.out.println("add customer fail");
            int idCus =userService.getCustomerInformationByEmail(email).getCustomerId(); // sai 
            Account account = new Account(username, password, "customer", idCus,"");
            userService.addAccount(account);
            request.setAttribute("cus", customer);
            String thanksMes="Thank you "+customer.getCustomerName()+", for signing up to be our member \n"
                            +"We will keep you up to date with our latest products and promotions! \n"
                            +"If you need any assistance please contact us at ...\n "
                            +"Sincerely Team16STORE";
            sendEmailService.sendEmail("Thanks for signing up", email, thanksMes);
            url="/login";
            response.sendRedirect(request.getContextPath()+url);
        }

    }
}