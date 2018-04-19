package com.test.mall4.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mall4.member.service.Member;
import com.test.mall4.order.service.Order;
import com.test.mall4.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value="/deleteOrder", method=RequestMethod.POST)
	public String deleteOrder(@RequestParam(value="orderNo") List<Integer> list,HttpSession session) {
		for(Integer orderNo : list) {
			logger.info(String.valueOf(orderNo));
		}
		orderService.deleteOrder(list);
		Member member = (Member)session.getAttribute("loginMember");
		return "redirect:/getOrderList?member.memberNo="+member.getMemberNo();
	}
	
	@RequestMapping(value="/deleteOrder", method=RequestMethod.GET)
	public String deleteOrder(Order order) {
		orderService.deleteOrder(order);
		return "redirect:/getOrderList?member.memberNo="+order.getMember().getMemberNo();
	}
	
	@RequestMapping(value="/updateOrderCount", method=RequestMethod.GET)
	public String updateOrderCount(Order order) {
		logger.info(String.valueOf(order.getItem().getItemNo()));
		logger.info(String.valueOf(order.getMember().getMemberNo()));
		logger.info(String.valueOf(order.getOrderCount()));
		orderService.updateOrderCount(order);
		return "redirect:/getOrderList?member.memberNo="+order.getMember().getMemberNo();
	}
	
	@RequestMapping(value="/getOrderList", method=RequestMethod.GET)
	public String selectOrderList(Model model, Order order) {
		model.addAttribute("list", orderService.selectOrderList(order));
		return "order/getOrderList";
	}
	
	@RequestMapping(value="/addOrder", method=RequestMethod.GET)
	public String insertOrder(Order order,@RequestParam(value="pagePerRow",required=true) int pagePerRow,@RequestParam(value="currentPage",required=true) int currentPage) {
		logger.info("insertOrder get 호출");
		int row = orderService.insertOrder(order);
		return "redirect:/getItemList?currentPage="+currentPage+"&pagePerRow="+pagePerRow;
	}
}
