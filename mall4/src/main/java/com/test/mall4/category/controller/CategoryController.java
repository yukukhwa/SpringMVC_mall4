package com.test.mall4.category.controller;

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

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	public String selectCategoryList(Model model, @RequestParam(value="currentPage",defaultValue="1") int currentPage,@RequestParam(value="pagePerRow",defaultValue="3") int pagePerRow) {
		Map<String, Object> map = categoryService.selectCategoryList(currentPage, pagePerRow);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage",map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
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
