/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;



import Model.Blog;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author KHOAPHAN
 */
public class BlogDao {
    public static Blog getBlog(int id) {

        Transaction transaction = null;
        Blog blo = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        try  (Session session = sessionFactory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            blo = (Blog) session.get(Blog.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return blo;
    }
    public static List < Blog > getAllBlog() {

        Transaction transaction = null;
        List < Blog > listOfblog = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        try  (Session session = sessionFactory.openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object

            listOfblog = session.createQuery("from Blog ").list();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return listOfblog;
    }
    
    public static void saveBlog(Blog blo) {
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(blo);
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
    public static void updateEmp(Blog blo) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(blo);
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
    // edit 1 số cột
    public static void editBlog(Integer employeeId, String blogName, String blogContent, String picture){
        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Blog blo=(Blog)session.get(Blog.class, employeeId);
        blo.setBlogId(employeeId);
        blo.setBlogName(blogName);
        blo.setBlogContent(blogContent);
        blo.setPicture(picture);
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(blo);
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

    public static void deleteBlog(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Blog blo = session.get(Blog.class, id);
            if (blo != null) {
                session.delete(blo);

            }

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
