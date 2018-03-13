package com.self.sys.quartz.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;

/** 
 * 定时任务实体类
 * @author liuyu 
 */  
@Table(name = "sys_quartz")
public class QuartzEntity {
	
	/** 
	 * 任务id 
	 */ 
	@Id
    private String id;  
    
	/** 
     * 任务名称
     */
	@Column(name = "job_name")
    private String jobName;  
    
	/** 
     * 任务分组 
     */ 
	@Column(name = "job_group")
    private String jobGroup;  
    
	/** 
     * 任务状态 0停止 1启用
     */
	@Column(name = "job_status")
    private String jobStatus;  
    
	/** 
     * 任务运行时间表达式
     */ 
	@Column(name = "job_expression")
    private String cronExpression;  
    
	/** 
     * 任务描述 
     */ 
	@Column(name = "job_desc")
    private String desc;
	
	/** 
     * 时间表达式的秒数位
     */ 
	@Column(name = "second")
    private String second;
	
	/** 
     * 时间表达式的分数位
     */ 
	@Column(name = "minute")
    private String minute;
	
	/** 
     * 时间表达式的时数位
     */ 
	@Column(name = "hour")
    private String hour;
	
	/** 
     * 时间表达式的天数位
     */ 
	@Column(name = "day")
    private String day;
	
	/** 
     * 时间表达式的月数位
     */ 
	@Column(name = "month")
    private String month;
	
	/** 
     * 时间表达式的年数位
     */ 
	@Column(name = "year")
    private String year;
	
	/** 
     * 时间表达式类型 区分时间策略类型  1表示每月 2表示每周 3表示每天
     * 4表示每几时间 5表示每几分 6表示每几秒 7表示指定时间
     */ 
	@Column(name = "cron_type")
	private String cronType;
	
	/** 
     * 创建人
     */ 
	//@Column(name = "CREATE_id")
	//private String createId;
	
	/** 
     * 修改人
     */ 
	//@Column(name = "UPDATE_id")
	//private String updateId;
	
	/** 
     * 创建时间
     */ 
	@Column(name = "create_time")
	private Timestamp createTime;
	
	/** 
     * 修改时间
     */ 
	@Column(name = "update_time")
	private Timestamp updateTime;
	
	 /** 
     * 需要运行的类的全路径名
     */  
	@Column(name = "class_name")
    private String className;
    
    /** 
     * 任务执行方案
     */  
	@Column(name = "scheme")
    private String scheme;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getJobGroup() {
		return jobGroup;
	}
	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}
	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}
	public String getCronExpression() {
		return cronExpression;
	}
	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getSecond() {
		return second;
	}
	public void setSecond(String second) {
		this.second = second;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCronType() {
		return cronType;
	}
	public void setCronType(String cronType) {
		this.cronType = cronType;
	}
	
	/*public String getCreateId() {
		return createId;
	}
	public void setCreateId(String createId) {
		this.createId = createId;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}*/
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	
	
}
