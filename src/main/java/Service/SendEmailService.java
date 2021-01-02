/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Nhat Minh
 */
public class SendEmailService {
    public boolean sendEmail(String SUBJECT,String TO,String MESSAGECONTENT)
    {
        boolean flag=false;
        String from="minh15randommail@gmail.com";
        //variable for gmail
        String host="smtp.googlemail.com";
        //System properties
        System.out.println("above Properties set ");
        Properties properties=System.getProperties();        
        System.out.println("Properties set ok");
        //SETTING IMPORTANT INFORMATION FOR PROPERTIES Obj
        
        //host set
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        System.out.println("host set ok");
        //step1: get session
        Session session= Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){ // dùng để đăng nhập gmail
                return new PasswordAuthentication("minh15randommail@gmail.com","sphinxkbb4"); //check pls
            }
        });
        System.out.println("session getinstance ok");
        session.setDebug(true);
        
        //step2: set message
        MimeMessage message= new MimeMessage(session);
        System.out.println("mime mes set ok");
        try {
            //from
            message.setFrom(from);
            //to
            message.setRecipients(Message.RecipientType.TO, TO);
            //content
            String[] languages={"vietnamese","english","french"};
            message.setSubject(SUBJECT);
            message.setText(MESSAGECONTENT);
            message.setContentLanguage(languages);
        //step3: send email
            Transport.send(message);           
        } 
        catch (MessagingException e) 
        {
            System.out.println(e);
            return false;
            
        }       
        return true;
    }
}

