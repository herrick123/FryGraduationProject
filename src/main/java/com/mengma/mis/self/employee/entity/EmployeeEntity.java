package com.mengma.mis.self.employee.entity;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

/**
 *  mafei
 */
@Table(name = "tbl_employee")
public class EmployeeEntity {

	/**
	 * 员工id
	 */
	@Id
	private String id;
	
	/**
	 * 员工的登录名
	 */
	private String userAccount;
	
	/**
	 * 员工的登录密码
	 */
	private String userPass;
	
	/**
	 * 角色
	 */
	private String role;
	/**
	 * 员工编号
	 */
	private String employeeCode;
	
	/**
	 * 员工姓名
	 */
	private String employeeName;
	
	/**
	 * 员工身份---‘0’是学员，‘1’是非学员
	 */
	private String identity;
	private Date birthday;
	private String gender;
	private String picturePath;
	/**
	 * 二维码的保存路径
	 */
	private String qrCodePath;
	
	public String getQrCodePath() {
		return qrCodePath;
	}

	public void setQrCodePath(String qrCodePath) {
		this.qrCodePath = qrCodePath;
	}

	/**
	 * 所属学校的id
	 */
	private String schoolId;
	private String major;
	private String introduction;
	private String phone;
	
	/**
	 * 加入训练营的时间
	 */
	private Date joinTime;
	
	/**
	 * 是否删除 0 未删除 1已删除
	 */
	private String delFlag ;
	
	/**
	 * 所属分区的id
	 */
	private String areaId;
	
	/**
	 * 所属期数的id
	 */
	private String issueId;
	
	/**
	 * 能力级别
	 */
	private String abilityLevel;
	
	/**
	 * 掌握的技能
	 */
	private String skill;
	private String nation;
	
	/**
	 * 学历
	 */
	private String education;
	
	/**
	 * 身份证号码
	 */
	private String identityNum;
	
	/**
	 * 银行卡号
	 */
	private String bankCard;
	
	/**
	 * 紧急联系人
	 */
	private String urgentPerson;
	
	/**
	 * 紧急联系人电话
	 */
	private String urgentPhone;
	
	/**
	 * 地址
	 */
	private String address;
	
	/**
	 * 
	 */
	public EmployeeEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 学校名称
	 */
	private String schoolName;

	
	
	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * @param id
	 * @param employeeCode
	 * @param employeeName
	 */
	public EmployeeEntity(String id, String employeeCode, String employeeName) {
		super();
		this.id = id;
		this.employeeCode = employeeCode;
		this.employeeName = employeeName;
	}

	public EmployeeEntity(String id, String userAccount, String userPass, String role, String employeeCode,
			String employeeName, String identity, Date birthday, String gender, String picturePath, String schoolId,
			String major, String introduction, String phone, Date joinTime, String delFlag, String areaId,
			String issueId, String abilityLevel, String skill, String nation, String education, String identityNum,
			String bankCard, String urgentPerson, String urgentPhone, String address, String schoolName) {
		super();
		this.id = id;
		this.userAccount = userAccount;
		this.userPass = userPass;
		this.role = role;
		this.employeeCode = employeeCode;
		this.employeeName = employeeName;
		this.identity = identity;
		this.birthday = birthday;
		this.gender = gender;
		this.picturePath = picturePath;
		this.schoolId = schoolId;
		this.major = major;
		this.introduction = introduction;
		this.phone = phone;
		this.joinTime = joinTime;
		this.delFlag = delFlag;
		this.areaId = areaId;
		this.issueId = issueId;
		this.abilityLevel = abilityLevel;
		this.skill = skill;
		this.nation = nation;
		this.education = education;
		this.identityNum = identityNum;
		this.bankCard = bankCard;
		this.urgentPerson = urgentPerson;
		this.urgentPhone = urgentPhone;
		this.address = address;
		this.schoolName = schoolName;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public String getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
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

	public Date getJoinTime() {
		return joinTime;
	}

	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getIssueId() {
		return issueId;
	}

	public void setIssueId(String issueId) {
		this.issueId = issueId;
	}

	public String getAbilityLevel() {
		return abilityLevel;
	}

	public void setAbilityLevel(String abilityLevel) {
		this.abilityLevel = abilityLevel;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getIdentityNum() {
		return identityNum;
	}

	public void setIdentityNum(String identityNum) {
		this.identityNum = identityNum;
	}

	public String getBankCard() {
		return bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}

	public String getUrgentPerson() {
		return urgentPerson;
	}

	public void setUrgentPerson(String urgentPerson) {
		this.urgentPerson = urgentPerson;
	}

	public String getUrgentPhone() {
		return urgentPhone;
	}

	public void setUrgentPhone(String urgentPhone) {
		this.urgentPhone = urgentPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
