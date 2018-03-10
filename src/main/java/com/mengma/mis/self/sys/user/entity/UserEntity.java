package com.mengma.mis.self.sys.user.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

@Table(name="sys_user")
public class UserEntity {
	/**
	 * 用户ID
	 */
	@Id
	@Column(name="user_id")
	private String userId;
	/**
	 * 登录名
	 */
	@Column(name="user_account")
	private String userAccount;
	/**
	 * 用户名
	 */
	@Column(name="user_name")
	private String userName;
	/**
	 * 登陆密码
	 */
	@Column(name="user_pass")
	private String userPass;
	/**
	 * 状态
	 */
	@Column(name="user_status")
	private int userStatus;
	/**
	 * 电话
	 */
	@Column(name="telphone")
	private String telPhone;
	/**
	 * 邮箱
	 */
	@Column(name="email")
	private String Email;
	/**
	 * 工号
	 */
	@Column(name="idno")
	private String IDNO;
	/**
	 * 职务
	 */
	private String title;
	private int gender;
	/**
	 * 是否为负责人 1表示是0表示否
	 */
	private int head;
	
	@Column(name="createid")
	private String createID;
	@Column(name="updateid")
	private String updateID;
	/**
	 * 创建时间
	 */
	@Column(name="create_time")
	private Date createTime;
	/**
	 * 更新时间
	 */
	@Column(name="update_time")
	private Date updateTime;
	/**
	 * 所属部门
	 */
	@Column(name="department_id")
	private String departmentId;
	
	@Column(name="department_name")
	private String departmentName;
	/**
	 * 角色ID
	 */
	@Column(name="role")
	private String role;
	/**
	 * 角色名称
	 * @return
	 */
	@Transient
	private String roleName;
	/**
	 * 角色编码
	 */
	@Transient
	private String roleCode;
	
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUsserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getTelPhone() {
		return telPhone;
	}
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getIDNO() {
		return IDNO;
	}
	public void setIDNO(String iDNO) {
		IDNO = iDNO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getHead() {
		return head;
	}
	public void setHead(int head) {
		this.head = head;
	}
	public String getCreateID() {
		return createID;
	}
	public void setCreateID(String createID) {
		this.createID = createID;
	}
	public String getUpdateID() {
		return updateID;
	}
	public void setUpdateID(String updateID) {
		this.updateID = updateID;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
    public String getDepartmentId() {
        return departmentId;
    }
    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }
    public String getDepartmentName() {
        return departmentName;
    }
    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
}
