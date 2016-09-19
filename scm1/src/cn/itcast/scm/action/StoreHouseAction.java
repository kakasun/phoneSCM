package cn.itcast.scm.action;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.StoreHouse;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.StoreHouseService;

@Controller
@RequestMapping("/storeHouse")
public class StoreHouseAction extends BaseAction {
	@Resource
	private StoreHouseService storeHouseService;
	
	//修改更新根据id
	@RequestMapping("/updateByPk")
	@ResponseBody
	public Object updateByPk(StoreHouse storeHouse){
		int i=0;
		try {
			i = storeHouseService.updateByPk(storeHouse);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	//新增
	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(StoreHouse storeHouse) {
		
	
		System.out.println("-----action"+storeHouse);
		int i=0;
		try {
			i = storeHouseService.insert(storeHouse);
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
				i = storeHouseService.deleteList(pks);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return i;
	}
	
	
	//多条件
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Map<String,Object> selectPageUseDyc(Page<StoreHouse> page,StoreHouse storeHouse){
		
		page.setParamEntity(storeHouse);
		Page<StoreHouse> p = storeHouseService.selectPageListUseDyc(page);
		System.out.println(p.getTotalRecord());
		return p.getPageMap();
	}
	
	//但条件
	@RequestMapping("/selectAll")
	@ResponseBody
	public Map<String,Object> selectAll(StoreHouse storeHouse){
		System.out.println("欢迎");
		List<StoreHouse> storeHouseList = storeHouseService.selectUseDyc(storeHouse);
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		map.put("total", storeHouseList.size());
		map.put("rows", storeHouseList);
		System.out.println("你好store啊");
		return map;
	}
		
}

