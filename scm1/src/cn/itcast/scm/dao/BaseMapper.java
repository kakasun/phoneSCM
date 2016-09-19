package cn.itcast.scm.dao;

import java.util.List;

import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.StoreHouse;




public interface BaseMapper<T> {

	//根据主键插入
	int insert(T entity);
	//根据主键更新
	int updateByPk(T entity);
	//根据主键删除
	int deleteByPk(T entity);
	//根据主键查询
	T selectByPk(T entity);
	//根据对象动态生成sql语句
	List<T> selectUseDyc(T entity);
	//通过关键词来分页单条件查找
	List<T> selectPage(Page<T> page);
	//查询总条数
	Integer selectCountPage(Page<T> page);
	
	//通过关键词来分页双条件查找
	List<T> selectPageListUseDyc(Page<T> page);
	//查询总条数（多）
	Integer selectPageCountUseDyc(Page<T> page);
	
	//通过关键词来分页双条件查找
	List<T> selectPageListUseDyc2(Page<T> page);
	//查询总条数（多）
	Integer selectPageCountUseDyc2(Page<T> page);
	
	//通过主键（数组）批量多条删除
	public int deleteList(String[] pks);
	
}