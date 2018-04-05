package com.test.mall4.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.mall4.IndexController;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired private SqlSessionTemplate sqlSession;
	
	final String NS = "com.test.mall4.member.service.MemberMapper.";
	public int insertMember(Member member) {
		logger.info("MemberDao 호출");
		int row = sqlSession.insert(NS+"insertMember", member);
		return row;
	}

	
}
