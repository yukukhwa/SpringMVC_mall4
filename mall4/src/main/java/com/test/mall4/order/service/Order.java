package com.test.mall4.order.service;

import java.sql.Date;

import com.test.mall4.item.service.Item;
import com.test.mall4.member.service.Member;

public class Order {
	private int orderNo;
	private Member member;
	private Item item;
	private Date orderDate;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", member=" + member + ", item=" + item + ", orderDate=" + orderDate + "]";
	}
}
