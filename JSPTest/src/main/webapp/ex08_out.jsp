<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1 class="page-header">구구단<small>out 사용 X</small></h1>
		<% int dan = 5; %>
		
		<!-- 선생님은 100에 90은 스파게티 코드로 쓰시는 편 -->
		<% for (int i=1; i<=9; ++i) { %>
		<div><%= dan %> x <%= i %> = <%= dan*i %></div>
		<% } %>
		
		<h1 class="page-header">구구단<small>out 사용 O</small></h1>
		
		<%
			for (int i=1; i<=9; ++i) {
				out.println(String.format("<div>%d x %d = %d</div>", dan, i, dan*i));
			}
		 %>
		
		<%-- <div> <%= a %></div> --%>
	<div><%=session.getAttribute("num") %></div>
		
	</div>

<script>

</script>
</body>

</html>