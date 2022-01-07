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
		<h1 class="page-header">세션<small></small></h1>
		<%
		
			//페이지 방문 카운트
			int a = 1;
		
			a++;
			
			
			//상태 유지 코드(세션에 넣으면 값을 유지할 수 있다.)
			if (session.getAttribute("count") == null){
				session.setAttribute("count", 1);
			}else{
				session.setAttribute("count", (int)session.getAttribute("count") + 1);
			}
		
			if (application.getAttribute("count") == null){
				application.setAttribute("count", 1);
			}else{
				application.setAttribute("count", (int)application.getAttribute("count") + 1);
			}
		%>
	</div>
	
	<div>count: <%= a %></div>
	<div>count: <%= session.getAttribute("count") %></div>
	<div>application: <%= application.getAttribute("count") %></div>

<script>

</script>
</body>

</html>