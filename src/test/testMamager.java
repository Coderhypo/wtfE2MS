package test;

import dao.IDAO;
import dao.ManagerDAO;
import models.Manager;
import tools.PasswordTool;

/**
 * Created by hypo on 16-1-7.
 */
public class testMamager {

    public static void main(String[] agrs){

        get();

        return;
    }

    public static void add(){
        IDAO dao = new ManagerDAO();
        Manager manager = new Manager("admin", "ADMIN", PasswordTool.getPass("admin"));

        dao.add(manager);

    }

    public static void get(){

        IDAO dao = new ManagerDAO();
        String HQL = "FROM Manager m WHERE m.login='" + "admin" + "'";
//        String HQL = "FROM Manager m WHERE m.id=" + 1;
        Manager manager = (Manager) dao.get(HQL);
        System.out.println(manager.getId());

    }
}
