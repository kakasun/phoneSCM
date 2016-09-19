package cn.itcast.scm.service;

import java.util.List;

import cn.itcast.scm.entity.BuyOrder;
import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.ReturnOrderDetail;

public interface ReturnOrderDetailService extends BaseService<ReturnOrderDetail> {
	public int insertBuyOrder(List<ReturnOrderDetail> returnOrderDetail) throws Exception;

}
