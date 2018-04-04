package com.test.mall4.address.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.address.service.Address;
import com.test.mall4.address.service.AddressService;
@Controller
public class AddressController {

	private static final Logger logger = LoggerFactory.getLogger(AddressController.class);
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping(value = "/addAddress", method = RequestMethod.GET)
	public String insertAddress() {
		logger.info("AddressController get");
		return "addAddress";
	}
	
	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String insertAddress(Address address) {
		logger.info("AddressController Post");
		logger.info(address.getAddressContent()+"address Content");
		this.addressService.insertAddress(address);
		return "redirect:/index";
	}
	

}
