package cn.itcast.scm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.dao.BuyOrderDetailMapper;
import cn.itcast.scm.dao.GoodsMapper;
import cn.itcast.scm.entity.Account;
import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.BuyOrderDetailService;
import cn.itcast.scm.service.GoodsService;
@Service("buyOrderDetailService")
public class BuyOrderDetailServiceImpl extends BaseServiceImpl<BuyOrderDetail> implements BuyOrderDetailService {

	@Override
	public int insertList(List<BuyOrderDetail> buyOrderDetails) {
		
		return buyOrderDetailMapper.insertList(buyOrderDetails);
	}


}
