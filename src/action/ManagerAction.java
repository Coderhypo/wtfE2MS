package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.IDAO;
import dao.ManagerDAO;
import models.Manager;
import org.apache.struts2.ServletActionContext;
import tools.PasswordTool;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员相关控制器
 * Created by hypo on 16-1-6.
 */
public class ManagerAction extends ActionSupport {

    private Integer id;
    private String login;
    private String name;
    private String pass;

    public String execute(){
        HttpServletRequest request = ServletActionContext.getRequest();

        IDAO dao = new ManagerDAO();
        String HQL = "FROM Manager m WHERE m.id=1";
        List<Manager> managers = dao.query(HQL);

        request.setAttribute("man", managers.get(0));
        return SUCCESS;
    }

    public String add(){

        Manager manager = new Manager(login, name, PasswordTool.getPass(pass));

        IDAO dao = new ManagerDAO();
        dao.add(manager);

        return SUCCESS;
    }

    public String delete(){

        IDAO dao = new ManagerDAO();

        Manager manager = (Manager) dao.get(id);

        if(manager == null){
            return ERROR;
        }

        dao.delete(manager);
        return SUCCESS;
    }

    public String update(){

        IDAO dao = new ManagerDAO();

        Manager manager = (Manager) dao.get(id);

        if(manager == null){
            return ERROR;
        }

        manager.setName(name);
        manager.setLogin(login);
        if(pass.length() > 0){

            manager.setPass(PasswordTool.getPass(pass));
        }

        dao.update(manager);
        return SUCCESS;
    }

    public String get(){
        HttpServletRequest request = ServletActionContext.getRequest();

        IDAO dao = new ManagerDAO();

        Manager manager = (Manager) dao.get(1);

        if(manager == null){
            return ERROR;
        }

        request.setAttribute("manager", manager);

        return SUCCESS;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
