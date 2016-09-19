package cn.itcast.scm.service;

import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;

public interface GoodsService extends BaseService<Goods> {

	Page<Goods> selectByGoodsName(Page<Goods> page);

}
