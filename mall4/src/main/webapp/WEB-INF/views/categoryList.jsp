<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.test.mall4.category.service.*" %>
<%@ page import="com.google.gson.*" %>
<%
	List<Category> list = (List<Category>)request.getAttribute("list");
	Gson gson = new Gson();
%>


<%=gson.toJson(list)%>