package com.test.mall4.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.member.service.Member;
import com.test.mall4.member.service.MemberService;

@Controller
public class MemberController {
	// autowired : 주입 => memberService
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = {"/","/index"} , method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = {"/addMember"} , method=RequestMethod.GET)
	public String insertMember() {
		return "addMember";
	}
	
	@RequestMapping(value = {"/addMember"} , method=RequestMethod.POST)
	public String insertMember(Member member) {
		
		MemberService memberService;
		insertMember(member);
		
		return "redirect:/addMember";
	}
}
