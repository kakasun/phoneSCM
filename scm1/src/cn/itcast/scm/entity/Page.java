package cn.itcast.scm.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page<T> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2701602607093029832L;
	
	private Integer page;//当前页
	private Integer rows;//页大小，每页条数
	private Integer totalRecord;//总记录数。总条数
//	private Integer totalRows;//总页数
	private String keyWord;//查询关键字
	private T paramEntity;//多条件处理
	private Integer start;//需要这里处理
	private List<T> list;//装载页面的数据列表
	private Map<String,Object> pageMap = new HashMap<String,Object>();
	public Page(){}
	

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(Integer totalRecord) {
		//所以在设置List的时候连带把他加进了pageMap中
		pageMap.put("total", totalRecord);
		this.totalRecord = totalRecord;
	}

	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public T getParamEntity() {
		return paramEntity;
	}
	public void setParamEntity(T paramEntity) {
		this.paramEntity = paramEntity;
	}
	public Integer getStart() {
		this.start = (page - 1) * rows;
		return start;
	}
	public void setStart(Integer start) {
		
		this.start = start;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		//所以在设置List的时候连带把他加进了pageMap中
		pageMap.put("rows", list);
		this.list = list;
	}
	public Map<String, Object> getPageMap() {
		return pageMap;
	}
	public void setPageMap(Map<String, Object> pageMap) {
		this.pageMap = pageMap;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	

	
	
	
	
	
}
