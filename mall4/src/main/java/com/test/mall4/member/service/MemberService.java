package com.test.mall4.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.test.mall4.member.service.MemberService;

import org.slf4j.LoggerFactory;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	public List<Member> selectMemberList() {
		List<Member> list = memberDao.selectMemberList();
		return list;
	}
	
	public int insertMember(Member member) {
	logger.debug("%s","MemberService insertMember호출"); // printf();
	
	int row = this.memberDao.insertMember(member);
	return row;
	}
}
