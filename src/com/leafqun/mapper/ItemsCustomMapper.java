package com.leafqun.mapper;

import java.util.List;

import com.leafqun.entity.Items;
import com.leafqun.entity.ItemsCustom;
import com.leafqun.entity.ItemsQueryVo;

public interface ItemsCustomMapper {
	
	public List<Items> selectByName(ItemsQueryVo vo);
}
