package com.mengma.mis.self.employee.employeeVo;

import java.sql.Date;

/**
 * 通过员工ID查到的文件上传时间和文件名
 * @author mafei
 *
 */
public class EmployeeVo {
	
	/**
	 * 上传者
	 */
	private String uploadId;
	
	/**
	 * 上传时间
	 */
	private Date uploadTime;
	
	/**
	 * 文件描述
	 */
	private String remark;
	
	/**
	 * 文件名
	 */
	private String fileName;
	

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUploadId() {
		return uploadId;
	}

	public void setUploadId(String uploadId) {
		this.uploadId = uploadId;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
}
