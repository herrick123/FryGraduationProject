package com.mengma.mis.self.file.cotroller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.util.FileUtil;
import com.mengma.mis.core.util.MisLog;
import com.mengma.mis.self.file.entity.FileEntity;
import com.mengma.mis.self.file.service.FileService;

/**
 * 上传的controller
 * @author mafei
 *
 */

@Controller
@RequestMapping("/uploadFile")
public class FileController {
private static final Logger log = LoggerFactory.getLogger(FileController.class);
	
	private static String MODULE_UPLOAD_PAGE = "/uploadFile/uploadFile";//上传文件的页面
    private static String EXCEPTION_PAGE = "/exception";//报错页面
	
	@Autowired
	private FileService fileService;

	@RequestMapping(value="/add")
	public String addUploadFile(){
		return MODULE_UPLOAD_PAGE;
	}
	
	/**
	 * 保存要上传文件的信息
	 * @param model
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveUploadFile(Model model,FileEntity fileEntity) {
		MisLog.info(log, "上传文件");
		int result = fileService.addUploadFile(fileEntity);
        if (result > 0) return "redirect:/pages/employee/employeeList.jsp";
        return "redirect:/exception.jsp";
	}
	
	/**
	 * checkUpload
	 * @param user
	 * @return
	 */
	
	@ResponseBody
	@RequestMapping(value="/checkUpload",method = RequestMethod.POST)
	public String checkEmployee(String employeeName){
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		/*Map<String,String> params = new HashMap<String,String>();
		if(employeeName != null){
			params.clear();
			params.put("employeeName",employeeName);
			if(employeeService.findEmployeeEntityByParams(params)>0){
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "用户名已存在");
			}
		}*/
		return json.toJSONString();
	}
	
	/**
	 * 文件下载DEMO
	 * @param response
	 */
	@RequestMapping(value="/download")
	public void downloadFile(HttpServletResponse response){
		String filePath = "F:/upload/test/测试.jpg";
		FileUtil.downloadFile(response, filePath, Boolean.FALSE);
	}
	
	/**
	 * 文件上传
	 * @param uploadFile
	 * @return
	 */
	@RequestMapping(value="/upload",method = RequestMethod.POST)
	public String asyncUploadFile(@RequestParam(value = "uploadFile") MultipartFile uploadFile, Model model,FileEntity fileEntity, HttpServletRequest request){
		JSONObject json = JSONObject.parseObject("{}");
		Integer result = null ;
		try{
			String fileName = uploadFile.getOriginalFilename();
			String basePath = GlobalCodeConstant.BASE_UPLOADFILE_PATH;
			String filePath = basePath + fileName;
			File upFile = new File(basePath);
			if(!upFile.isDirectory()){//判断文件夹是否存在 不存在创建
				upFile.mkdirs();
	        }
			uploadFile.transferTo(new File(filePath));
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
			json.put("filePath", filePath);
			
			Date date = new Date();
			long currentTime = date.getTime();
			fileEntity.setUploadTime(new Date(currentTime));
			fileEntity.setFilePath(filePath);
			result = fileService.addUploadFile(fileEntity);
		}catch(Exception e){
			MisLog.error(log, "批量删除用户失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		if (result > 0) return "redirect:/pages/employee/employeeList.jsp";
        return "redirect:/exception.jsp";
	}
}
