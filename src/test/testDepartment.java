package test;

import dao.DepartmentDAO;
import dao.IDAO;
import models.Department;
import servers.DepartmentFactory;

import java.util.List;

/**
 * Created by hypo on 16-1-7.
 */
public class testDepartment {

    public static void main(String[] args){
        get();

    }

    public static void add(){
        IDAO dao = new DepartmentDAO();

        Department department = new DepartmentFactory("abc", "Test").getDepartment();

        System.out.println(department.getId());
    }

    public static void get(){
        IDAO dao = new DepartmentDAO();
        String HQL = "FROM Department d";
        List<Department> departments = dao.query(HQL);

        for(Department department : departments){
            System.out.println(department.getId());
        }
    }
}
