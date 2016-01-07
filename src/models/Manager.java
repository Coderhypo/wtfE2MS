package models;

/**
 * 管理员类 对应数据库中managers表
 * Created by hypo on 16-1-6.
 */
public class Manager {

    private Integer id;
    private String login;
    private String name;
    private String pass;

    public Manager() {
    }

    public Manager(String login, String name, String pass) {
        this.login = login;
        this.name = name;
        this.pass = pass;
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
