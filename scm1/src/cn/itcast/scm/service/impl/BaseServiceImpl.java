package cn.itcast.scm.service.impl;

import java.lang.reflect.Field;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.dao.AccountRecordsMapper;
import cn.itcast.scm.dao.BaseMapper;
import cn.itcast.scm.dao.BuyOrderDetailMapper;
import cn.itcast.scm.dao.BuyOrderMapper;
import cn.itcast.scm.dao.GoodsMapper;
import cn.itcast.scm.dao.ReturnOrderDetailMapper;
import cn.itcast.scm.dao.ReturnOrderMapper;
import cn.itcast.scm.dao.StockMapper;
import cn.itcast.scm.dao.StoreHouseMapper;
import cn.itcast.scm.dao.SupplierMapper;
import cn.itcast.scm.dao.SysParamMapper;
import cn.itcast.scm.entity.Page;

import cn.itcast.scm.service.BaseService;


public class BaseServiceImpl<T> implements BaseService<T> {
	
	@Autowired
	protected BaseMapper<T> baseMapper;
	@Autowired
	protected SupplierMapper supplierMapper;
	
	@Autowired
	protected AccountMapper accountMapper;
	
	@Autowired
	protected GoodsMapper goodsMapper;
	
	@Autowired
	protected StoreHouseMapper storeHouseMapper;
	
	@Autowired
	protected AccountRecordsMapper accountRecordsMapper;
	
	@Autowired
	protected BuyOrderMapper buyOrderMapper;
	
	@Autowired
	protected BuyOrderDetailMapper buyOrderDetailMapper;
	
	@Autowired
	protected ReturnOrderMapper returnOrderMapper;
	
	@Autowired
	protected ReturnOrderDetailMapper returnOrderDetailMapper;
	
	@Autowired
	protected SysParamMapper sysParamMapper;
	
	@Autowired
	protected StockMapper stockMapper;

	
	@PostConstruct//在构造方法后，初化前执行
	private void initBaseMapper() throws Exception{
		//完成以下逻辑，需要对研发本身进行命名与使用规范
				//this关键字指对象本身，这里指的是调用此方法的实现类（子类）
				System.out.println("=======this :"+this);
				System.out.println("=======父类基本信息："+this.getClass().getSuperclass());
				System.out.println("=======父类和泛型的信息："+this.getClass().getGenericSuperclass());
				
				ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
				//获取第一个参数的class
				Class clazz = (Class)type.getActualTypeArguments()[0];
				System.out.println("=======class:"+clazz);
				//转化为属性名（相关的Mapper子类的引用名）Supplier  supplierMapper
				String localField = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1)+"Mapper";
				System.out.println("=======localField:"+localField);
				
				//getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
				//将字符串转为类；如supplierMapper 转为
				//           protected cn.itcast.scm.dao.SupplierMapper 
		        //                     cn.itcast.scm.service.impl.BaseServiceImpl.supplierMapper
				Field field=this.getClass().getSuperclass().getDeclaredField(localField);
				System.out.println("=======field:"+field);
				System.out.println("=======field对应的对象:"+field.get(this));
				Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
				
				System.out.println("=======baseField:"+baseField);
				System.out.println("=======baseField对应的对象:"+baseField.get(this));	
				//field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中		
				baseField.set(this, field.get(this));		
				System.out.println("========baseField对应的对象:"+baseMapper);

	}
	

	@Override
	public int insert(T entity) throws Exception {

		return baseMapper.insert(entity);
	}

	@Override
	public int updateByPk(T entity) throws Exception {
		return baseMapper.updateByPk(entity);
	}

	@Override
	public int deleteByPk(T entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public T selectByPk(T entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> selectUseDyc(T entity) {
		
		return baseMapper.selectUseDyc(entity);
	}

	@Override
	public Page<T> selectPage(Page<T> page) {
		page.setList(baseMapper.selectPage(page));
		page.setTotalRecord(baseMapper.selectCountPage(page));
		System.out.println(baseMapper.selectCountPage(page)+"serviceImpl");
		return page;
	}
	//2条件查询
	@Override
	public Page<T> selectPageListUseDyc(Page<T> page) {
		page.setTotalRecord(baseMapper.selectPageCountUseDyc(page));
		page.setList(baseMapper.selectPageListUseDyc(page));
		return page;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		
		return baseMapper.deleteList(pks);
	}

	//3条件查询
	@Override
	public Page<T> selectPageListUseDyc2(Page<T> page) {
		page.setTotalRecord(baseMapper.selectPageCountUseDyc2(page));
		page.setList(baseMapper.selectPageListUseDyc2(page));
		return page;
	}




	

}


