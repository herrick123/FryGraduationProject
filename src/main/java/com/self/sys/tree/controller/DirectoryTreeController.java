package com.self.sys.tree.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.sys.tree.entity.DirectoryTree;
import com.self.sys.tree.entity.Tree;
import com.self.sys.tree.entity.TreeState;
import com.self.sys.tree.service.DirectoryTreeService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author sdh
 *
 */
@Controller
@RequestMapping("/directory")
public class DirectoryTreeController {
	private static final Logger log = LoggerFactory.getLogger(DirectoryTree.class);
	//目录列表页面
	private static String DIRECTORY_TREE_LIST_PAGE="/sys/directorytree/onedirectory";
	
	@Autowired
	private DirectoryTreeService directoryTreeService;

	
	/**
	 * 根目录页面
	 */
	@RequestMapping(value="/page")
	private String categotyPage(){
		MisLog.info(log, "根目录页面！");
		return DIRECTORY_TREE_LIST_PAGE;
	}
	
	/**
	 * 构造一棵树
	 * @return
	 */
	@RequestMapping(value = "/onetree")
	@ResponseBody
	public String createDirectoryTree(){
		MisLog.info(log, "构造一棵树");
		List<DirectoryTree> nodes = this.directoryTreeService.getAllResource();
		List<Tree> directoryTrees = new ArrayList<Tree>();
		try {
			for(DirectoryTree node:nodes){
		    	Tree tree = new Tree();
		    	tree.setId(node.getId());
			    tree.setParent(node.getParentId());
			    tree.setParentName(node.getParentName());
			    tree.setLeve(node.getLeve());
			    tree.setText(node.getName());
			    tree.setTreeCode(node.getTreeCode());
			    tree.setState(new TreeState());
			    directoryTrees.add(tree);	
			}
		} catch (Exception e) {
			MisLog.error(log, "构造一棵树失败",e);
		}		
		return JSON.toJSONString(directoryTrees, true); 
	}
	
	/**
	 * 构建树
	 */
	@RequestMapping(value = "/tree",method = RequestMethod.GET)
	@ResponseBody
	public String createDirectoryTreeByCode(String treeCode){
		MisLog.info(log, "构建树");
		DirectoryTree directoryTree = new DirectoryTree();
		directoryTree.setTreeCode(treeCode);
		List<DirectoryTree> nodes = this.directoryTreeService.findAllResourceByTreeCode(treeCode);
		List<Tree> directoryTrees = new ArrayList<Tree>();
		if(!nodes.isEmpty()){
			for(DirectoryTree node:nodes){
				if(node.getLeve() == 1){
					//构造一个root节点
					Tree root = new Tree();
					root.setId(node.getId());
					root.setParent(node.getParentId());
					root.setText(node.getName());
					//设置根节点并默认打开
					root.setState(new TreeState(true,false,true));
					directoryTrees.add(root);
					
				}else{
			    	Tree tree = new Tree();
			    	tree.setId(node.getId());
				    tree.setParent(node.getParentId());
				    tree.setText(node.getName());
				    tree.setState(new TreeState());
				    directoryTrees.add(tree);
				}		
			}
		}
		return JSON.toJSONString(directoryTrees, true); 
	}
	
	/**
	 * 目录列表
	 */
	@ResponseBody
	@RequestMapping(value = "/find",method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	public String findClassByParent(Model model,String gridPager){
		MisLog.info(log,"目录列表!!");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject treeJson = json.getJSONObject("parameters");		
		String parentId = treeJson.getString("parentId");
		Page<DirectoryTree> page = JSONObject.toJavaObject(json, Page.class);
		DirectoryTree cla = JSONObject.toJavaObject(treeJson, DirectoryTree.class);
	    List<DirectoryTree> ResourceTrees=this.directoryTreeService.findResourceByParent(cla, page);
	    PageInfo<DirectoryTree> pageInfo = new PageInfo<DirectoryTree>(ResourceTrees);
		page = new Page<DirectoryTree>(pageInfo);
		return JSONObject.toJSONString(page);
     }
	
	/**
	 * 新增节点
	 */
	@RequestMapping(value = "/save",method = RequestMethod.POST)
	@ResponseBody
    public String saveResource(DirectoryTree directoryTree){
		MisLog.info(log, "新增节点！");
		JSONObject json = JSONObject.parseObject("{}");
	    directoryTreeService.saveResource(directoryTree);
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		return json.toJSONString();
   }
	
	/**
	 * 更新节点信息
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateResource(DirectoryTree directoryTree){
		MisLog.info(log, "更新节点信息！");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			directoryTreeService.updateResource(directoryTree);
			directoryTreeService.updateAllChildParentName(directoryTree);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, "更新节点失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	   }
	

	/**
	 * 删除时查询此ID及其所有子ID
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteTree",method=RequestMethod.POST)
	public String findAllDeleteChildId(String[] ids){
		MisLog.info(log, "删除目录！");
		JSONObject json = JSONObject.parseObject("{}");
		try{
			String booleans = directoryTreeService.findAllThisAndChildsId(ids);			
			//如果是组织机构，不允许删除
			if(("yes").equals(booleans)){
				json.put("deletes", "0");
			}else{
				//如果不是组织机构，判断是组织机构下的部门，如果是，判断是否有用户，有用户不可以删除
				if(("trues").equals(booleans)){
					json.put("deletes", "1");
				}else{
					//别的部门随意删除
					json.put("deletes", "2");
				}
			}			
		} catch(Exception e){
			MisLog.error(log, "删除目录失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}		
	
	/**
	 * 新增判断目录名
	 * @param name
	 * @return
	 */	
	@ResponseBody
	@RequestMapping(value = "/checkName")
	public String checkName(HttpServletRequest request){
		MisLog.info(log, "新增判断目录名！");
		JSONObject json = JSONObject.parseObject("{}");
		String name=request.getParameter("name");
		try {		
		    if(StringUtils.isNotEmpty(name)){
		        DirectoryTree directoryTree = new DirectoryTree();
		        directoryTree.setName(name);
		        List<DirectoryTree> directoryTrees = directoryTreeService.checkName(directoryTree);
			        if(directoryTrees.isEmpty()){	    	   
			    	    json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);	    	   		       
			        }else{
			    	    json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);	    	   
			       	 }
		   	 }else{
		         json.put("returncode", GlobalCodeConstant.BASE_INPUT_CODE);
		   	  }			
        } catch (Exception e){
			MisLog.error(log, "新增目录名出错!", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}	
	    return json.toJSONString();
	 }
	
	/**
	 * 新增判断treeCode
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkTreeCode")
	public String checkTreeCode(HttpServletRequest request){
		MisLog.info(log, "新增判断treeCode！");
		JSONObject json = JSONObject.parseObject("{}");
		String treeCode=request.getParameter("treeCode");
		try {
			request.setCharacterEncoding("UTF-8");
		    if(StringUtils.isNotEmpty(treeCode)){
			    DirectoryTree directoryTree = new DirectoryTree();
			    directoryTree.setTreeCode(treeCode);
			    List<DirectoryTree> directoryTrees = directoryTreeService.checktreeCode(directoryTree);
			    if(directoryTrees.isEmpty()){
			    	json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
			     }else{
			    	 json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
			      }		   
			   }else{
				   json.put("returncode", GlobalCodeConstant.BASE_INPUT_CODE);
			    }
		} catch (Exception e){
			MisLog.error(log, "新增treeCode出错!", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}		
	    return json.toJSONString();
	 }
	
	/**
	 * 编辑时检查name
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkEditName")
	public String checkEditName(HttpServletRequest request){
		MisLog.info(log, "编辑检查name！");
		JSONObject json = JSONObject.parseObject("{}");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		try {
			request.setCharacterEncoding("UTF-8");
			if(StringUtils.isNotEmpty(name)){
				DirectoryTree directoryTree = new DirectoryTree();
			    directoryTree.setName(name);
			    List<DirectoryTree> directoryTrees = directoryTreeService.checkName(directoryTree);
			    if(directoryTrees.isEmpty()){
			    	//name改变且没有重复
			    	json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
			    }else if(directoryTrees.size() == 1){
			    	//name没改变
			    	if(directoryTrees.get(0).getId().equals(id)){
			    		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE); 
			    	}else{	    		   
			    		//name改变重复id
			    		json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
			    	   }	    	   
			       }else{
			    	   json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);  
			       }
			   }else{
				   json.put("returncode", GlobalCodeConstant.BASE_INPUT_CODE);		   
			   }
        } catch (Exception e){
			MisLog.error(log, "编辑目录名称出错!", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}	  
	    return json.toJSONString();
	}
	
	/**
	 * 编辑判断treeCode
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkEditTreeCode")
	public String checkEditTreeCode(HttpServletRequest request){
		MisLog.info(log, "编辑treeCode！");
		JSONObject json = JSONObject.parseObject("{}");
		String treeCode = request.getParameter("treecode");
		String id = request.getParameter("id");
		try {
			request.setCharacterEncoding("UTF-8");
			if(StringUtils.isNotEmpty(treeCode)){
		    	DirectoryTree directoryTree = new DirectoryTree();
		    	directoryTree.setTreeCode(treeCode);
		    	directoryTree.setParentId("#");
		        List<DirectoryTree> directoryTrees = directoryTreeService.checkName(directoryTree);
		        if(directoryTrees.isEmpty()){
		    	    //treeCode改变且没有重复
		    	    json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		        } else if(directoryTrees.size() == 1){
		    	    //treeCode没改变
		    	    if(directoryTrees.get(0).getId().equals(id)){
		    		    json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);	    		  
		    	    }else{
		    		    //treeCode改变重复id
		    		    json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);	    		   
		    	    }	    	 	    	   
		        }else{
		    	    json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		        }
		    }else{
			    json.put("returncode", GlobalCodeConstant.BASE_INPUT_CODE);
		    }
		} catch (Exception e){
			MisLog.error(log, "编辑treeCode出错!", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
	    return json.toJSONString();
	}
	
	/**
	 * 返回treeCode
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getTreeCode")
	public String getInfoById(HttpServletRequest request){
		MisLog.info(log, "返回treeCode");
		String id = request.getParameter("id");
		return directoryTreeService.findResourceInfo(id).getTreeCode();
	}
	
	/**
	 * 返回级别
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getLevel")
	public Integer getLeveInfoById(HttpServletRequest request){
		MisLog.info(log, "返回级别！");
		String id = request.getParameter("id");
		return directoryTreeService.findResourceInfo(id).getLeve();
	}
	
	
}
