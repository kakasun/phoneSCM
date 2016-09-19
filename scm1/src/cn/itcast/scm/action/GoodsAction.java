package cn.itcast.scm.action;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;

import cn.itcast.scm.service.GoodsService;


@Controller
@RequestMapping("/goods")
public class GoodsAction extends BaseAction {
	@Resource
	private GoodsService goodsService;
	
	//修改更新根据id
	@RequestMapping("/updateByPk")
	@ResponseBody
	public Object updateByPk(Goods goods){
		int i=0;
		try {
			i = goodsService.updateByPk(goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	//新增
	@RequestMapping("/insert")
	@ResponseBody
	public Object insertGoods(Goods goods) {
		
	
		System.out.println("-----action"+goods);
		int i=0;
		try {
			i = goodsService.insert(goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	//批量删除
	@RequestMapping("/deleteList")
	@ResponseBody
	public Object deleteList(String[] pks){
		int i = 0;
			try {
				i = goodsService.deleteList(pks);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return i;
	}
	
	
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public Map<String,Object> selectAll(Goods goods){
		List<Goods> goodsList = goodsService.selectUseDyc(goods);
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		map.put("total", goodsList.size());
		map.put("rows", goodsList);
		return map;
	}
	//多条件查询
	@RequestMapping("/selectPageListUseDyc")
	@ResponseBody
	public Object selectPageListUseDyc(Page<Goods> page,Goods goods){
		page.setParamEntity(goods);
		Page<Goods> p = goodsService.selectPageListUseDyc(page);
		
		return p.getPageMap();
		
	}
	
	//单条件查询(由关键字匹配名字查询)
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Object selectByPage(Page<Goods> page,Goods goods){
		System.out.println("goodName=="+goods.getGoodsName());
		System.out.println("keyWord=="+page.getKeyWord());
		Page<Goods> selectPage = goodsService.selectPage(page);
		Map<String,Object> map = new HashMap<String,Object> ();
		map.put("total", selectPage.getTotalRecord());
		map.put("rows", selectPage.getList());
		return map;
		
	}
	
	@RequestMapping("/selectByGoodsName")
	@ResponseBody
	public Object selectByGoodsName(Page<Goods> page,Goods goods,HttpServletRequest request){
		System.out.println("request中的goodsName="+request.getParameter("goodsName"));
		
		System.out.println("goodsName=="+goods.getGoodsName());
		System.out.println("设置goods前的goods=="+goods.toString());
		page.setParamEntity(goods);
		System.out.println("设置goods后的goods=="+goods.toString());
		Page<Goods> selectPage = goodsService.selectByGoodsName(page);
	//	String goodsId = selectPage.getParamEntity().getGoodsId();
		
		List<Goods> list = selectPage.getList();
		for(int i=0;i<list.size();i++){
			System.out.println("第"+i+"个list是"+list.get(i));
			Goods goodsList = list.get(i);
		}
		String goodsId = list.get(0).getGoodsId();
		System.out.println("goodsId="+goodsId);
		return goodsId;
		
	}
	
	
		
}

