<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*

	서버 프로그래밍의 자원 관리
	- 생명 주기
	- 하나의 JSP 페이지의 자원은 최대 생명주기가 해당 JSP 페이지이다. > JSP 페이지간의 데이터 공유는 불가능하다.
	
	
	첫번째 페이지 -> a
	
	1. <form> 태그 사용
	2. GET 방식 쿼리 문자열 사용
	3. request.setAttribute() + pageContext.forward()
	
	
	
*/
	int a = 10;
	request.setAttribute("a", a);
	//데이터 전송과 상관 없는것
	//response.sendRedirect("ex07_pagecontext_two.jsp");
	//데이터 전송하는 것
	//pageContext.forward("ex07_pagecontext_two.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp"%>
<style>
</style>
</head>
<body>
	<div class="container">
		<h1 class="page-header">
			<small></small>
		</h1>

		<div>
		<%-- 	a:<%=request.getParameter(a)%></div> --%>
			a:<%=request.getAttribute("a")%></div>
		<div>




	</div>

	<script>
		
	</script>
</body>

</html>