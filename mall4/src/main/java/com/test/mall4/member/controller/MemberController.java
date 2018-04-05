package com.test.mall4.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.member.service.Member;
import com.test.mall4.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);


	@RequestMapping(value = {"/addMember"} , method=RequestMethod.GET)
	public String insertMember() {
		logger.info("MemberController get");
		return "addMember";
	}
	
	@RequestMapping(value = {"/addMember"} , method=RequestMethod.POST)
	public String insertMember(Member member) {
		logger.info("MemberController post");
		logger.info("ID,PW: " + member.getMemberId() + " , " + member.getMemberPw());
		this.memberService.insertMember(member);
		return "redirect:/index";
	}
}
