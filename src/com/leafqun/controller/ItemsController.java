package com.leafqun.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.leafqun.entity.Items;
import com.leafqun.entity.ItemsCustom;
import com.leafqun.entity.ItemsQueryVo;
import com.leafqun.service.ItemsService;

@Controller
@RequestMapping("/items")
public class ItemsController {
	@Autowired
	private ItemsService itemsService;

	@RequestMapping(value = "/queryItems")
	public String queryItems(Model model, ItemsQueryVo vo) throws Exception {
		List<Items> itemsList = itemsService.selectByName(vo);
		model.addAttribute("itemsList", itemsList);
		return "items/itemsList";
	}
	@RequestMapping(value = "/itemsDetails")
	public String itemsDetails(Model model,Integer id) throws Exception{
		
		Items items=itemsService.selectByPrimaryKey(id);
		model.addAttribute("items", items);
		return "items/itemsDetails";
		
		
	}
	@RequestMapping(value = "/editItems", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String editItems(Model model, Integer id,HttpServletRequest request)
			throws Exception {
		
		Items items = itemsService.selectByPrimaryKey(id);
		model.addAttribute("items", items);
		return "items/editItems";
	}

	@RequestMapping(value = "/updateItems", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String updateItems(Model model, Items items, MultipartFile items_pic)
			throws Exception {
		if (items_pic != null&&items!=null) {
			// 原始图片名称
			String originalFilename = items_pic.getOriginalFilename();
			// 存储图片的物理路径
			String pic_path = "F:\\Picture\\Tomcat\\";
			if (originalFilename != null && originalFilename.length() > 0) {
				// 新图片名称
				String newFilename = UUID.randomUUID()
						+ originalFilename.substring(originalFilename
								.lastIndexOf("."));
				// 新图片
				File newFile = new File(pic_path + newFilename);
				//删除旧图片
				File originalFile=new File(pic_path+originalFilename);
				originalFile.delete();
				// 内存中的数据写入磁盘
				items_pic.transferTo(newFile);
				// 设置新图片名称
				items.setPic(newFilename);
			}
		}
		// 更新商品
		itemsService.updateByPrimaryKeyWithBLOBs(items);

		List<Items> itemsList = itemsService.selectByName(null);
		model.addAttribute("itemsList", itemsList);
		return "redirect:/items/queryItems.html";

	}

	@RequestMapping(value = "/batchEditItems", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String batchEditItems(Model model,ItemsQueryVo vo) throws Exception {
		List<Items> itemsList = itemsService.selectByName(vo);
		model.addAttribute("itemsList", itemsList);
		return "items/editItemsQuery";
	}

	@RequestMapping("/editItemsAllSubmit")
	public String editItemsAllSubmit(Model model, ItemsQueryVo vo)
			throws Exception {

		if (vo == null) {

		}
		if (vo.getItemsList() == null) {

		}
		// 批量提交
		for (Items items : vo.getItemsList()) {
			itemsService.updateByPrimaryKeyWithBLOBs(items);
		}

		List<Items> itemsList = itemsService.selectByName(null);
		model.addAttribute("itemsList", itemsList);

		return "redirect:/items/queryItems.html";
	}
	@RequestMapping("/deleteItems")
	public String deleteItems(Items items,Integer id) throws Exception{
		
		itemsService.deleteByPrimaryKey(id);
		return "redirect:/items/queryItems.html";
		
	}
	@RequestMapping("/deleteItemsAllSubmit")
	public String deleteItemsAllSubmit(Integer[] ids) throws Exception{
		for(Integer id:ids){
			itemsService.deleteByPrimaryKey(id);
		}
		return "redirect:/items/queryItems.html";
		
	}

}
