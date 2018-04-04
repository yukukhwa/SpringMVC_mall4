package com.test.mall4.address.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AddressService {
	private static final Logger logger = LoggerFactory.getLogger(AddressService.class);
	
	@Autowired
	private AddressDao addressDao;
	
	public String insertAddress(Address address) {
		logger.info("AddressService insertAddress 호출");
		String insertAddress = this.addressDao.insertAddress(address);
		return "AddressService insertAddress 리턴";
	}
	
	

}
