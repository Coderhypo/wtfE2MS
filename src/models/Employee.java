package models;

import java.util.Date;

/**
 * 员工类 对应数据库中employees表
 * Created by hypo on 16-1-6.
 */
public class Employee {

    private Integer id;
    private String code;
    private String name;
    private String sex;
    private Date workday;

    public Employee(String code, String name, String sex) {
        this.code = code;
        this.name = name;
        this.sex = sex;
        this.workday = new Date();
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

    public Date getWorkday() {
        return workday;
    }
}
