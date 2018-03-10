package com.mengma.mis.self.sys.dictionary.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "sys_dictionary")
public class DictionaryEntity {
	
	/**
	 * 主键id
	 */
	@Id
	private String id;
	
	/**
	 * 数据字典类别值
	 */
	@Column(name = "type_code")
	private String typeCode;
	
	/**
	 * 数据字典分类名称
	 */
	@Column(name = "type_name")
	private String typeName;
	
	/**
	 * 数据字典类别描述
	 */
	@Column(name = "`describe`")
	private String describe;
	
	/**
	 * 创建人
	 */
	@Column(name = "creator")
	private String creator;
	
	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
	private Date createTime;
	
	/**
	 * 修改人
	 */
	@Column(name = "modifier")
	private String modifier;
	
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

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
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

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
