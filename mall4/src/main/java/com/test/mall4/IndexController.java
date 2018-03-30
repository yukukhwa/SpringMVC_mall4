package com.test.mall4;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	/*@RequestMapping(value = {"/addMember"}, method = RequestMethod.GET)
	public String addMember() {
		return "index";
	}
	
	@RequestMapping(value = {"/addAddress"}, method = RequestMethod.GET)
	public String addAddress() {
		return "index";
	}
	
	@RequestMapping(value = {"/addCategory"}, method = RequestMethod.GET)
	public String addCategory() {
		return "index";
	}
	
	@RequestMapping(value = {"/addItem"}, method = RequestMethod.GET)
	public String addItem() {
		return "index";
	}*/
}
