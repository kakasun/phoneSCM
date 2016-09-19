package cn.itcast.scm.dao;

import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsMapper extends BaseMapper<Goods>{

	public List<Goods> selectByGoodsName(Page<Goods> page);

	public Integer selectCountByGoodsName(Page<Goods> page);
  
}