package cn.itcast.scm.action;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;


import cn.itcast.scm.entity.BuyOrder;
import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Page;

import cn.itcast.scm.service.BuyOrderService;


@Controller
@RequestMapping("/buyOrder")
public class BuyOrderAction extends BaseAction {
	@Resource
	private BuyOrderService buyOrderService;
	
	//向springmvc内部注入一个自定义的类型转换器
	//参数一，将string转成什么类型的字节码
	//自定义转换规则
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	

	
	//新增
	@RequestMapping("/insert")
	@ResponseBody
	public Object insertBuyOrder(BuyOrder buyOrder,String rows) {
		System.out.println("------rows"+rows);
		System.out.println("-----buyOrderaction"+buyOrder);
		ObjectMapper mapper = new ObjectMapper();
		BuyOrderDetail[] buyOrderDetails = null;
		int i=0;
		try {
			buyOrderDetails = mapper.readValue(rows, BuyOrderDetail[].class);
			buyOrder.setBuyOrderDetails(Arrays.asList(buyOrderDetails));
			i = buyOrderService.insertBuyOrder(buyOrder);
	//		i = buyOrderService.insert(buyOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	

	

		
}

