package cn.itcast.scm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.dao.GoodsMapper;
import cn.itcast.scm.entity.Account;
import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.GoodsService;
@Service("goodsService")
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {
	
	@Override
	public Page<Goods> selectByGoodsName(Page<Goods> page) {
		List<Goods> goodsList = goodsMapper.selectByGoodsName(page);
		Integer selectCountByGoodsName = goodsMapper.selectCountByGoodsName(page);
		//设值的时候连带把他put进了pageMap中了
		page.setList(goodsList);
		page.setTotalRecord(selectCountByGoodsName);
		return page;
	}

/*	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public int insert(Goods entity) throws Exception {
		return goodsMapper.insert(entity);
	}

	@Override
	public int updateByPk(Goods entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPk(Goods entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Goods selectByPk(Goods entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Goods> selectUseDyc(Goods entity) {
		
		return goodsMapper.selectUseDyc(entity);
	}

	@Override
	public Page<Goods> selectPage(Page<Goods> page) {
		page.setList(goodsMapper.selectPage(page));
		page.setTotalRecord(goodsMapper.selectCountPage(page));
		
		return page;
	}


	@Override
	public Page<Goods> selectPageListUseDyc(Page<Goods> page) {
		page.setList(goodsMapper.selectPageListUseDyc(page));
		page.setTotalRecord(goodsMapper.selectPageCountUseDyc(page));
		return page;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		
		return goodsMapper.deleteList(pks);
	}*/

}
