package cn.itcast.scm.service;

import java.util.List;

import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;

public interface BuyOrderDetailService extends BaseService<BuyOrderDetail> {

	int insertList(List<BuyOrderDetail> buyOrderDetails);

	

}
