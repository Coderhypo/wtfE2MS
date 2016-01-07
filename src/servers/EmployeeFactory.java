package servers;

import dao.EmployeeDAO;
import dao.IDAO;
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

        IDAO dao = new EmployeeDAO();
        dao.add(employee);

        return employee;
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

    private void setSex(String sex) {

        if(sex.length() > 10){

            this.sex = sex.substring(0,10);
        }else {

            this.sex = sex;
        }
    }

    private void setDpId(Integer dpId) {
        this.dpId = dpId;
    }
}
