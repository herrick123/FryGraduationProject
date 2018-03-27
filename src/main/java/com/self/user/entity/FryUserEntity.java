package com.self.user.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="FRY_USER")
public class FryUserEntity {
	
	/**
	 * 用户ID
	 */
	@Id
	private String uuid;
	
	/**
	 * 用户名
	 */
	@Column(name="USER_NAME")
	private String userName;
	
	/**
	 * 密码
	 */
	@Column(name="PASSWORD")
	private String password;
	
	/**
	 * 角色（0->管理员、1->淘宝店家、2->供货厂家、3->代发厂家）
	 */
	@Column(name="ROLE")
	private String role;
	
	/**
	 * 用户状态（0->未认证、1->认证通过）
	 */
	@Column(name="USER_STATUS")
	private String userStatus;
	
	/**
	 * 联系人
	 */
	@Column(name="CONTACTS")
	private String contacts;
	
	/**
	 * 手机
	 */
	@Column(name="PHONE")
	private String phone;
	
	/**
	 * QQ
	 */
	@Column(name="QQ")
	private String qq;
	
	/**
	 * 网供名称（工厂或公司名称）
	 */
	@Column(name="ADDRESS")
	private String address;
	
	/**
	 * 拿货地址
	 */
	@Column(name="DELIVERY_ADDRESS")
	private String deliveryAddress;
	
	/**
	 * 服务费
	 */
	@Column(name="SERVICE_CHARGE")
	private Double serviceCharge;
	
	/**
	 * 支付宝
	 */
	@Column(name="ALIPAY")
	private String alipay;
	
	/**
	 * 保证金
	 */
	@Column(name="BOND")
	private Double bond;
	
	/**
	 * 区域（代发区域、市场区域）
	 */
	@Column(name="AREA")
	private String area;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public Double getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(Double serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public String getAlipay() {
		return alipay;
	}

	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}

	public Double getBond() {
		return bond;
	}

	public void setBond(Double bond) {
		this.bond = bond;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
}
