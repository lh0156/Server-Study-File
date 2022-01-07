<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/*
	
		서버 프로그래밍의 자원 관리
		- 생명 주기
		- 하나의 JSP 페이지의 자원은 최대 생명주기가 해당 JSP 페이지이다. > JSP 페이지간의 데이터 공유는 불가능하다.
		- 
	*/

%>
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
<div class="container">
		<h1 class="page-header"><small></small></h1>
	
	<div>a: <%= request.getParameter("a") %></div>
</div>

<script>

</script>
</body>
	
</html>