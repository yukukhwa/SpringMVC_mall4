package com.test.mall4.category.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.category.service.Category;
import com.test.mall4.category.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	public String selectCategoryList(Model model) {
		List<Category> list = categoryService.selectCategoryList();
		model.addAttribute("list",list);
		return "getCategoryList";
	}
	
	@RequestMapping(value="/addCategory", method=RequestMethod.GET)
	public String insertCategory() {
		logger.info("CategoryController get호출");
		return "addCategory";
	}
	
	@RequestMapping(value="/addCategory", method=RequestMethod.POST)
	public String insertCategory(Category category) {
		logger.info("CategoryController post호출");
		logger.info("category 확인: "+category.getCategoryName());
		this.categoryService.insertCategory(category);
		return "redirect:/index";
	}

}
