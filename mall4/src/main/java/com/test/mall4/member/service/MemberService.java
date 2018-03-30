package com.test.mall4.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	
	/*public String memberService() {
	//Member member = new Member();
	memberDao.insertMember(member);
	}*/
}
