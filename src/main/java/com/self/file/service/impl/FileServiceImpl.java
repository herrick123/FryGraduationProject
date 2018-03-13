package com.self.file.service.impl;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.util.UuidUtil;
import com.self.file.dao.FileMapper;
import com.self.file.entity.FileEntity;
import com.self.file.service.FileService;

@Service("fileService")
public class FileServiceImpl implements FileService {

	private static final Logger log = LoggerFactory.getLogger(FileServiceImpl.class);

	@Autowired
	private FileMapper fileMapper;
	
	/**
	 * 保存上传的文件信息
	 */
	@Override
	public int addUploadFile(FileEntity fileEntity) {
		// TODO Auto-generated method stub
		String id = UuidUtil.getUuid32().toString();
		fileEntity.setId(id);
		return fileMapper.insert(fileEntity);
	}
}