package com.test.mall4.address.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressService {
	private static final Logger logger = LoggerFactory.getLogger(AddressService.class);
	
	@Autowired
	private AddressDao addressDao;
	
	public int updateAddress(Address address) {
		return addressDao.updateAddress(address);
	}
	
	public Address selectAddressOne(Address address){
		return addressDao.selectAddressOne(address);
	}
	
	public int deleteAddress(Address address) {
		return addressDao.deleteAddress(address);
	}
	
	public Map<String, Object> selectAddressList(int currentPage, int pagePerRow){
		logger.info("addressService selectList 호출");
		// beginRow 
		Map<String, Integer> map = new HashMap<String, Integer>();
		int beginRow = ((currentPage-1)*pagePerRow);
		map.put("currentPage", currentPage);
		map.put("pagePerRow", pagePerRow);
		map.put("beginRow", beginRow);
		System.out.println(beginRow + "<-- beginRow");
		List<Address> list = addressDao.selectAddressList(map);
		// 카운트 라스트페이지
		int total = addressDao.totalCountAddress();
		int lastPage = total/pagePerRow;
		if(total%pagePerRow != 0) {
			lastPage++;
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lastPage", lastPage);
		returnMap.put("list", list);
		return returnMap;
	}
	
	public int insertAddress(Address address) {
		logger.info("AddressService insertAddress 호출");
		return addressDao.insertAddress(address);
	}
	
	

}
