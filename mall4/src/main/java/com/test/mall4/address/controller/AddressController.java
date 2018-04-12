package com.test.mall4.address.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mall4.address.service.Address;
import com.test.mall4.address.service.AddressService;

@Controller
public class AddressController {

	private static final Logger logger = LoggerFactory.getLogger(AddressController.class);
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping(value="/updateAddress", method=RequestMethod.POST)
	public String updateAddress(Address address) {
		logger.info("AddressController updateAddress Post");
		addressService.updateAddress(address);
		return "redirect:/getAddressList";
	}
	
	@RequestMapping(value="/updateAddress", method=RequestMethod.GET)
	public String selectAddressOne(Address address 
									,Model model
									,@RequestParam(value="addressNo") int addressNo) {
		model.addAttribute("address",addressService.selectAddressOne(address));
		return "updateAddress";
	}
	
	@RequestMapping(value="/deleteAddress", method=RequestMethod.GET)
	public String deleteAddress(Address address) {
		addressService.deleteAddress(address);
		return "redirect:/getAddressList";
	}
	
	@RequestMapping(value="/getAddressList", method= RequestMethod.GET)
	public String selectAddressList(Model model
									,@RequestParam(value="currentPage", defaultValue="1") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow) {
		Map<String, Object> map = addressService.selectAddressList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		return "getAddressList";
	}
	
	//insert
	@RequestMapping(value = "/addAddress", method = RequestMethod.GET)
	public String insertAddress() {
		logger.info("AddressController get");
		return "addAddress";
	}
	//insert
	@RequestMapping(value = "/addAddress", method = RequestMethod.POST)
	public String insertAddress(Address address) {
		logger.info("AddressController Post");
		addressService.insertAddress(address);
		return "redirect:/index";
	}
	
}
