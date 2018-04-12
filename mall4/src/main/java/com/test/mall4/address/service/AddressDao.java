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
	
	public int totalCountAddress() {
		return sqlSession.selectOne(NS+"totalCountAddress");
	}
	
	public int updateAddress(Address address) {
		return sqlSession.update(NS+"updateAddress",address);
	}
	
	public Address selectAddressOne(Address address) {
		return sqlSession.selectOne(NS+"selectAddressOne",address);
	}
	
	public int deleteAddress(Address address) {
		return sqlSession.delete(NS+"deleteAddress",address);
	}
	
	public List<Address> selectAddressList(Map<String, Integer> map) {
		logger.info("selectAddressList AddressDao 호출");
		return sqlSession.selectList(NS+"selectAddressList", map);
	}
	
	public int insertAddress(Address address) {
		logger.info("AddressDao 호출");
		return sqlSession.insert(NS+"insertAddress", address);
	}
}
