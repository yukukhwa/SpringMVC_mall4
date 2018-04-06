package com.test.mall4.member.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired private SqlSessionTemplate sqlSession;	
	// final : 객체 참조변수를 변경하지 못하게 하는 접근제한자
	final String NS = "com.test.mall4.member.service.MemberMapper.";
	
	// 일치하는 ID와 PW를 셀렉트하는 메서드
	public Member selectMemberById(Member member){
		return sqlSession.selectOne(NS+"selectMemberById", member);
	}
	
	// 회원 레코드의 총 갯수를 셀렉트하는 메서드
	public int totalCountMember() {
		return sqlSession.selectOne(NS+"totalCountMember");
	}
	
	// 회원 전체 리스트를 셀렉트하는 메서드
	// 입력변수로 Integer데이터타입의 값을 받는다.
	public List<Member> selectMemberList(Map<String, Integer> map){		
		return sqlSession.selectList(NS+"selectMemberList", map);
	}
	
	// 회원 입력하는 메서드
	// 입력변수로 Member클래스데이터타입을 받는다.
	public int insertMember(Member member) {
		logger.info("MemberDao 호출");
		int row = sqlSession.insert(NS+"insertMember", member);
		return row;
	}	
}