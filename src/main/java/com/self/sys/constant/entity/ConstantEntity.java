package com.self.sys.constant.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name  = "sys_dict_constant")
public class ConstantEntity {

	/**
	 * 主键-id
	 */
	@Id
	private String id;

	/**
	 * 所属字典类别
	 */
	@Column(name =  "dictionary_id")
	private String dictionaryId;
	
	/**
	 * 字典类型简介
	 */
	@Column(name = "constant_desc")
	private String constantDesc;
	
	/**
	 * 字典名称
	 */
	@Column(name = "value_name")
	private String valueName;
	
	/**
	 * 字典code
	 */
	@Column(name = "value_code")
	private String valueCode;
	
	@Column(name = "dictionary_code")
	private String dictionaryCode;
	
	public String getDictionaryCode() {
		return dictionaryCode;
	}

	public void setDictionaryCode(String dictionaryCode) {
		this.dictionaryCode = dictionaryCode;
	}

	public String getValueCode() {
		return valueCode;
	}

	public void setValueCode(String valueCode) {
		this.valueCode = valueCode;
	}

	/**
	 * 创建人
	 */
	@Column(name = "creator")
	private String creator;
	
	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
	private Date createTime ;
	
	/**
	 * 修改人
	 */
	@Column(name = "modifier")
	private String modififer;
	
	/**
	 * 修改时间
	 */
	@Column(name = "update_time")
	private Date updateTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getdictionaryId() {
		return dictionaryId;
	}

	public void setdictionaryId(String dictionaryId) {
		this.dictionaryId = dictionaryId;
	}

	public String  getConstantDesc() {
		return constantDesc;
	}

	public void setConstantDesc(String constantDesc) {
		this.constantDesc = constantDesc;
	}

	public String getValueName() {
		return valueName;
	}

	public void setValueName(String valueName) {
		this.valueName = valueName;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getModififer() {
		return modififer;
	}

	public void setModififer(String modififer) {
		this.modififer = modififer;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
