package servers;

import models.Employee;

/**
 * 员工工厂类 提供创建员工的方法
 * Created by hypo on 16-1-6.
 */
public class EmployeeFactory {

    private String code;
    private String name;
    private String sex;
    private Integer dpId;

    public EmployeeFactory(String code, String name, String sex, Integer dpId) {
        setCode(code);
        setName(name);
        setSex(sex);
        setDpId(dpId);
    }

    public Employee getEmployee(){

        Employee employee = new Employee(code,name,sex, dpId);

        return employee;
    }

    private void setCode(String code) {
        this.code = code.substring(0,10);
    }

    private void setName(String name) {
        this.name = name.substring(0,20);
    }

    private void setSex(String sex) {
        this.sex = sex.substring(0,10);
    }

    private void setDpId(Integer dpId) {
        this.dpId = dpId;
    }
}
