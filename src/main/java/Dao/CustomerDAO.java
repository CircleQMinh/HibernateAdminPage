/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import Model.Customer;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author KHOAPHAN
 */
public class CustomerDAO {
    
    //
    public static Customer getCus(int id){
        Transaction transaction = null;
        Customer cus = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try   {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            cus = (Customer) session.get(Customer.class, id);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return cus;
    }
    
    
    //
    public static List < Customer > getAllCus() {

        Transaction transaction = null;
        List < Customer > listOfcus = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfcus = session.createQuery("from Customer ").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfcus;
    }
    
    ////////////////////////////////////////////////
    public static void updateCus(Customer cus) { //edit toàn bộ các cột trong customer
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(cus);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        finally{
            session.close();
        }
    }
    ////////////////////////////////////////////////
    
    
    
    /////////////////////////////////////////////////////////
     // edit 1 số cột
    public static void editCus(Integer customerId, String CustomerName, String address, String phone, String email,String sex){
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Customer cus=(Customer)session.get(Customer.class, customerId);   
        cus.setCustomerName(CustomerName);
        cus.setAddress(address);
        cus.setPhone(phone);
        cus.setEmail(email);
        cus.setSex(sex);
        
        
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(cus);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        finally{
            session.close();
        }
    }
    ////////////////////////////////
    
    
     public static void deleteCus(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Customer cus = session.get(Customer.class, id);
            if (cus != null) {
                session.delete(cus);

            }

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    
    //
    public static void saveCus(Customer cus) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(cus);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
}
