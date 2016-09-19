package cn.itcast.scm.action;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.itcast.scm.entity.AccountRecords;
import cn.itcast.scm.entity.Page;

import cn.itcast.scm.service.AccountRecordsService;


@Controller
@RequestMapping("/accountRecords")
public class AccountRecordsAction extends BaseAction {
	@Resource
	private AccountRecordsService accountRecordsService;
	
	
	
	//修改更新根据id
	@RequestMapping("/updateByPk")
	@ResponseBody
	public Object updateByPk(AccountRecords accountRecords){
		int i=0;
		try {
			i = accountRecordsService.updateByPk(accountRecords);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//新增
	@RequestMapping("/insert")
	@ResponseBody
	public Object insertAccountRecords(AccountRecords accountRecords) {
		
	
		System.out.println("-----action"+accountRecords);
		int i=0;
		try {
			i = accountRecordsService.insert(accountRecords);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	//批量删除
	@RequestMapping("/deleteList")
	@ResponseBody
	public Object deleteList(String[] pks){
		int i = 0;
			try {
				i = accountRecordsService.deleteList(pks);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return i;
	}
	
	
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Map<String,Object> selectAll(AccountRecords accountRecords){
		List<AccountRecords> accountRecordsList = accountRecordsService.selectUseDyc(accountRecords);
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		map.put("total", accountRecordsList.size());
		map.put("rows", accountRecordsList);
		return map;
	}
	//多条件查询
	@RequestMapping("/selectPageListUseDyc")
	@ResponseBody
	public Object selectPageListUseDyc(Page<AccountRecords> page,AccountRecords accountRecords){
		page.setParamEntity(accountRecords);
		Page<AccountRecords> p = accountRecordsService.selectPageListUseDyc(page);
		
		return p.getPageMap();
		
	}
	
	//单条件查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Object selectByPage(Page<AccountRecords> page){
		
		Page<AccountRecords> selectPage = accountRecordsService.selectPage(page);
		Map<String,Object> map = new HashMap<String,Object> ();
		map.put("total", selectPage.getTotalRecord());
		map.put("rows", selectPage.getList());
		return map;
		
	}
		
}

