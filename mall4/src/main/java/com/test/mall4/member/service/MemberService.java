package com.test.mall4.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public Member selectMemberById(Member member){
		return memberDao.selectMemberById(member);
	}
	
	public Map<String, Object> selectMemberList(int currentPage, int pagePerRow) {
		// 컨트롤러에서 받는 파라미터 수정
		Map<String, Integer> map = new HashMap<String, Integer>();
		// currentPage, pagePerRow -> beginPage == 알고리즘 설계 -> 코드
		int beginRow = (currentPage-1)*pagePerRow;
		
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Member> list = memberDao.selectMemberList(map);	
		int total = memberDao.totalCountMember();
		// total, pagePerRow -> lastPage 알고리즘
		int lastPage = 0;
		if(total%pagePerRow == 0) {
			lastPage = total/pagePerRow;
		} else {
			lastPage = total/pagePerRow+1;
		}
		// Dao에서 받는 리턴값 수정
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}
	
	public int insertMember(Member member) {
		logger.debug("%s","MemberService insertMember호출"); // printf();
		return memberDao.insertMember(member);
	}
}
