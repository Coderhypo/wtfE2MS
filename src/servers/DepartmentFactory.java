package servers;

import dao.DepartmentDAO;
import dao.IDAO;
import models.Department;

/**
 * 部门工厂类 提供创建合法部门的方法
 * Created by hypo on 16-1-6.
 */
public class DepartmentFactory {

    private String code;
    private String name;

    public DepartmentFactory(String code, String name) {
        setName(name);
        setCode(code);
    }

    public Department getDepartment(){
        Department department = new Department(code, name);

        IDAO dao = new DepartmentDAO();
        dao.add(department);

        return department;
    }

    private void setCode(String code) {

        if(code.length() > 10){

            this.code = code.substring(0,10);
        }else {
            this.code = code;
        }
    }

    private void setName(String name) {
        if(name.length() > 20){

            this.name = name.substring(0,20);
        }else {
            this.name = name;
        }
    }
}
