package cn.itcast.scm.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.dao.GoodsMapper;
import cn.itcast.scm.entity.Account;
import cn.itcast.scm.entity.AccountRecords;
import cn.itcast.scm.entity.BuyOrder;
import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.ReturnOrderDetail;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.BuyOrderService;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.ReturnOrderDetailService;
@Service("returnOrderDetailService")
public class ReturnOrderDetailServiceImpl extends BaseServiceImpl<ReturnOrderDetail> implements ReturnOrderDetailService {



	@Override
	public int insertBuyOrder(List<ReturnOrderDetail> returnOrderDetails)
			throws Exception {
		return returnOrderDetailMapper.insertList(returnOrderDetails);
	}

	




}
