/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.*;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author ASUS
 */
public class OrderDAO {
    public static Order getOrder(int id) {

        Transaction transaction = null;
        Order ord = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            ord = (Order) session.get(Order.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return ord;
    }
    
  
    
    public static void saveOrder(Order ord) {
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(ord);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        finally{
            session.close();
        }
    }
    
    public static List < Order > getAllOrders() {

        Transaction transaction = null;
        List < Order > listOfOrders = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfOrders = session.createQuery("from Order").list();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return listOfOrders;
    }
    
    public static void updateEmp(Order ord) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(ord);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    // edit status
    public static void editOrd(int ordID,int status){
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Order ord=(Order)session.get(Order.class, ordID);
        ord.setStatus(status);
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(ord);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }

    public static void deleteOrd(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Order ord = (Order)session.get(Order.class, id);
            if (ord != null) {
                session.delete(ord);
                System.err.println("Delete success");
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    
    public static void deleteAllShippedOrder(){
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        List<Order> listofOrders = getAllOrders();
        Session session = sessionFactory.openSession();
        try{
            transaction = session.beginTransaction();
            
            for(int i =0;i<listofOrders.size();i++){
                if(listofOrders.get(i).getStatus()== 4){
                    Order ord =(Order)session.get(Order.class, listofOrders.get(i).getOrderId());
                    if (ord != null){
                        session.delete(ord);
                        System.err.println("Delete success");
                    }
                }
            }
            transaction.commit();
        }
        catch(Exception e){
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
}
