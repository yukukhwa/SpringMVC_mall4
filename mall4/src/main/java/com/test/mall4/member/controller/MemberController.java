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

import com.mysql.jdbc.PreparedStatement.ParseInfo;
import com.test.mall4.member.service.Member;
import com.test.mall4.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 로그아웃(세션종료)
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();		
		return "redirect:/index";
	}
	
	// 회원삭제 post
	@RequestMapping(value="/deleteMember", method=RequestMethod.GET)
	public String deleteMember(Member member) {
		memberService.deleteMember(member);
		return "redirect:/getMemberList";
	}
	
	// 회원수정 post
	@RequestMapping(value="/updateMember", method=RequestMethod.POST)
	public String updateMember(Member member) {
		memberService.updateMember(member);
		return "redirect:/getMemberList";
	}
	
	// 로그인 get
	@RequestMapping(value= "/login", method=RequestMethod.GET)
	public String loging() {
		return "login";		
	}
	
	// 로그인 post
	@RequestMapping(value= "/login", method=RequestMethod.POST)
	public String loging(Model model, Member member, HttpSession session) {
		Member returnMember = memberService.selectMemberById(member);
		if(returnMember == null) {
			logger.info("로그인에 실패했고 로그인 뷰로 포워드");
			model.addAttribute("requestMember", member);
			return "login";
		}
		session.setAttribute("loginMember", returnMember);
		return "redirect:/index";
	}


	// 회원수정 get
	@RequestMapping(value="/updateMember", method=RequestMethod.GET)
	public String selectMemberOne(Member member
										, Model model
										, @RequestParam(value="memberNo") int memberNo) {
		
		model.addAttribute("member", memberService.selectMemberOne(member));
		return "updateMember";
	}
	
	// 회원리스트 get
	@RequestMapping(value= "/getMemberList", method=RequestMethod.GET)
	public String selectMemberList(Model model
										, @RequestParam(value="currentPage", defaultValue="1") int currentPage
										, @RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow) {
		Map<String, Object> map = memberService.selectMemberList(currentPage, pagePerRow);
		//model.addAttribute("map",map); -> map째로 넘겨도 되지만 서비스에서 풀어서 넘긴다.
		model.addAttribute("list", map.get("list"));		
		model.addAttribute("lastPage", map.get("lastPage"));	
		model.addAttribute("currentPage", currentPage);	
		model.addAttribute("pagePerRow", pagePerRow);
		return "getMemberList";
	}
	
	// 회원등록 get
	@RequestMapping(value = {"/addMember"} , method=RequestMethod.GET)
	public String insertMember() {
		logger.info("MemberController get");
		return "addMember";
	}
	
	// 회원등록 post
	@RequestMapping(value = {"/addMember"} , method=RequestMethod.POST)
	public String insertMember(Member member) {
		logger.info("MemberController post");
		logger.info("ID,PW: " + member.getMemberId() + " , " + member.getMemberPw());
		memberService.insertMember(member);
		return "redirect:/getMemberList";
	}
}
