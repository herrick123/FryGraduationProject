package com.mengma.mis.self.file.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author mafei
 *
 */
@Table(name = "tbl_file")
public class FileEntity {
	/**
	 * 主键id
	 */
	@Id
	private String id;
	
	/**
	 * 标识，1：项目文件，2：个人文件
	 */
	private String flag;
	
	/**
	 * 上传者的ID
	 */
	private String uploadId;
	
	/**
	 * 要上传文件的名称
	 */
	private String fileName;
	
	/**
	 * 要上传文件的类型
	 */
	private String fileType;
	
	/**
	 * 要上传文件的开始时间
	 */
	private Date startTime;
	
	/**
	 * 要上传文件的结束时间
	 */
	private Date endTime;
	
	/**
	 * 上传文件所采用的技术
	 */
	private String skill;
	
	/**
	 * 对要上传文件的描述
	 */
	private String remark;
	
	/**
	 * 上传文件的路径
	 */
	private String filePath;
	
	/**
	 * 上传文件的时间
	 */
	private Date uploadTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getUploadId() {
		return uploadId;
	}
	public void setUploadId(String uploadId) {
		this.uploadId = uploadId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	/**
	 * @param id
	 * @param flag
	 * @param uploadId
	 * @param fileName
	 * @param fileType
	 * @param startTime
	 * @param endTime
	 * @param skill
	 * @param remark
	 * @param filePath
	 * @param uploadTime
	 */
	public FileEntity(String id, String flag, String uploadId, String fileName, String fileType, Date startTime,
			Date endTime, String skill, String remark, String filePath, Date uploadTime) {
		super();
		this.id = id;
		this.flag = flag;
		this.uploadId = uploadId;
		this.fileName = fileName;
		this.fileType = fileType;
		this.startTime = startTime;
		this.endTime = endTime;
		this.skill = skill;
		this.remark = remark;
		this.filePath = filePath;
		this.uploadTime = uploadTime;
	}
	/**
	 * 
	 */
	public FileEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
