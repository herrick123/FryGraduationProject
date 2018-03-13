package com.self.sys.tree.service.impl;

import com.core.constant.GlobalCodeConstant;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.sys.tree.dao.DirectoryTreeMapper;
import com.self.sys.tree.entity.DirectoryTree;
import com.self.sys.tree.entity.Tree;
import com.self.sys.tree.entity.TreeState;
import com.self.sys.tree.service.DirectoryTreeService;
import com.self.sys.user.service.UserService;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author sdh
 *
 */
@Service("DirectoryTreeService")
public class DirectoryTreeServiceImpl implements DirectoryTreeService {

	@Autowired
	private DirectoryTreeMapper directoryTreeMapper;
	@Autowired
	private UserService userService;
	@Autowired
    SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 创建树
	 */
	@Override
	public List<DirectoryTree> findAllResourceByTreeCode(String treeCode) {
	    Example example=new Example(DirectoryTree.class);
	    Example.Criteria criteria=example.createCriteria();
        criteria.andEqualTo("treeCode", treeCode);
        return directoryTreeMapper.selectByCondition(example);
	}
	
	/**
	 * 通过treeCode创建目录树
	 */
	@Override
	public List<Tree> createOneTree(String treeCode){
		DirectoryTree directoryTree = new DirectoryTree();
		directoryTree.setTreeCode(treeCode);
		List<DirectoryTree> nodes = findAllResourceByTreeCode(directoryTree.getTreeCode());
		List<Tree> oneTree = new ArrayList<Tree>();
		if(!nodes.isEmpty()){
			for(DirectoryTree node:nodes){
				Tree tree = new Tree();
				tree.setId(node.getId());
				tree.setParent(node.getParentId());
				tree.setText(node.getName());
				if(node.getLeve() == 1){
					//设置根节点并默认打开
					tree.setState(new TreeState(true,false,true));
				}else{
					tree.setState(new TreeState());
				}	
				oneTree.add(tree);
			}
		}
		return oneTree;
	}	

    /**
     * 展示列表
     */
	@Override
	public List<DirectoryTree> findResourcePageByTreeCode(DirectoryTree directoryTree, Page<DirectoryTree> page) {
		Example example=new Example(DirectoryTree.class);
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		return directoryTreeMapper.selectByCondition(example);
	}
	
    /**
     * 增加节点
     */
	@Override
	public Integer saveResource(DirectoryTree directoryTree) {
		String id = UuidUtil.getUuid36();
		directoryTree.setId(id);
		directoryTree.setCreateTime(new Timestamp(System.currentTimeMillis()));
		directoryTree.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		//directoryTree.setParentName("根");
		directoryTree.setCreateId(id);
		directoryTree.setUpdateId(id);
		return directoryTreeMapper.insert(directoryTree);
	}
	
    /**
     * 查看目录详情
     */
	@Override
	public DirectoryTree findResourceInfo(String id) {
		return directoryTreeMapper.selectByPrimaryKey(id);
	}

	/**
	 * 更新目录
	 */
	@Override
	public Integer updateResource(DirectoryTree directoryTree) {
		directoryTree.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		return directoryTreeMapper.updateByPrimaryKeySelective(directoryTree);
	}
    
	/**
	 * 根据目录名查看目录详情
	 */
	@Override
	public List<DirectoryTree> findResourceByName(DirectoryTree directoryTree, Page<DirectoryTree> page) {
		// TODO Auto-generated method stub
		return null;
	}
	
    /**
     * 根据父目录查找子目录
     */
	@Override
	public List<DirectoryTree> findResourceByParent(DirectoryTree directoryTree, Page<DirectoryTree> page) {
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		//return directoryTreeMapper.select(directoryTree);
		Example example = new Example(DirectoryTree.class);
		Example.Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(directoryTree.getParentId())){
			criteria.andEqualTo("parentId", directoryTree.getParentId());
		}else{
			criteria.andEqualTo("parentId", "#");
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());		
		return directoryTreeMapper.selectByCondition(example);
	}
	
	 /**
     * 根据id查询并删除所有的子节点
     */
	@Override
	public Integer selectAndDeleteAllChilds(String id) {
		List<String> idList = sqlSessionTemplate.selectList("sodb.directory.findAllThisAndChildsId", id);
		Example example = new Example(DirectoryTree.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("id", idList);
	    return directoryTreeMapper.deleteByCondition(example);
	}
	
	/**
	 * 根据要删除的ID来查询出此ID及其子ID
	 */
	@Override
	public String findAllThisAndChildsId(String[] ids) {		
		for(String id:ids){
			DirectoryTree dire  = directoryTreeMapper.selectByPrimaryKey(id);
			String directoryTreeCode = dire.getTreeCode();
			String directoryTreeParentName = dire.getParentName();		
			//判断该部门是否为组织机构部门，是则不允许删除，不是可以删除
			if(("根").equals(directoryTreeParentName)&&(GlobalCodeConstant.DEPARTMENT_TREE_CODE).equals(directoryTreeCode)){
				return "yes";				
			}else{				
				//判断该部门是否为组织机构部门，如果是则判断该部门下是否有用户，有用户不允许删除，不是组织机构部门则可以删除
				if((GlobalCodeConstant.DEPARTMENT_TREE_CODE).equals(directoryTreeCode)){
					//查询出所有ID
					List<String> idList = sqlSessionTemplate.selectList("sodb.directory.findAllThisAndChildsId", id);
					//把ID传入user表中
					boolean booleans = userService.findIsHaveUser(idList);						
					if(booleans){
						return "trues";
					}else{
						this.selectAndDeleteAllChilds(id);						
					}	
				}else{
					//执行删除
					this.selectAndDeleteAllChilds(id);	
				}
			}
		}
		return "falses";	
	}
	
    /**
     * 根据查询条件查询节点
     */
	@Override
	public List<DirectoryTree> searchDirectory(DirectoryTree directoryTree, Page<DirectoryTree> page) {
		Example example=new Example(DirectoryTree.class);
		Example.Criteria rCriteria=example.createCriteria();
		if(StringUtils.isNotEmpty(directoryTree.getName())){
			rCriteria.andLike("name","%"+directoryTree.getName()+"%");
		}
		if(StringUtils.isNotEmpty(directoryTree.getLeve()+"")){
			rCriteria.andEqualTo("leve", directoryTree.getLeve());
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		return directoryTreeMapper.selectByCondition(example);
	}
	
   
	/**
	 * 新增/编辑时判断目录名重复
	 */
	@Override
	public List<DirectoryTree> checkName(DirectoryTree directoryTree) {
		// TODO Auto-generated method stub
		return directoryTreeMapper.select(directoryTree);
	}
    
	/**
	 * 新增/编辑时判断目录编号重复
	 */
	@Override
	public List<DirectoryTree> checktreeCode(DirectoryTree directoryTree) {
		// TODO Auto-generated method stub
		return directoryTreeMapper.select(directoryTree);
	}
    
	/**
	 * 编辑时设置所有子节点treeCode改变
	 */
	@Override
	public Integer updateAllChildTreeCode(DirectoryTree directoryTree) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("sodb.directory.updateAllChildTreeCode",directoryTree);
	}
	
	/**
	 * 编辑时设置所有子节点parentName改变
	 */
	@Override
	public Integer updateAllChildParentName(DirectoryTree directoryTree) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("sodb.directory.updateAllChildParentName",directoryTree);
	}

	/**
	 * 从数据库得到所有的资源
	 */
	@Override
	public List<DirectoryTree> getAllResource() {
		// TODO Auto-generated method stub
		return directoryTreeMapper.selectAll();
	}

    @Override
    public List<String> getAllChildsId(String id) {
        // TODO Auto-generated method stub
        List<String> childsId = sqlSessionTemplate.selectList("sodb.directory.findAllChildsByParentId", id);
        return childsId;
    }

	@Override
	public List<DirectoryTree> findChildren(DirectoryTree directoryTree) {
		Example example=new Example(DirectoryTree.class);
	    Example.Criteria criteria=example.createCriteria();
        criteria.andEqualTo("parentId", directoryTree.getParentId());
        return directoryTreeMapper.selectByCondition(example);
	}

}
