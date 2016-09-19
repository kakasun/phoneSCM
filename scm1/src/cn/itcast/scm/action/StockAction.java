package cn.itcast.scm.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Stock;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.StockService;
import cn.itcast.scm.service.StockService;

@Controller
@RequestMapping("/stock")
public class StockAction extends BaseAction {
	@Resource
	private StockService stockService;
	
	//向springmvc内部注入一个自定义的类型转换器
	//参数一，将string转成什么类型的字节码
	//自定义转换规则
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	
	//修改更新根据id
	@RequestMapping("/updateByPk")
	@ResponseBody
	public Object updateByPk(Stock stock){
		int i=0;
		try {
			i = stockService.updateByPk(stock);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	//新增
	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Stock stock) {
		
	
		System.out.println("-----action"+stock);
		int i=0;
		try {
			i = stockService.insert(stock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	

	
	
	//多条件
	@RequestMapping("/selectPageListUseDyc")
	@ResponseBody
	public Map<String,Object> selectPageUseDyc(Page<Stock> page,Stock stock,HttpServletRequest request){
		
		page.setParamEntity(stock);
		Page<Stock> p = stockService.selectPageListUseDyc(page);
		System.out.println(p.getTotalRecord());
		System.out.println("toString----stockAction"+stock.toString());
		System.out.println("===stockAction"+stock);
		System.out.println("goodsName=="+request.getParameter("goodsName"));
		System.out.println("goodsId=="+stock.getGoodsId());
		return p.getPageMap();
	}
	

		
}

