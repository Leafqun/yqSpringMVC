package com.leafqun.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.leafqun.entity.Items;
import com.leafqun.entity.ItemsCustom;
import com.leafqun.entity.ItemsExample;
import com.leafqun.entity.ItemsQueryVo;
import com.leafqun.mapper.ItemsCustomMapper;
import com.leafqun.mapper.ItemsMapper;
import com.leafqun.service.ItemsService;

public class ItemsServiceImpl implements ItemsService {

	@Autowired
	private ItemsMapper itemsMapper;
	@Autowired
	private ItemsCustomMapper itemsCustomMapper;
	
	@Override
	public Items selectByPrimaryKey(Integer id) throws Exception {
		
		return itemsMapper.selectByPrimaryKey(id);
	}
	@Override
	public List<Items> selectByExample(ItemsExample example) throws Exception {
		// TODO Auto-generated method stub
		return itemsMapper.selectByExample(example);
	}
	@Override
	public int updateByPrimaryKeyWithBLOBs(Items record) throws Exception {
		// TODO Auto-generated method stub
		return itemsMapper.updateByPrimaryKeyWithBLOBs(record);
	}
	@Override
	public List<Items> selectByName(ItemsQueryVo vo) throws Exception {
		// TODO Auto-generated method stub
		return itemsCustomMapper.selectByName(vo);
	}
	@Override
	public int deleteByPrimaryKey(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return itemsMapper.deleteByPrimaryKey(id);
	}

	
	


}
