package cn.itcast.scm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.dao.StoreHouseMapper;
import cn.itcast.scm.entity.Account;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Stock;
import cn.itcast.scm.entity.StoreHouse;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.StockService;
import cn.itcast.scm.service.StoreHouseService;
@Service("stockService")
public class StockServiceImpl extends BaseServiceImpl<Stock> implements StockService {
/*	@Autowired
	private StoreHouseMapper storeHouseMapper;

	@Override
	public int insert(StoreHouse entity) throws Exception {
		System.out.println("serviceIMpl");
		return storeHouseMapper.insert(entity);
	}

	@Override
	public int updateByPk(StoreHouse entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPk(StoreHouse entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StoreHouse selectByPk(StoreHouse entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreHouse> selectUseDyc(StoreHouse entity) {
		// TODO Auto-generated method stub
		return storeHouseMapper.selectUseDyc(entity);
	}

	@Override
	public Page<StoreHouse> selectPage(Page<StoreHouse> page) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Page<StoreHouse> selectPageListUseDyc(Page<StoreHouse> page) {
		page.setList(storeHouseMapper.selectPageListUseDyc(page));
		page.setTotalRecord(storeHouseMapper.selectPageCountUseDyc(page));
		return page;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		
		return storeHouseMapper.deleteList(pks);
	}*/



}
