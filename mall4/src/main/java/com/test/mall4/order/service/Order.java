package com.test.mall4.order.service;

import java.sql.Date;

import com.test.mall4.item.service.Item;
import com.test.mall4.member.service.Member;

public class Order {
	private int orderNo;
	private int orderCount;
	private Member member;
	private Item item;
	private Date orderDate;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
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
		return "Order [orderNo=" + orderNo + ", orderCount=" + orderCount + ", member=" + member + ", item=" + item
				+ ", orderDate=" + orderDate + "]";
	}
}
