package servers;

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

        return department;
    }

    private void setCode(String code) {
        this.code = code.substring(0,10);
    }

    private void setName(String name) {
        this.name = name.substring(0,20);
    }
}
