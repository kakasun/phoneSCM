package cn.itcast.scm.dao;

import cn.itcast.scm.entity.BuyOrderDetail;
import cn.itcast.scm.entity.ReturnOrderDetail;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReturnOrderDetailMapper extends BaseMapper<ReturnOrderDetail>{
	public int insertList(List<ReturnOrderDetail> ReturnOrderDetail);

 
}