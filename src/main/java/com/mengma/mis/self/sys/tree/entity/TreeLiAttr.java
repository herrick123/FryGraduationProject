package com.mengma.mis.self.sys.tree.entity;
/**
 * 树的<li>节点
 * @author sdh
 *
 */
public class TreeLiAttr {
        private String level;
        private String special;
        private String codeValue;
        
        
		public TreeLiAttr() {
			this.special="0";
			this.codeValue="";
		}
		public String getLevel() {
			return level;
		}
		public void setLevel(String level) {
			this.level = level;
		}
		public String getSpecial() {
			return special;
		}
		public void setSpecial(String special) {
			this.special = special;
		}
		public String getCodeValue() {
			return codeValue;
		}
		public void setCodeValue(String codeValue) {
			this.codeValue = codeValue;
		}
        
        
}
