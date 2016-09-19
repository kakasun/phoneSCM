package cn.itcast.scm.service;

import java.util.List;

import cn.itcast.scm.entity.BuyOrder;
import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Goods;

public interface BuyOrderService extends BaseService<BuyOrder> {
	public int insertBuyOrder(BuyOrder buyOrder) throws Exception;

}
