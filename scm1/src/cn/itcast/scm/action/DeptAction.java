package cn.itcast.scm.action;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.scm.dao.DeptDao;
import cn.itcast.scm.entity.Dept;

@Controller
@RequestMapping("/dept")
public class DeptAction {
	
	@Resource
	private DeptDao deptDao;
	@RequestMapping("/select")
	public Dept selectDept(Integer deptId){
		Dept dept = (Dept) deptDao.selectDept(deptId);
		return dept;
	}
	@RequestMapping("/insert")
	public String insertDept(Dept dept){
		String name = dept.getDeptName();
		String address = dept.getDeptAddress();
		System.out.println(name+address);
		System.out.println("-----action"+dept);
		int id = deptDao.insertDept(dept);
		
		return "forward:/jsp/main.jsp";
	}
}
