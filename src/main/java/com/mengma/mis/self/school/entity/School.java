package com.mengma.mis.self.school.entity;

import javax.persistence.Table;

/**
 * Created by  liujs  2017/10/10
 */
@Table(name = "school")
public class School {
    private String id;
    private String name;
    private String introduction;
    private String web_url;
    private String badge;
    private String remark;
    private String school_code;

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

    public String getWeb_url() {
        return web_url;
    }

    public void setWeb_url(String web_url) {
        this.web_url = web_url;
    }

    public String getBadge() {
        return badge;
    }

    public void setBadge(String badge) {
        this.badge = badge;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getSchool_code() {

        return school_code;
    }

    public void setSchool_code(String school_code) {
        this.school_code = school_code;
    }
}
