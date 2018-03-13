package com.self.area.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 分区管理列表
 * @author 王子珩
 *
 */
@Table(name="tbl_area")
public class AreaEntity {
	
	/**
	 * 分区id
	 */
	@Id
	private String id;
	
	/**
	 * 分区编码
	 */
	private String areaCode;
	
	/**
	 * 分区名称
	 */
	private String areaName;
	
	/**
	 * 负责人姓名
	 */
	private String managerName;
	
	/**
	 * 负责人电话
	 */
	private String managerPhone;
	
	/**
	 * 分区所在地
	 */
	private String place;
	
	/**
	 * 分区介绍
	 */
	private String introduction;
	
	/**
	 * 创建时间
	 */
	private Date startTime;
	/**
	 * 逻辑删除
	 * */
	private String flag;
	
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	/**
	 * 分区人数
	 */
	private String areaNum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}



	public String getAreaNum() {
		return areaNum;
	}

	public void setAreaNum(String areaNum) {
		this.areaNum = areaNum;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}


	
	
	
	

}
