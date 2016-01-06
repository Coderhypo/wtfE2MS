package dao;

import models.Department;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * 部门DAO类 提供部门信息的增删改查
 * Created by hypo on 16-1-6.
 */
public class DepartmentDAO implements IDAO<Department> {

    @Override
    public Department get(Integer id) {

        Session session = HibernateSessionFactory.currentSession();
        String HQL = "FROM Department m WHERE m.userId=" + id;
        Query query = session.createQuery(HQL);

        Department rnt;

        if(query.list().size() == 0){
            rnt = null;
        }else {
            rnt = (Department) query.list().get(0);
        }

        HibernateSessionFactory.closeSession();

        return rnt;
    }

    @Override
    public Department get(String HQL) {
        Session session = HibernateSessionFactory.currentSession();

        Query query = session.createQuery(HQL);

        Department rnt = null;
        if(query.list().size() != 0){
            rnt = (Department) query.list().get(0);
        }
        HibernateSessionFactory.closeSession();

        return rnt;
    }

    @Override
    public Boolean add(Department one) {

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
    public Boolean delete(Department one) {

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
    public Boolean update(Department one) {

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
    public List<Department> query(String HQL) {

        Session session = HibernateSessionFactory.currentSession();

        Query query = session.createQuery(HQL);
        List<Department> rnt = query.list();

        HibernateSessionFactory.closeSession();

        return rnt;
    }
}
