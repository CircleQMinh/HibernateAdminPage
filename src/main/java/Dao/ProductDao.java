/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this tprolate file, choose Tools | Tprolates
 * and open the tprolate in the editor.
 */
package Dao;


import Model.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author ASUS
 */
public class ProductDao {
    public static Product getPro(int id) {

        Transaction transaction = null;
        Product pro = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            pro = (Product) session.get(Product.class, id);
            // commit transaction
            transaction.commit();session.close();sessionFactory.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();sessionFactory.close();
            }
        }
        return pro;
    }
    public static List < Product > getAllPro() {

        Transaction transaction = null;
        List < Product > listOfpro = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfpro = session.createQuery("from Product ").list();

            // commit transaction
            transaction.commit();session.close();sessionFactory.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();sessionFactory.close();
            }
        }
        return listOfpro;
    }
    
    public static void savePro(Product pro) {
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(pro);
            // commit transaction
            transaction.commit();session.close();sessionFactory.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();sessionFactory.close();
            }
        }
    }
     public static void updatePro(Product pro) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(pro);
            // commit transaction
            transaction.commit();session.close();sessionFactory.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();sessionFactory.close();
            }
        }
    }
    public static void deletePro(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Product pro = session.get(Product.class, id);
            if (pro != null) {
                session.delete(pro);

            }

            // commit transaction
            transaction.commit();session.close();sessionFactory.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();sessionFactory.close();
            }
        }
    }
    public static boolean CheckProInUse(int id)
    {
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            String stringquery="select 1 from Orderdetail m where m.product.id="+String.valueOf(id);
            Query query = session.createQuery(stringquery);session.close();sessionFactory.close();
            return (query.uniqueResult() != null);
        } catch (Exception e) {
            session.close();sessionFactory.close();
            return false;
        }
    }
}
