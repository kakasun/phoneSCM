package cn.itcast.scm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import cn.itcast.scm.dao.SupplierMapper;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.SupplierService;
@Service("supplierService")
public class SupplierServiceImpl extends BaseServiceImpl<Supplier> implements SupplierService {
/*	@Autowired
	private SupplierMapper supplierMapper;

	@Override
	public int insert(Supplier entity) throws Exception {

		return supplierMapper.insert(entity);
	}

	@Override
	public int updateByPk(Supplier entity) throws Exception {
		return supplierMapper.updateByPk(entity);
	}

	@Override
	public int deleteByPk(Supplier entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Supplier selectByPk(Supplier entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Supplier> selectUseDyc(Supplier entity) {
		
		return supplierMapper.selectUseDyc(entity);
	}

	@Override
	public Page<Supplier> selectPage(Page<Supplier> page) {
		page.setList(supplierMapper.selectPage(page));
		page.setTotalRecord(supplierMapper.selectCountPage(page));
		System.out.println(supplierMapper.selectCountPage(page)+"serviceImpl");
		return page;
	}

	@Override
	public Page<Supplier> selectPageListUseDyc(Page<Supplier> page) {
		page.setTotalRecord(supplierMapper.selectPageCountUseDyc(page));
		page.setList(supplierMapper.selectPageListUseDyc(page));
		return page;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		
		return supplierMapper.deleteList(pks);
	}*/




	

}


