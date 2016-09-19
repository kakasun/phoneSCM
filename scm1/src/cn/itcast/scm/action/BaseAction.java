package cn.itcast.scm.action;

import javax.annotation.Resource;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/base")
public class BaseAction {
	@Resource//jeEE的，默认是按照byName方式注入   @Autowrite spring的，默认使用byType方式注入，因为bean的name具有唯一性，理论上是byName会快一点，但spring默认使用byType的方式注入
	ServletContext application;
	
	@RequestMapping("/goURL/{folder}/{file}")
	public String goURL( @PathVariable String folder, @PathVariable String file){
		System.out.println("/goURl/"+folder+"/"+file);
		
		return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
	}
	

}