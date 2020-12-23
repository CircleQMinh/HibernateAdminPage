/*
 * To change this license header, choose License Headers in Accject Accperties.
 * To change this tacclate file, choose Tools | Tacclates
 * and open the tacclate in the editor.
 */
package Dao;

import Hibernate.HibernateUtil;
import Model.Account;
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
public class AccountDao {
    public static List < Account > getAllEmpAcc() {

        Transaction transaction = null;
        List < Account > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery(" from Account acc where acc.type='employee'").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static List < Object[] > getAllEmpAccount() {//join 2 bang lai voi nhau

        Transaction transaction = null;
        List < Object[] > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery("select e,a from Employee e,Account a where e.employeeId=a.userId and a.type='employee'").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static List < Account > getAllCusAcc() {

        Transaction transaction = null;
        List < Account > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery(" from Account acc where acc.type='customer'").list();

            // commit transaction
            transaction.commit();
            session.close();
            
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static List < Object[] > getAllCusAccount() {//join 2 bang lai voi nhau

        Transaction transaction = null;
        List < Object[] > listOfAcc = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfAcc = session.createQuery("select c,a from Customer c,Account a where c.customerId=a.userId and a.type='customer'").list();

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
        return listOfAcc;
    }
    public static void saveAcc(Account Acc) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(Acc);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
     public static void updateAcc(Account Acc) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(Acc);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
    public static void editAccEmp(int id,String pass)
    {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Account acc=(Account)session.get(Account.class, id);
        acc.setPassword(pass);
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(acc);
            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
    public static void deleteAcc(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Account Acc = session.get(Account.class, id);
            if (Acc != null) {
                session.delete(Acc);

            }

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
    public static boolean CheckCusInUse(int id)
    {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String stringquery="select 1 from Order m where m.customer.customerId="+String.valueOf(id);
        Query query = session.createQuery(stringquery);
        session.close();
        return (query.uniqueResult() != null);
    }
    public static void deleteAccCus(int id,int uid) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try{
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Account Acc = session.get(Account.class, id);
            session.createSQLQuery("delete from customer where CustomerID=" +String.valueOf(uid)).executeUpdate();
            if (Acc != null) {
                session.delete(Acc);
                
            }

            // commit transaction
            transaction.commit();
            session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                session.close();
            }
        }
    }
}
