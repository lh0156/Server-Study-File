<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//접속한 유저가 인증 사용자인지?
	if (session.getAttribute("id") == null || !session.getAttribute("lv").toString().equals("1")) {
				
		out.print("<html><head><meta charset='utf-8'></head><body><script>alert('로그인!! or 권한 불충분!!');location.href='index.jsp';</script></body></html>");
		out.close(); // 이 이후의 코드를 실행(출력)하지 않는다.
		
	}

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
	<!-- admin.jsp -->
	<div class="container">
		<h1 class="page-header"> <small></small></h1>
		
		
			
	</div>
	
	<script>
	
	</script>
</body>
</html>







