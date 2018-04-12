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
	

	// 회원 삭제
	public int deleteMember(Member member) {
		return memberDao.deleteMember(member);
	}
	
	// 수정할 회원정보 처리
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}
	
	// 수정할 회원정보 가져오는 메서드
	public Member selectMemberOne(Member member) {
		return memberDao.selectMemberOne(member);
	}
	
	// 로그인
	public Member selectMemberById(Member member){
		return memberDao.selectMemberById(member);
	}
	
	// 전체 멤버 리스트(페이징)
	public Map<String, Object> selectMemberList(int currentPage, int pagePerRow) {
		// 컨트롤러에서 받는 파라미터 수정
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 레코드시작행은 (현재페이지-1)*10행씩
		// 현재페이지1이면 레코드시작행 = 0
		// 현재페이지2이면 레코드시작행 = 10
		// 현재페이지3이면 레코드시작행 = 20
		int beginRow = (currentPage-1)*pagePerRow;		
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow); // 매핑해서 Dao로 넘김
		List<Member> list = memberDao.selectMemberList(map); // Dao 리스트 리턴값 받음	
		int total = memberDao.totalCountMember(); // Dao 토탈카운트 리턴값 받음
		// last페이지 알고리즘
		// 토탈카운트를 리턴받았는데 예를 들어 레코드가 총 1~9행이면 %pagePerRow(10) = 1~0		
		int lastPage = 0;
		lastPage = total/pagePerRow; // 레코드가 총 0, 10, 20, 30 ... 등 나누어떨어질때 마지막페이지는 몫
		if(total%pagePerRow != 0) {
			++lastPage; // 나머지가 있을 때 마지막페이지는 몫+1
		}
		// Dao에서 받은 리턴값 매핑
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}
	
	// 회원 등록
	public int insertMember(Member member) {
		logger.debug("%s","MemberService insertMember호출");
		return memberDao.insertMember(member);
	}
}
