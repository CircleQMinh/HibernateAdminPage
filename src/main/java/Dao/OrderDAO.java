/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import Model.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            ord = (Order) session.get(Order.class, id);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return ord;
    }
    
    public static Order getOrderByStatus(int status,int id){
        Transaction transaction = null;
        List<Order> ord =null;
        String query = "from Order ord where ord.status = :ord_status";
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        System.out.println("Startb get order");
        try {
            transaction = session.beginTransaction();
            ord = session.createQuery(query).setParameter("ord_status",status).getResultList();
            transaction.commit();
            session.close();
            }
        catch (Exception e){
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        System.out.println(ord.size());
        for(int i=0;i<ord.size();i++){
            System.out.println(ord.get(i).toString());
            if(ord.get(i).getCustomer().getCustomerId()==id)
                return ord.get(i);
        }
        return null;
    }
    
    public static void saveOrder(Order ord) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(ord);
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
    
    public static List < Order > getAllOrders() {

        Transaction transaction = null;
        List < Order > listOfOrders = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfOrders = session.createQuery("from Order f ORDER BY f.status").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfOrders;
    }
    public static List < Order > getAllMyOrders(int id) {

        Transaction transaction = null;
        List < Order > listOfOrders = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfOrders = session.createQuery("from Order o where o.shipperId="+String.valueOf(id)).list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfOrders;
    }
    public static void updateEmp(Order ord) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(ord);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    // edit status
    public static void editOrd(int ordID,int status){
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
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
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }

    public static void deleteOrd(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
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
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    
    public static void deleteAllShippedOrder(){
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
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
            transaction.commit();session.close();
        }
        catch(Exception e){
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
    }
    public static List < Order > getAllOrdersDaDuyet() {

        Transaction transaction = null;
        List < Order > listOfOrders = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfOrders = session.createQuery("from Order o where o.status=2").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfOrders;
    }
    public static List < Order > getAllOrdersChuaDuyet() {

        Transaction transaction = null;
        List < Order > listOfOrders = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfOrders = session.createQuery("from Order o where o.status=1").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfOrders;
    }
    public static List < Order > getAllOrdersDangGiao() {

        Transaction transaction = null;
        List < Order > listOfOrders = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfOrders = session.createQuery("from Order o where o.status=3").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfOrders;
    }
    public static List < Order > getAllOrdersDaGiao() {

        Transaction transaction = null;
        List < Order > listOfOrders = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfOrders = session.createQuery("from Order o where o.status=4").list();

            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfOrders;
    }
    public static List < ? > getProductListofOrder(int id){
        Transaction transaction = null;
        List < ? > listOfRev = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfRev = session.createQuery("Select d.product.productName,d.product.category,d.product.picture,d.quantityOrdered from Orderdetail d where d.order.id="+String.valueOf(id)).list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfRev;
    }
    public static String returnDate(Date date)
    {
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");          
        return df.format(date);
    }
}
