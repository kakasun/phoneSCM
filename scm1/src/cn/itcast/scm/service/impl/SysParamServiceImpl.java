package cn.itcast.scm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.scm.dao.AccountMapper;
import cn.itcast.scm.dao.GoodsMapper;
import cn.itcast.scm.dao.SysParamMapper;
import cn.itcast.scm.entity.Account;
import cn.itcast.scm.entity.Goods;
import cn.itcast.scm.entity.Page;
import cn.itcast.scm.entity.Supplier;
import cn.itcast.scm.entity.SysParam;
import cn.itcast.scm.service.AccountService;
import cn.itcast.scm.service.GoodsService;
import cn.itcast.scm.service.SysParamService;
@Service("sysParamService")
public class SysParamServiceImpl extends BaseServiceImpl<SysParam> implements SysParamService {
	
	@Override
	public Map<String, Object> selectList() {
		List<SysParam> sysParams = sysParamMapper.selectList("");
		
		Map<String,Object> sysParamMap = new HashMap<String,Object>();
		Map<String,Object> fieldMap = null;
		for(SysParam sysParam:sysParams){
			if("1".equals(sysParam.getSysParamType())){
				String sql = sysParam.getSysParamValue();
				List<SysParam> otherList = sysParamMapper.selectOtherTable(sql);
				fieldMap = new HashMap<String,Object>();
				for(SysParam otherMap : otherList){
					fieldMap.put(otherMap.getSysParamValue(), otherMap.getSysParamText());
					
				}
				sysParamMap.put(sysParam.getSysParamField(), fieldMap);
				
			}else{
				//查看系统中是否存有数据库中的字段
				if(sysParamMap.get(sysParam.getSysParamField())==null){
					fieldMap = new HashMap<String,Object>();
					fieldMap.put(sysParam.getSysParamValue(), sysParam.getSysParamText());
					System.out.println(sysParam.getSysParamValue()+"===="+sysParam.getSysParamText());
					sysParamMap.put(sysParam.getSysParamField(),fieldMap);
				} else {
					fieldMap = (Map<String, Object>) sysParamMap.get(sysParam.getSysParamField());
					fieldMap.put(sysParam.getSysParamValue(), sysParam.getSysParamText());
					System.out.println(sysParam.getSysParamValue()+"===="+sysParam.getSysParamText());
					
				}
			}
		}
		return sysParamMap;
	}


	

}
