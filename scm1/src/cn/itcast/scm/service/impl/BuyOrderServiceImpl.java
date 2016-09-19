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
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.BuyOrderService;
import cn.itcast.scm.service.GoodsService;
@Service("buyOrderService")
public class BuyOrderServiceImpl extends BaseServiceImpl<BuyOrder> implements BuyOrderService {

	@Override
	public int insertBuyOrder(BuyOrder buyOrder) throws Exception {
		
		//采购单
		int i = 0;
		String boId = "bo"+UUID.randomUUID().toString().replace("-", "");
		System.out.println("service:boId:"+boId);
		
		buyOrder.setBoId(boId);
		i = buyOrderMapper.insert(buyOrder);
		//采购明细单
		for(BuyOrderDetail bod: buyOrder.getBuyOrderDetails()){
			//主键都用uuid随机生成
			bod.setBodId(UUID.randomUUID().toString().replace("-", ""));
			bod.setBoId(boId);
		}
		
		buyOrderDetailMapper.insertList(buyOrder.getBuyOrderDetails());
		
		//用户记录表
		AccountRecords accountRecords = new AccountRecords();
		// 生成并设置怅务记录的主键
		accountRecords.setArId(UUID.randomUUID().toString().replace("-", ""));
		accountRecords.setSupId(buyOrder.getSupId());
		accountRecords.setArDate(buyOrder.getBoDate());
		//采购单号
		accountRecords.setArOrderId(buyOrder.getBoId());
		//bo表示商品采购，可以在参数表中加入相关内容
		accountRecords.setArBusType("bo");
		accountRecords.setArPayable(buyOrder.getBoPayable());
		accountRecords.setArPaid(buyOrder.getBoPaid());
		accountRecords.setArArrears(buyOrder.getBoArrears());
		//优惠金额：用应付金额减去实付金额再减去欠款
		//accountRecords.setArDiscount(buyOrder.getBoPayable().subtract(buyOrder.getBoPaid()).subtract(buyOrder.getBoArrears()));
		accountRecords.setArDiscount(buyOrder.getBoPayable().subtract(buyOrder.getBoPaid().subtract(buyOrder.getBoArrears())));
		accountRecords.setArAttn(buyOrder.getBoAttn());
		accountRecords.setArOperator(buyOrder.getBoOperator());
		accountRecords.setArRemark(buyOrder.getBoRemark());
		accountRecordsMapper.insert(accountRecords);

		return i;
	}


}
