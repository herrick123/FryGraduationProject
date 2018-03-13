package com.self.sys.tree.entity;


import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import com.self.sys.tree.model.BaseModel;

import java.util.Date;

/**
 * 目录树实体
 * @author sdh
 *
 */
@Table(name="sys_tree_manage")
public class DirectoryTree extends BaseModel {
	
	private static final long serialVersionUID = 3185263318972976441L;
	
	/**
	 * 主键
	 * 节点id
	 */
	@Id
	private String id;
	 
	/**
	 * 节点名称
	 */
	@Column(name="name")
	private String name;
	/**
	 * 父节点     
	 */
	@Column(name="parent_id")
    private String parentId;
	/**
	 * 父节点名称
	 */
	@Column(name="parent_name")
    private String parentName;
	/**
	 * 级别
	 */
	@Column(name="leve")
    private Integer leve;
	/**
	 * 目录树编码
	 */
	@Column(name="tree_code")
    private String treeCode;
	/**
	 * 创建编号
	 */
	@Column(name="create_id")
    private String createId;
	/**
	 * 修改编号
	 */
	@Column(name="update_id")
    private String updateId;
	/**
	 * 创建时间
	 */
	@Column(name="create_time")
    private Date createTime;
	/**
	 * 修改时间
	 */
	@Column(name="update_time")
    private Date updateTime;
	/**
	 * 备注
	 */
	@Column(name="note")
	private String note;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public Integer getLeve() {
		return leve;
	}
	public void setLeve(Integer leve) {
		this.leve = leve;
	}
	public String getTreeCode() {
		return treeCode;
	}
	public void setTreeCode(String treeCode) {
		this.treeCode = treeCode;
	}
	public String getCreateId() {
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
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}     
}
