package com.self.training.entity;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 猛码训练营
 * @author 董宏超
 * 
 * */
@Table(name="tbl_training")
public class TrainingEntity {
	/**
	 * 训练营主键
	 * */
	@Id
	private String id;
	/**
	 * 训练营期数
	 * */
	@Column(name="train_issue")
	private String issue;
	/**
	 * 分区id
	 * */
	@Column(name="area_id")
	private String areaId;
	
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	/**
	 * 
	 * 分区名称 只在页面显示，添加不会添加
	 * 
	 * */
	@Transient
	private String areaName;
	/**
	 * 开始时间
	 * */
	@Column(name="start_time")
	private Date startTime;
	/**
	 * 结束时间
	 * */
	@Column(name="end_time")
	private Date endTime;
	/**
	 * 训练营课程
	 * */
	@Column(name="train_course")
	private String course;
	/**
	 * 详细课程计划的路径
	 * */
	@Column(name="course_path")
	private String path;
	/**
	 * 训练营培训讲师
	 * */
	@Column(name="train_teacher")
	private String teacherName;
	/**
	 * 本期训练营总人数
	 * */
	@Column(name="person_num")
	private String num;
	/**
	 * 判断是否删除
	 * 
	 * */
	private String del_flag;
	/**
	 * 空构造
	 * */
	
	public TrainingEntity() {
		
	}
	/**
	 * 带参构造方法
	 * */
	
	public String getId() {
		return id;
	}
	public TrainingEntity(String id, String issue, String areaId, String areaName, Date startTime, Date endTime,
			String course, String path, String teacherName, String num, String del_flag) {
		super();
		this.id = id;
		this.issue = issue;
		this.areaId = areaId;
		this.areaName = areaName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.course = course;
		this.path = path;
		this.teacherName = teacherName;
		this.num = num;
		this.del_flag = del_flag;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getDel_flag() {
		return del_flag;
	}
	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}
	
}
