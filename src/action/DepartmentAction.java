package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.DepartmentDAO;
import dao.IDAO;
import models.Department;
import org.apache.struts2.ServletActionContext;
import servers.DepartmentFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 部门相关控制器
 * Created by hypo on 16-1-6.
 */
public class DepartmentAction extends ActionSupport {

    private Integer id;
    private String code;
    private String name;

    public String execute(){
        HttpServletRequest request = ServletActionContext.getRequest();

        IDAO dao = new DepartmentDAO();
        String HQL = "FROM Department d";
        List<Department> departments = dao.query(HQL);

        request.setAttribute("dps", departments);
        return SUCCESS;
    }

    public String add(){

        Department department = new DepartmentFactory(code, name).getDepartment();

        return SUCCESS;
    }

    public String delete(){

        IDAO dao = new DepartmentDAO();

        Department department = (Department) dao.get(id);

        if(department == null){
            return ERROR;
        }

        dao.delete(department);
        return SUCCESS;
    }

    public String update(){

        IDAO dao = new DepartmentDAO();

        Department department = (Department) dao.get(id);

        if(department == null){
            return ERROR;
        }

        department.setName(name);
        department.setCode(code);

        dao.update(department);
        return SUCCESS;
    }

    public String get(){
        HttpServletRequest request = ServletActionContext.getRequest();

        IDAO dao = new DepartmentDAO();

        Department department = (Department) dao.get(id);

        if(department == null){
            return ERROR;
        }

        request.setAttribute("department", department);

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
}
