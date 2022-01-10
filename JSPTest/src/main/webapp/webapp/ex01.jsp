<%@page import="java.util.Random"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자바 영역
	Calendar now = Calendar.getInstance();
	//System.out.println(now);
	
	
	Random rnd = new Random();
	int dan = rnd.nextInt(8) + 2;
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex01.jsp -->
	<h1>스크립틀릿</h1>
	
	현재 시간 : <%= String.format("%tT", now) %>
	
	
	
	
	<h1>구구단 <%= dan %>단</h1>
	
	<!-- 스파게티 코드 발생 -->
	<% for (int i=1; i<=9; i++) { %>
	<div><%= dan %> x <%= i %> = <%= dan*i %></div> 
	<% } %>
	
	
	<hr>
	
	<%= dan %>
	<%= "<input>" %>
	
	
	<%@ include file="inc/copyright.jsp" %>
	
</body>
</html>













