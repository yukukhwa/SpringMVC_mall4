package com.test.mall4.category.controller;

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

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@RequestMapping(value="/selectCategoryAllList", method=RequestMethod.GET)
	public String selectCategoryAllList(Model model) {
		List<Category> list = categoryService.selectCategoryAllList();
		
		//logger.debug("test--- list", list);
		//logger.info("test info --- list ::: ", list);
		
		model.addAttribute("list", list);
		return "/categoryList";
	}
	/**
	 * "/deleteCategory"주소를 get방식으로 호출할때 카테고리 삭제 처리 관련 컨트롤
	 * @param category
	 * @return "/getCategoryList"리스트 주소 재요청
	 */
	@RequestMapping(value="/deleteCategory", method=RequestMethod.GET)
	public String deleteCategory(Category category) {
		int row = categoryService.deleteCategory(category);
		return "redirect:/getCategoryList";
	}
	/**
	 * "/updateCategory"주소를 post방식으로 호출할때 카테고리 수정 처리 관련 컨트롤
	 * @param category
	 * @return "/getCategoryList"리스트 주소 재요청
	 */
	@RequestMapping(value="/updateCategory", method=RequestMethod.POST)
	public String updateCategory(Category category) {
		int row = categoryService.updateCategory(category);
		return "redirect:/getCategoryList";
	}
	/**
	 * "/updateCategory"주소를 get방식으로 호출할때 카테고리 수정 폼 관련 컨트롤
	 * @param category
	 * @param model
	 * @return updateCategory.jsp 화면 출력
	 */
	@RequestMapping(value="/updateCategory", method=RequestMethod.GET)
	public String selectCategoryOne(Category category,Model model) {
		model.addAttribute("category",categoryService.selectCategoryOne(category));
		return "updateCategory";
	}
	/**
	 * "/getCategoryList"주소를 get방식으로 호출할때 리스트 화면 관련 컨트롤(페이징포함)
	 * @param model
	 * @param currentPage
	 * @param pagePerRow
	 * @return getCategoryList.jsp화면 출력
	 */
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	public String selectCategoryList(Model model, @RequestParam(value="currentPage",defaultValue="1") int currentPage,@RequestParam(value="pagePerRow",defaultValue="3") int pagePerRow) {
		Map<String, Object> map = categoryService.selectCategoryList(currentPage, pagePerRow);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage",map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		return "getCategoryList";
	}
	/**
	 * "/addCategory"주소를 get방식으로 호출할때 카테고리 등록 폼 관련 컨트롤
	 * @return addCategory.jsp 화면 출력
	 */
	@RequestMapping(value="/addCategory", method=RequestMethod.GET)
	public String insertCategory() {
		logger.info("CategoryController get호출");
		return "addCategory";
	}
	/**
	 * "/addCategory"주소를 post방식으로 호출할때 카테고리 등록 처리 관련 컨트롤
	 * @param category
	 * @return "/index"메인주소를 재요청
	 */
	@RequestMapping(value="/addCategory", method=RequestMethod.POST)
	public String insertCategory(Category category) {
		logger.info("CategoryController post호출");
		logger.info("category 확인: "+category.getCategoryName());
		this.categoryService.insertCategory(category);
		return "redirect:/index";
	}

}
