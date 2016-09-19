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
import cn.itcast.scm.entity.ReturnOrder;
import cn.itcast.scm.entity.ReturnOrderDetail;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.BuyOrderService;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.ReturnOrderService;
@Service("returnOrderService")
public class ReturnOrderServiceImpl extends BaseServiceImpl<ReturnOrder> implements ReturnOrderService {

	@Override
	public int insertReturnOrder(ReturnOrder returnOrder) throws Exception {
		int i = 0;
		String roId = "ro"+UUID.randomUUID().toString().replace("-","");
		//退货单
		
		returnOrder.setRoId(roId);
		i = returnOrderMapper.insert(returnOrder);
		//退货明细单
		List<ReturnOrderDetail> returnOrderDetails = returnOrder.getReturnOrderDetails();
		for(ReturnOrderDetail rod : returnOrderDetails){
			rod.setRodId(UUID.randomUUID().toString().replace("-", ""));
			rod.setRoId(roId);
			
		}
		returnOrderDetailMapper.insertList(returnOrderDetails);
		return i;
	}


}
