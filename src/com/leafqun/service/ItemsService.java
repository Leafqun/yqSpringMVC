package com.leafqun.service;

import java.util.List;

import com.leafqun.entity.Items;
import com.leafqun.entity.ItemsCustom;
import com.leafqun.entity.ItemsExample;
import com.leafqun.entity.ItemsQueryVo;

public interface ItemsService {
	
	public Items selectByPrimaryKey(Integer id) throws Exception;
	
	public List<Items> selectByExample(ItemsExample example) throws Exception;
	
	public int updateByPrimaryKeyWithBLOBs(Items record) throws Exception;
	
	public List<Items> selectByName(ItemsQueryVo vo) throws Exception;
	
	public int deleteByPrimaryKey(Integer id) throws Exception;
}
