package cn.itcast.scm.service;

import java.util.List;

import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;

public interface BaseService<T> {
	
	//根据主键插入
	int insert(T entity) throws Exception;
	//根据主键更新
	int updateByPk(T entity) throws Exception;
	//根据主键删除
	int deleteByPk(T entity) throws Exception;
	//根据主键查询
	T selectByPk(T entity);
	//根据对象动态生成sql语句
	List<T> selectUseDyc(T entity);
	//根据关键词分页单条件查询
	Page<T> selectPage(Page<T> page);
	//根据关键词分页双条件查询
	Page<T> selectPageListUseDyc(Page<T> page);
	
	//根据关键词分页3条件查询
	Page<T> selectPageListUseDyc2(Page<T> page);
	
	//通过主键（数组）批量多条删除
	public int deleteList(String[] pks) throws Exception;
}
