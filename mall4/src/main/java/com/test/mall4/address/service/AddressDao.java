package com.test.mall4.address.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDao {
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(AddressDao.class);
	
	final String NS = "com.text.mall4.address.service.AddressMapper.";
	
	// 주소의 갯수를 세는 메서드
	public int totalCountAddress() {
		return sqlSession.selectOne(NS+"totalCountAddress");
	}
	
	// 주소를 수정처리하는 메서드 
	public int updateAddress(Address address) {
		return sqlSession.update(NS+"updateAddress",address);
	}
	
	// 수정하려는 해당 주소를 화면에 조회하는 메서드 
	public Address selectAddressOne(Address address) {
		return sqlSession.selectOne(NS+"selectAddressOne",address);
	}
	
	// 주소 삭제하는 메서드
	public int deleteAddress(Address address) {
		return sqlSession.delete(NS+"deleteAddress",address);
	}
	
	// 주소 리스트 조회
	public List<Address> selectAddressList(Map<String, Integer> map) {
		logger.info("selectAddressList AddressDao 호출");
		return sqlSession.selectList(NS+"selectAddressList", map);
	}
	
	// 주소 추가하는 메서드
	public int insertAddress(Address address) {
		logger.info("AddressDao 호출");
		return sqlSession.insert(NS+"insertAddress", address);
	}
}
