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


import cn.itcast.scm.entity.ReturnOrder;
import cn.itcast.scm.entity.ReturnOrderDetail;
import cn.itcast.scm.entity.Page;

import cn.itcast.scm.service.ReturnOrderService;


@Controller
@RequestMapping("/returnOrder")
public class ReturnOrderAction extends BaseAction {
	@Resource
	private ReturnOrderService returnOrderService;
	
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
	public Object insertReturnOrder(ReturnOrder returnOrder,String rows) {
		System.out.println("------rows"+rows);
		System.out.println("-----returnOrderaction"+returnOrder);
		ObjectMapper mapper = new ObjectMapper();
		ReturnOrderDetail[] returnOrderDetails = null;
		int i=0;
		try {
			//将json变成数组
			returnOrderDetails = mapper.readValue(rows, ReturnOrderDetail[].class);
			//将数组变成list
			returnOrder.setReturnOrderDetails(Arrays.asList(returnOrderDetails));
			i = returnOrderService.insertReturnOrder(returnOrder);
	//		i = returnOrderService.insert(returnOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	

		
}

