package dao;

import models.Employee;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * 用户DAO类 提供用户的增删改查
 * Created by hypo on 16-1-6.
 */
public class EmployeeDAO implements IDAO<Employee> {

    @Override
    public Employee get(Integer id) {

        Session session = HibernateSessionFactory.currentSession();
        String HQL = "FROM Employee e WHERE e.id=" + id;
        Query query = session.createQuery(HQL);

        Employee rnt;

        if(query.list().size() == 0){
            rnt = null;
        }else {
            rnt = (Employee) query.list().get(0);
        }

        HibernateSessionFactory.closeSession();

        return rnt;
    }

    @Override
    public Employee get(String HQL) {
        Session session = HibernateSessionFactory.currentSession();

        Query query = session.createQuery(HQL);

        Employee rnt = null;
        if(query.list().size() != 0){
            rnt = (Employee) query.list().get(0);
        }
        HibernateSessionFactory.closeSession();

        return rnt;
    }

    @Override
    public Boolean add(Employee one) {

        Session session = HibernateSessionFactory.currentSession();
        Transaction transaction = session.beginTransaction();

        try {

            session.save(one);
            transaction.commit();
        }catch (Exception e){

            System.err.println(e.getMessage());
            transaction.rollback();
            return false;
        }finally {

            HibernateSessionFactory.closeSession();
        }

        return true;
    }

    @Override
    public Boolean delete(Employee one) {

        Session session = HibernateSessionFactory.currentSession();
        Transaction transaction = session.beginTransaction();

        try {

            session.delete(one);
            transaction.commit();
        }catch (Exception e){

            System.err.println(e.getMessage());
            transaction.rollback();
            return false;
        }finally {

            HibernateSessionFactory.closeSession();
        }

        return true;
    }

    @Override
    public Boolean update(Employee one) {

        Session session = HibernateSessionFactory.currentSession();
        Transaction transaction = session.beginTransaction();

        try {

            session.update(one);
            transaction.commit();
        }catch (Exception e){

            System.err.println(e.getMessage());
            transaction.rollback();
            return false;
        }finally {

            HibernateSessionFactory.closeSession();
        }

        return true;
    }

    @Override
    public List<Employee> query(String HQL) {

        Session session = HibernateSessionFactory.currentSession();

        Query query = session.createQuery(HQL);
        List<Employee> rnt = query.list();

        HibernateSessionFactory.closeSession();

        return rnt;
    }
}
