<%@page import="com.test.mvc.AddressDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<!-- el.jsp -->
	<div class="container">
		<h1 class="page-header">EL <small></small></h1>
		
		
		<!--  
		
			EL, Expression Language
			- 표현식 언어
			- 내장 객체안에 있는 데이터를 HTML 페이지에 출력하는 기능을 가지는 언어
		
		-->
		
		<p>num: <%= request.getAttribute("num") %></p>
		<p>num: <%= (int)request.getAttribute("num") * 2 %></p>
		
		<p>num: ${num}</p>
		<p>num: ${num * 2}</p>
		<p>num: ${num > 0 ? "양수":"음수"}</p>
		
		<hr>
		
		<p>이름: <%= ((AddressDTO)request.getAttribute("dto")).getName() %></p>
		<p>이름: ${dto.getName()}</p>
		<p>이름: ${dto.name}</p>
		
		<hr>
		
		<!--  
			JSTL > 프로그래밍 기능이 있는 태그	
			- "maven repository"	
			
			1. 변수 생성
			2. 조건문(if, switch)
			3. 반복문(for) 
			
		-->
		
		<% if ((int)request.getAttribute("num") > 0) { %>
		<div>양수</div>
		<% } else { %>
		<div>음수</div>
		<% } %>
		
		<c:if test="${num > 0}">
		<div>양수</div>
		</c:if>
		
		<c:if test="${num <= 0}">
		<div>음수</div>
		</c:if>
		
		<c:forEach var="i" begin="1" end="10" step="1">
			<div>${i}</div>
		</c:forEach>
		
		<hr>
		
		<table class="table">		
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.name}</td>
				<td>${dto.age}</td>
				<td>${dto.tel}</td>
				<td>${dto.address}</td>
			</tr>
			</c:forEach>
		</table>
					
	</div>
	
	<script>
	
	</script>
</body>
</html>







