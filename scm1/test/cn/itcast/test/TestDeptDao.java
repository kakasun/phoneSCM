package cn.itcast.test;
import org.junit.BeforeClass;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.itcast.scm.dao.DeptDao;
import cn.itcast.scm.entity.Dept;


public class TestDeptDao {
	
	static private DeptDao deptDao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception{
		ApplicationContext context =new
				ClassPathXmlApplicationContext("applicationContext.xml");
		deptDao = (DeptDao)context.getBean("deptDao");
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception{
		
	}
	
	@Test
	public void testSelectDept(){
		System.out.println(deptDao.selectDept(1));
		
		
	}
	@Test
	public void testInsertDept(){
		Dept dept = new Dept();
		dept.setDeptName("name11");
		dept.setDeptAddress("address11");
		System.out.println("受影响行数"+deptDao.insertDept(dept));
		
	}
	
}
