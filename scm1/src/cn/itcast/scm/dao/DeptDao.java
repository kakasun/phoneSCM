package cn.itcast.scm.dao;

import java.util.List;

import cn.itcast.scm.entity.Dept;

public interface DeptDao<Dept> extends BaseMapper<Dept> {
	
	public Dept selectDept(Integer deptId);
	public int insertDept(Dept dept);

}
