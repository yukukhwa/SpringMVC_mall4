package com.test.mall4.member.controller;

import java.util.Map;

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
import com.test.mall4.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value= "/login", method=RequestMethod.GET)
	public String loging() {
		return "login";
		
	}
	
	@RequestMapping(value= "/login", method=RequestMethod.POST)
	public String loging(Model model, Member member, HttpSession session) {
		Member returnMember = memberService.selectMemberById(member);
		if(returnMember == null) {
			logger.info("로그인에 실패했고 로그인뷰로 포워드할거야");
			model.addAttribute("requestMember", member);
			return "login";
		}
		session.setAttribute("loginMember", member);
		return "redirect:/index";
	}

	@RequestMapping(value= "/getMemberList", method=RequestMethod.GET)
	public String selectMemberList(Model model
										, @RequestParam(value="currentPage", defaultValue="1") int currentPage
										, @RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow) {
		Map<String, Object> map = memberService.selectMemberList(currentPage, pagePerRow);
		//model.addAttribute("map",map); -> 서비스에서 풀어서 넘긴다
		model.addAttribute("list", map.get("list"));		
		model.addAttribute("lastPage", map.get("lastPage"));	
		model.addAttribute("currentPage", currentPage);	
		return "getMemberList";
	}
	
	@RequestMapping(value = {"/addMember"} , method=RequestMethod.GET)
	public String insertMember() {
		logger.info("MemberController get");
		return "addMember";
	}
	
	@RequestMapping(value = {"/addMember"} , method=RequestMethod.POST)
	public String insertMember(Member member) {
		logger.info("MemberController post");
		logger.info("ID,PW: " + member.getMemberId() + " , " + member.getMemberPw());
		memberService.insertMember(member);
		return "redirect:/index";
	}
}
