package cn.itcast.scm.service;

import java.util.List;

import cn.itcast.scm.entity.BuyOrder;
import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.ReturnOrder;

public interface ReturnOrderService extends BaseService<ReturnOrder> {
	public int insertReturnOrder(ReturnOrder returnOrder) throws Exception;

}
