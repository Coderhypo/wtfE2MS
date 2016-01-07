package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.DepartmentDAO;
import dao.EmployeeDAO;
import dao.IDAO;
import models.Department;
import models.Employee;
import org.apache.struts2.ServletActionContext;
import servers.EmployeeFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 员工相关控制器
 * Created by hypo on 16-1-6.
 */
public class EmployeeAction extends ActionSupport {

    private Integer id;
    private String code;
    private String name;
    private String sex;
    private Integer dpId;

    public String execute(){
        HttpServletRequest request = ServletActionContext.getRequest();

        IDAO dao = new EmployeeDAO();
        String HQL = "FROM Employee e";
        List<Employee> employees = dao.query(HQL);
        List<Map> rnt = new ArrayList<>();
        dao = new DepartmentDAO();
        for(Employee employee : employees){

            Map<String, String> tmp = new HashMap<>();
            tmp.put("id", employee.getId().toString());
            tmp.put("code", employee.getCode());
            tmp.put("name", employee.getName());
            tmp.put("sex", employee.getSex());
            tmp.put("workday", employee.getWorkday().toString());

            Integer dpId = employee.getDpId();
            Department department = (Department) dao.get(dpId);

            tmp.put("dp", department.getName());

            rnt.add(tmp);
        }
        request.setAttribute("ems", rnt);

        dao = new DepartmentDAO();
        List<Department> departments = dao.query("FROM Department d");
        request.setAttribute("departments", departments);

        return SUCCESS;
    }

    public String add(){

        Employee employee = new EmployeeFactory(code, name, sex, dpId).getEmployee();

        return SUCCESS;
    }

    public String delete(){

        IDAO dao = new EmployeeDAO();

        Employee employee = (Employee) dao.get(id);

        if(employee == null){
            return ERROR;
        }

        dao.delete(employee);
        return SUCCESS;
    }

    public String update(){
        IDAO dao = new EmployeeDAO();

        Employee employee = (Employee) dao.get(id);

        if(employee == null){
            return ERROR;
        }

        employee.setName(name);
        employee.setDpId(dpId);
        employee.setCode(code);
        employee.setSex(sex);

        dao.update(employee);
        return SUCCESS;
    }

    public String get(){
        HttpServletRequest request = ServletActionContext.getRequest();

        IDAO dao = new EmployeeDAO();

        Employee employee = (Employee) dao.get(id);

        if(employee == null){
            return ERROR;
        }

        dao = new DepartmentDAO();
        List<Department> departments = dao.query("FROM Department d");

        request.setAttribute("employee", employee);
        request.setAttribute("departments", departments);

        return SUCCESS;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getDpId() {
        return dpId;
    }

    public void setDpId(Integer dpId) {
        this.dpId = dpId;
    }
}
