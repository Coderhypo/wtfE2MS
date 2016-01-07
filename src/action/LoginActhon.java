package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.IDAO;
import dao.ManagerDAO;
import models.Manager;
import tools.PasswordTool;

/**
 * Created by hypo on 16-1-7.
 */
public class LoginActhon extends ActionSupport{

    private String login;
    private String pass;

    public String execute(){

        IDAO<Manager> dao = new ManagerDAO();
        String HQL = "FROM Manager m WHERE m.login='" + login + "'";
        Manager manager = dao.get(HQL);

        if(manager == null){
            return LOGIN;
        }

        if(PasswordTool.verify(pass, manager)){

            return SUCCESS;
        }

        return LOGIN;
    }


    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
