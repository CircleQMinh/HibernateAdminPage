/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this tprolate file, choose Tools | Tprolates
 * and open the tprolate in the editor.
 */
package Dao;

import Model.Product;
import Model.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author ASUS
 */
public class ProductDao {
    public static Product getPro(int id) {

        Transaction transaction = null;
        Product pro = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        try  (Session session = sessionFactory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            pro = (Product) session.get(Product.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return pro;
    }
    public static List < Product > getAllPro() {

        Transaction transaction = null;
        List < Product > listOfpro = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        try  (Session session = sessionFactory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfpro = session.createQuery("from Product ").list();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return listOfpro;
    }
    
    public static void saveEmp(Product pro) {
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(pro);
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
}
