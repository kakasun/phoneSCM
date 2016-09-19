package cn.itcast.scm.action;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierAction extends BaseAction{
	
	
	@Resource
	private SupplierService supplierService;
	
	//根据主键修改
	@RequestMapping("updateByPk")
	@ResponseBody
	public Object updateByPk(Supplier supplier){
		int i = 0;
		try {
			i = supplierService.updateByPk(supplier);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
		
	}
	
	//新增
	@RequestMapping("/insert")
	@ResponseBody
	public Object insertSupplier(Supplier supplier) {
		
	
		System.out.println("-----action"+supplier);
		int i=0;
		try {
			i = supplierService.insert(supplier);
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
				i = supplierService.deleteList(pks);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return i;
	}
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Map<String,Object> selectAll(Supplier supplier){
		List<Supplier> supplierList = supplierService.selectUseDyc(supplier);
		Map<String,Object> map = new LinkedHashMap<String,Object>();
	//	System.out.println(supplierList.size());
		map.put("total", supplierList.size());
		map.put("rows", supplierList);
		
		
		return map;
	}
	//多条件分页查询
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<Supplier> page,Supplier supplier){
		
		page.setParamEntity(supplier);
		Page<Supplier> p = supplierService.selectPageListUseDyc(page);
		
		System.out.println("你好，你通过点击供应商管理，先发送请求到baseActin,再通过supplierList页面发送请求到SupplierAction,我返回数据给你了:::"+p.getTotalRecord());
		System.out.println(supplier.getSupAddress()+"---地址啊");
		return p.getPageMap();
	} 
	
	
	//单条件分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Object selectByPage(Page<Supplier> page){


		Page<Supplier> selectPage = supplierService.selectPage(page);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", selectPage.getTotalRecord());
		map.put("rows", selectPage.getList());
		System.out.println(selectPage.getTotalRecord());
		return map; 
	}
	
/*	@RequestMapping("/selectByPage")
	@ResponseBody
	public Object selectByPage(Page<Supplier> page,HttpServletRequest request){
	//	Page<Supplier> supplierPage = supplierService.selectPage(page);
		String page1 = request.getParameter("page");
		String rows = request.getParameter("rows");
		String keyWord = request.getParameter("keyWord");
		
		
		
		Page<Supplier> pages = new Page<Supplier>();
		pages.setPage(Integer.parseInt(page1));
		pages.setKeyWord(keyWord);
		pages.setRows(Integer.parseInt(rows));
		Page<Supplier> selectPage = supplierService.selectPage(pages);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", selectPage.getTotalRecord());
		map.put("rows", selectPage.getList());
		System.out.println(page1+rows);
		return map;
	}*/
	

	
	@RequestMapping("/ajax")
	@ResponseBody
	public Object ajax(Supplier supplier)throws Exception{
		System.out.println("----欢迎ajax:"+supplier);
		supplier.setSupName("明见");
		
		return supplier;
	}

	
}
