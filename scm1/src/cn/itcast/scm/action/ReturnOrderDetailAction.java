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

import cn.itcast.scm.service.ReturnOrderDetailService;


@Controller
@RequestMapping("/returnOrderDetail")
public class ReturnOrderDetailAction extends BaseAction {
	@Resource
	private ReturnOrderDetailService returnOrderDetailService;
	
	//向springmvc内部注入一个自定义的类型转换器
	//参数一，将string转成什么类型的字节码
	//自定义转换规则
	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	


	

		
}

