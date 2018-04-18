package com.test.mall4.order.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.order.service.Order;
import com.test.mall4.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value="/addOrder", method=RequestMethod.GET)
	public String insertOrder(Order order) {
		logger.info("insertOrder get 호출");
		int row = orderService.insertOrder(order);
		return "redirect:/getItemList";
	}
	
	@RequestMapping(value="/getOrderList", method=RequestMethod.GET)
	public String selectOrderList(Model model, Order order) {
		model.addAttribute("list", orderService.selectOrderList(order));
		return "order/getOrderList";
	}
	@RequestMapping(value="/updateOrderCount", method=RequestMethod.GET)
	public String updateOrderCount(Order order) {
		orderService.updateOrderCount(order);
		return "redirect:/getOrderList";
	}
}
