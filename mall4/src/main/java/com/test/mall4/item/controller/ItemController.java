package com.test.mall4.item.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.item.service.Item;
import com.test.mall4.item.service.ItemService;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@RequestMapping(value="/addItem" , method=RequestMethod.GET)
	public String insertItem() {
		logger.info("ItemController get호출 ");
		return "addItem";
	}
	@RequestMapping(value="/addItem" , method = RequestMethod.POST)
	public String insertItem(Item item) {
		logger.info("ItemController post호출");
		String itemService = this.itemService.insertItem(item);
		logger.info(itemService);
		return "redirect:/index";
	}

}
