package com.mengma.mis.self.major.entity;

import javax.persistence.Table;

/**
 * Created by  liujs  2017/10/12
 */
@Table(name = "major")
public class Major {
    private String code;
    private String name;

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
