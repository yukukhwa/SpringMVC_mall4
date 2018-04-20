package com.test.mall4.item.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mall4.category.service.Category;
import com.test.mall4.category.service.CategoryService;
import com.test.mall4.item.service.Item;
import com.test.mall4.item.service.ItemService;

@Controller
public class ItemController {
	@Autowired private ItemService itemService;
	@Autowired private CategoryService categoryService;
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@RequestMapping(value="/detailItem", method=RequestMethod.GET)
	public String detailItem(Model model,Item item) {
		model.addAttribute("item", itemService.selectItemOne(item));
		List<Category> list = categoryService.selectCategoryAllList();
		model.addAttribute("list", list);
		return "item/detailItem";
	}
	
	@RequestMapping(value="/deleteItem", method=RequestMethod.GET)
	public String deleteItem(Item item) {
		int row = itemService.deleteItem(item);
		return "redirect:/getItemList";
	}
	
	@RequestMapping(value="/updateItem", method=RequestMethod.POST)
	public String updateItem(Item item) {
		int row = itemService.updateItem(item);
		return "redirect:/getItemList";
	}
	
	@RequestMapping(value="/updateItem", method=RequestMethod.GET)
	public String selectItemOne(Item item, Model model) {
		List<Category> list = categoryService.selectCategoryAllList();
		model.addAttribute("list", list);
		model.addAttribute("item", itemService.selectItemOne(item));
		return "item/updateItem";
	}
		
	@RequestMapping(value="/getItemList", method=RequestMethod.GET)
	public String selectItemList(Model model,@RequestParam(value="currentPage",defaultValue="1") int currentPage,@RequestParam(value="pagePerRow",defaultValue="3") int pagePerRow) {
		Map<String, Object> map = itemService.selectItemList(currentPage, pagePerRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		return "item/getItemList";
	}
	
	@RequestMapping(value="/addItem" , method=RequestMethod.GET)
	public String insertItem(Model model) {
		logger.info("ItemController get호출 ");
		List<Category> list = categoryService.selectCategoryAllList();
		model.addAttribute("list", list);
		return "item/addItem";
	}
	@RequestMapping(value="/addItem" , method = RequestMethod.POST)
	public String insertItem(Item item) {
		logger.info("ItemController post호출");
		logger.info(item.toString());
		int row = itemService.insertItem(item);
		logger.info(String.valueOf(row));
		return "redirect:/getItemList";
	}

}
