package com.mengma.mis.self.sys.tree.entity;

/**
 * 树节点实体
 * @author sdh
 *
 */

public class Tree {

	
	private String id;
	private String parentName;
	private Integer leve;
	private String parent;
	private String text;
	private String treeCode;
	private TreeState state;
	
	
	private TreeLinkAttr a_attr;
	private TreeLiAttr li_attr;
	
	
	public Tree() {
		this.parent="#";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public TreeState getState() {
		return state;
	}
	public void setState(TreeState state) {
		this.state = state;
	}
	public TreeLinkAttr getA_attr() {
		return a_attr;
	}
	public void setA_attr(TreeLinkAttr a_attr) {
		this.a_attr = a_attr;
	}
	public TreeLiAttr getLi_attr() {
		return li_attr;
	}
	public void setLi_attr(TreeLiAttr li_attr) {
		this.li_attr = li_attr;
	}
	public Integer getLeve() {
		return leve;
	}
	public void setLeve(Integer leve) {
		this.leve = leve;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getTreeCode() {
		return treeCode;
	}
	public void setTreeCode(String treeCode) {
		this.treeCode = treeCode;
	}	
}
