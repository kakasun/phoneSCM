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


import cn.itcast.scm.entity.AccountRecords;
import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Page;

import cn.itcast.scm.service.BuyOrderDetailService;


@Controller
@RequestMapping("/buyOrderDetail")
public class BuyOrderDetailAction extends BaseAction {
	@Resource
	private BuyOrderDetailService buyOrderDetailService;
	
	
	//多条件分页查询
	@RequestMapping("/selectPageListUseDyc")
	@ResponseBody
	public Object selectBuyOrderDetailList(Page<BuyOrderDetail> page, BuyOrderDetail buyOrderDetail) {
		
	
		System.out.println("-----action"+buyOrderDetail);
		
		page.setParamEntity(buyOrderDetail);
		Page<BuyOrderDetail> p = buyOrderDetailService.selectPageListUseDyc(page);
		
		
		return p.getPageMap();
	}
	
	//多条件分页采购查询
	@RequestMapping("/selectPageListUseDyc2")
	@ResponseBody
	public Object selectBuyOrderDetailList2(Page<BuyOrderDetail> page, BuyOrderDetail buyOrderDetail,HttpServletRequest request) {
		
	
		System.out.println("-----action2"+buyOrderDetail);
		System.out.println("buyOrderDetail.boid=="+buyOrderDetail.getBoId());
		System.out.println("buyOrderDetail.GoodsName=="+buyOrderDetail.getGoodsName());
		System.out.println("request.boid=="+request.getParameter("boId"));
		page.setParamEntity(buyOrderDetail);
		Page<BuyOrderDetail> p = buyOrderDetailService.selectPageListUseDyc2(page);
		
		
		return p.getPageMap();
	}

	

		
}

