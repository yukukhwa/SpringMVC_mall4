package com.test.mall4.address.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDao {
	private static final Logger logger = LoggerFactory.getLogger(AddressDao.class);
	public String insertAddress(Address address) {
		logger.info("AddressDao 호출");
		return "insertAddressDao 리턴";
	}
}
