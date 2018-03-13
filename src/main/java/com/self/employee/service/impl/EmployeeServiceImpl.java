package com.self.employee.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.EmployeeQRCode;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.employee.dao.EmployeeMapper;
import com.self.employee.employeeVo.EmployeeVo;
import com.self.employee.entity.EmployeeEntity;
import com.self.employee.service.EmployeeService;

import tk.mybatis.mapper.entity.Example;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{
	
	private static final Logger log = LoggerFactory.getLogger(EmployeeServiceImpl.class);

	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 录入员工信息
	 */
	@Override
	public Integer addEmployee(EmployeeEntity employee) {
		// TODO Auto-generated method stub
		String id = UuidUtil.getUuid32().toString();
		employee.setId(id);
		employee.setDelFlag("0");
		Date date = new Date();
		long currentTime = date.getTime();
		employee.setJoinTime(new Date(currentTime));
		employee.setQrCodePath(GlobalCodeConstant.BASE_QRCODE_PATH + employee.getEmployeeCode());
		//生成不重复的员工编码（由六位数字组成）
		Set<Integer> m = new HashSet<Integer>();
		int a;
        for(int i=0;i<1;i++){
           do{
            a = (int)(Math.random()*1000000);
           }while(m.contains(a));
           m.add(a);
        }
        String str = m.toString();
        str = str.substring(1,str.length()-1);
        employee.setEmployeeCode(str);
		//生成员工的二维码
		EmployeeQRCode.zxingCodeCreate(employee.toString(), 300, 300, GlobalCodeConstant.BASE_QRCODE_PATH + employee.getEmployeeCode() + "/", "jpg");
		return employeeMapper.insert(employee);
	}
	
	/**
	 * 分页查询员工
	 */
	@Override
	public List<EmployeeEntity> findEmployeePage(EmployeeEntity employee,Page<EmployeeEntity> page) {
		Example example = new Example(EmployeeEntity.class);
		example.setOrderByClause("del_flag ASC");
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("delFlag","0");
		if(StringUtils.isNotEmpty(employee.getEmployeeName())){
			criteria.andLike("employeeName", "%" + employee.getEmployeeName() + "%");
		}
		if(StringUtils.isNotEmpty(employee.getEmployeeCode())){
			criteria.andEqualTo("employeeCode",employee.getEmployeeCode());
		}
		if(StringUtils.isNotEmpty(employee.getMajor())){
			criteria.andLike("major","%" + employee.getMajor() + "%");
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<EmployeeEntity> result = null; 
		try {
			
			result = employeeMapper.selectByCondition(example);
		}catch (Exception e) {
			// TODO: handle exception
			throw new SaveException("分页查询员工失败" + e);
		}
		return result;
	}
	
	/**
	 * 修改员工信息
	 */
	@Override
	public Integer updateEmployee(EmployeeEntity employee) {
		int result = GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
		    result = employeeMapper.updateByPrimaryKeySelective(employee);
		}catch (Exception e) {
			// TODO: handle exception
			throw new SaveException("修改分区数据失败" + e);
		}
		return result;
	}

	/**
	 * 逻辑删除员工信息
	 */
	@Override
	public Integer deleteEmployee(String id) {
		// TODO Auto-generated method stub
		EmployeeEntity employee = new EmployeeEntity();
		employee.setId(id);
		//设置为删除
		employee.setDelFlag("1");
		Integer result = null;
		try {
			result = employeeMapper.updateByPrimaryKeySelective(employee);
		} catch (Exception e) {
			// TODO: handle exception
			throw new UpdateException("删除员工出现错误"+e);
		}
		return result;
	}

	/**
	 * 通过id查询员工的信息
	 */
	@Override
	public EmployeeEntity findEmployeeById(String id) {
		// TODO Auto-generated method stub
		return employeeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int findEmployeeEntityByParams(Map<String, String> params) {
		// TODO Auto-generated method stub
		Example example = new Example(EmployeeEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return employeeMapper.selectCountByCondition(example);
	}

	/**
     * 批量导入时检查用户数据
     */
    @Override
    public Integer findEmployeeEntity(EmployeeEntity employee) {
        Example example = new Example(EmployeeEntity.class);
        Example.Criteria criteria = example.createCriteria();
        Integer result = null;
        try {
            result = employeeMapper.selectCountByCondition(example);
        } catch (Exception e) {
            throw new BaseException("批量导入时检查用户loginCount出错"+e);
        }
        return result;
    }

    /**
	 * 保存多个对象,如果抛出异常则需要事务回滚
	 */
	@Override
	@Transactional()
	public void saveEmployeeEntitys(List<EmployeeEntity> employeeEntities) {
		int i = 1;
		for(EmployeeEntity u:employeeEntities){
			try {
				employeeMapper.insert(u);
				i++;
			} catch (Exception e) {
				e.printStackTrace();
				throw new SaveException("导入数据出现异常，请检查第"+i+"条记录");
			}
		}
	}
	
	/**
	 * 根据员工id查询文件名和上传文件名
	 * @param id
	 * @return
	 */
	
	public List<EmployeeVo> findFileNameAndTime(String employeeId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", employeeId);
		List<EmployeeVo> result = null;
		try {
			result = sqlSession.selectList("self.employee.search_file_nameAndTime", param);
		} catch (Exception e) {
			throw new BaseException("查询文件名和上传文件名的查询"+e);
		}
		return result;
		
	}

	@Override
	public EmployeeEntity findEmployeeByUserAccount(String userAcccount) {
		// TODO Auto-generated method stub
		Example example = new Example(EmployeeEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("userAccount",userAcccount);
		List<EmployeeEntity> result = null; 
		try {
			
			result = employeeMapper.selectByCondition(example);
		}catch (Exception e) {
			// TODO: handle exception
			throw new SaveException("通过员工的登录名查询员工失败！" + e);
		}
		return result.get(0);
	}
}
