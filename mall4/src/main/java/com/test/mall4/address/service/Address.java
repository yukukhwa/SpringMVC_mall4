package com.test.mall4.address.service;

public class Address {
	private int addressNo;
	private String addressContent;
	

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public String getAddressContent() {
		return addressContent;
	}

	public void setAddressContent(String addressContent) {
		this.addressContent = addressContent;
	}

	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", addressContent=" + addressContent + "]";
	}

	
	
	
}
