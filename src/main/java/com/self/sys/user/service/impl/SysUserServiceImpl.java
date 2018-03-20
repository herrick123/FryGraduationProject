package com.self.sys.user.service.impl;


import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.MD5Util;
import com.core.util.MisUtil;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.employee.entity.EmployeeEntity;
import com.self.sys.role.service.RoleService;
import com.self.sys.tree.dao.DirectoryTreeMapper;
import com.self.sys.tree.entity.DirectoryTree;
import com.self.sys.tree.service.DirectoryTreeService;
import com.self.sys.user.dao.SysUserMapper;
import com.self.sys.user.entity.SysUserEntity;
import com.self.sys.user.service.SysUserService;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.*;

/**
 * @author 黄青山
 *
 */
@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService {
	@Autowired
	private SysUserMapper usermapper;
	@Autowired
    private DirectoryTreeService directoryTreeService;
	@Autowired
	private DirectoryTreeMapper directoryTreeMapper;
	@Autowired
	private RoleService roleService;
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 分页查询用户
	 */
	@Override
	public List<SysUserEntity> findUserPage(SysUserEntity user, Page<SysUserEntity> page) {
		Integer level = Integer.valueOf(1);
		if(user.getDepartmentId() != null){
			DirectoryTree tree = directoryTreeMapper.selectByPrimaryKey(user.getDepartmentId());
			level = tree.getLeve();
		}	
		Map<String, String> map = new HashMap<String, String>();
		map.put("userAccount", user.getUserAccount());
		map.put("userName", user.getUserName());
		map.put("departmentName", user.getDepartmentName());
		map.put("departmentId",user.getDepartmentId());	
		//点击组织机构会查所有用户
		if (StringUtils.isEmpty(user.getUserName()) && StringUtils.isEmpty(user.getUserAccount()) && 
				StringUtils.isEmpty(user.getDepartmentName()) && level == 1) {
			PageHelper.startPage(page.getNowPage(),page.getPageSize());
			return sqlSession.selectList("sodb.user.findAllUser", map);
		}	
        PageHelper.startPage(page.getNowPage(),page.getPageSize());
    	return sqlSession.selectList("sodb.user.useDeparmentIdfindUser", map);			
	}
	
	/**
	 * 保存用户
	 */
	@Override
	public Integer saveUserEntity(SysUserEntity user) {
		String id = UuidUtil.getUuid36();
		Date date = new Date();
		long currentTime = date.getTime();
		user.setUserId(id);
		user.setCreateTime(new Date(currentTime));
		user.setUpdateTime(new Date(currentTime));
		user.setUpdateID("1");
		user.setUsserStatus(1);
		user.setCreateID("1");
		user.setTitle("0");
		//为用户设置初始（默认）密码
		//user.setUserPass(GlobalCodeConstant.DEFAULT_PASSWORD);
		int result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = usermapper.insert(user);
		} catch (Exception e) {
			throw new SaveException("添加用户失败!"+e);
		}
		return result;
	}
	
	/**
	 * 更新用户
	 */
	@Override
	public Integer updateUserEntity(SysUserEntity user) {
		Date date = new Date();
		long currentTime = date.getTime();
		user.setUpdateTime(new Date(currentTime));
		user.setUpdateID("ceshi-id");
		int result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = usermapper.updateByPrimaryKeySelective(user);
		} catch (Exception e) {
			throw new UpdateException("更新用户失败!"+e);
		}
		return result;
	}
	
	/**
	 * 批量/单个删除用户
	 * 通过传入的ids数组，将数组转为list集合
	 * 去掉重复的角色id，并放入list集合
	 */
	@Override
	public Boolean deleteUserEntity(String[] ids) {
		List<String> params = MisUtil.arrayTransList(ids);
		Example example = new Example(SysUserEntity.class);
		example.selectProperties("role");
		example.isDistinct();//去重（重复角色）
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("userId",params );//去重之后，通过用户ID找到这些用户的角色ID
		List<SysUserEntity> roleList = usermapper.selectByCondition(example);
		List<String> roleIds = new ArrayList<String>();
		for(SysUserEntity userEntity : roleList){
			roleIds.add(userEntity.getRole());//将角色ID放入集合当中
		}
		Boolean flag = roleService.selectRoleCode(roleIds);
		if(flag){
			//存在管理员，删除失败
			return Boolean.FALSE;
		}else{			
			/**
			 * 假删除思路
			 * for(UserEntity user : roleList){
			 *     user.setSate(1);
			 *     update **** 只修改一个字段不修改null字段的那个方法
			 *     return ;
			 * }
			 */
			usermapper.deleteByCondition(example);
			return Boolean.TRUE;
		}	
	}
	
	/**
	 * 单个删除用户
	 * 通过传入的id,改变user表中的userStatus的状态
	 */
	@Override
	public Integer deleteOneUserEntity(String id) {
		SysUserEntity user = new SysUserEntity();
		user.setUserId(id);
		//设置为删除
		user.setUserStatus(1);
		Integer result = null;
		try {
			result = usermapper.updateByPrimaryKeySelective(user);
		} catch (Exception e) {
			// TODO: handle exception
			throw new UpdateException("删除员工出现错误"+e);
		}
		return result;
	}
	
	/**
	 * 通过用户id查询用户信息
	 */
	@Override
	public SysUserEntity findUserEntityInfo(String id) {
		return usermapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 通过传入的参数查询用户
	 * 参数以map形式传入，每一个条件用and连接
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findUserEntityByParams(Map<String, String> params) {
		Example example = new Example(SysUserEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return usermapper.selectCountByCondition(example);
	}
	
	/**
	 * 通过传入的参数查询用户
	 * 参数params以map形式传入，每一个条件用and连接
	 * 参数notEqual以map形式传入，条件是<>,例如：userid<>1;
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findUserEntityByAnd(Map<String, String> params, Map<String, String> notEqual) {
		Example example = new Example(SysUserEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		for (String key:notEqual.keySet()) {
			criteria.andNotEqualTo(key, notEqual.get(key));
		}
		Integer result = null;
		try {
			result = usermapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("用户查重出错"+e);
		}
		return result;
	}
	
	/**
	 * 通过传入的参数查询用户
	 * 参数params以map形式传入，每一个条件用or连接
	 * 参数notEqual以map形式传入，条件是<>,例如：userid<>1;
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findUserEntityByOr(String[] arr,Map<String, String> notEqual) {
		Example example = new Example(SysUserEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andCondition("("+arr[0].toString()+"= '"+arr[1].toString()+"' or "+arr[2].toString()+" = '"+arr[3].toString()+"')");
		for (String key:notEqual.keySet()) {
			criteria.andNotEqualTo(key, notEqual.get(key));
		}
		Integer result = null;
		try {
			result = usermapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("用户查重出错"+e);
		}
		return result;
	}
	
	/**
	 * 重置密码
	 */
	@Override
	public void resetUserEntity(String[] ids) {
		for(String id : ids){
			SysUserEntity userEntity = new SysUserEntity();
			userEntity.setUserId(id);
			userEntity.setUserPass(MD5Util.string2MD5(GlobalCodeConstant.DEFAULT_PASSWORD));
			try {
				usermapper.updateByPrimaryKeySelective(userEntity);
			} catch (Exception e) {
				throw new UpdateException("重置密码出现错误"+e);
			}
		}
	}

    @Override
    public String selectDepartmentName(String departmentId) {
    	DirectoryTree directoryTree = directoryTreeService.findResourceInfo(departmentId);
    	return directoryTree.getName();
    }

    //查询部门列表
    @Override
    public List<String> listDepartment() {
        DirectoryTree directoryTree = new DirectoryTree();
        directoryTree.setTreeCode("org_ma");
        List<DirectoryTree> departmentList = directoryTreeService.findAllResourceByTreeCode(directoryTree.getTreeCode());
        List<String> idList = new ArrayList<String>();
        for(DirectoryTree department : departmentList) {
            List<String> list = directoryTreeService.getAllChildsId(department.getId());
           if(list.size()==0) {
               idList.add(department.getId());
           }
        }
        return idList;
    }
    
	/**
	 * 用户登录
	 */
    @Override
    public SysUserEntity login(String userAccount) {
        Example example = new Example(SysUserEntity.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userAccount",userAccount);
        SysUserEntity userEntity = null;
        try {
        	userEntity = usermapper.selectByCondition(example).get(0);
		} catch (Exception e) {
			// TODO: handle exception
			throw new UpdateException("利用用户登录名查询用户"+e);
		}
        return userEntity;
    }
    
    /**
     * 验证该部门下是否有用户
     */
    @Override
	public boolean findIsHaveUser(List<String> idList) {
		Example example = new Example(SysUserEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("departmentId", idList);
		List<SysUserEntity> userList = usermapper.selectByCondition(example);
		if (userList != null && !userList.isEmpty()) {
			return true;
		} else {
			return false;
		}

	}
    
    
}
