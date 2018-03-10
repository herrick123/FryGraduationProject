package com.mengma.mis.self.student.entity;

import javax.persistence.Table;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.Date;

/**
 * @author 
 */
@Table(name="student")
public class Student implements Serializable{
    /**
     * 主键
     */
    private String id;

    /**
     * 学员id
     */
    private String studentId;

    /**
     * 学员名称
     */
    private String studentName;

    /**
     * 生日
     */
    private ZonedDateTime birthday;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 照片
     */
    private String picture;

    /**
     * 学校id
     */
    private String schoolId;

    /**
     * 所在院系
     */
    private String departmentId;

    /**
     * 简介
     */
    private String introduction;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 备注
     */
    private String remark;

    /**
     * 入学时间
     */
    private ZonedDateTime entranceTime;

    /**
     * 是否删除 0 未删除 1已删除
     */
    private String delFlag;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

//    public Date getBirthday() {
//        return birthday;
//    }
//
//    public void setBirthday(Date birthday) {
//        this.birthday = birthday;
//    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

//    public Date getEntranceTime() {
//        return entranceTime;
//    }
//
//    public void setEntranceTime(Date entranceTime) {
//        this.entranceTime = entranceTime;
//    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public ZonedDateTime getBirthday() {
        return birthday;
    }

    public void setBirthday(ZonedDateTime birthday) {
        this.birthday = birthday;
    }

    public ZonedDateTime getEntranceTime() {
        return entranceTime;
    }

    public void setEntranceTime(ZonedDateTime entranceTime) {
        this.entranceTime = entranceTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", studentId=").append(studentId);
        sb.append(", studentName=").append(studentName);
        sb.append(", birthday=").append(birthday);
        sb.append(", gender=").append(gender);
        sb.append(", picture=").append(picture);
        sb.append(", schoolId=").append(schoolId);
        sb.append(", departmentId=").append(departmentId);
        sb.append(", introduction=").append(introduction);
        sb.append(", phone=").append(phone);
        sb.append(", remark=").append(remark);
        sb.append(", entranceTime=").append(entranceTime);
        sb.append(", delFlag=").append(delFlag);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}