package com.mengma.mis.self.company.entity;

import javax.persistence.Table;

/**
 * Created by  liujs  2017/10/14
 */
@Table(name = "company")
public class Company {

    private String id;
    private String name;
    private String introduction;
    private String recruit_email;
    private String ioc;
    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getRecruit_email() {
        return recruit_email;
    }

    public void setRecruit_email(String recruit_email) {
        this.recruit_email = recruit_email;
    }

    public String getIoc() {
        return ioc;
    }

    public void setIoc(String ioc) {
        this.ioc = ioc;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
