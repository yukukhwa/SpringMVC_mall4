package com.test.mall4.address.service;

public class Address {
	private String addressContent;

	public String getAddressContent() {
		return addressContent;
	}

	public void setAddressContent(String addressContent) {
		this.addressContent = addressContent;
	}

	@Override
	public String toString() {
		return "Address [addressContent=" + addressContent + "]";
	}
	
	
}
