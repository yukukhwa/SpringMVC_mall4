package com.test.mall4.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.test.mall4.IndexController;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	public String insertMember(Member member) {
		logger.info("MemberDao 호출");
		return "MemberDao 리턴";
	}

	
}
