<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//'hong' > 정보 수정
	
	//1. DB 연결
	Connection conn = null;
	Statement stat = null;
	
	conn = DBUtil.open();
		
	//2. SQL
	String sql = "update tblJava set name = '홍동길', age = 30 where id = 'hong'";
	stat = conn.createStatement();
	int result = stat.executeUpdate(sql);
	
	//3. 연결 종료
	stat.close();
	conn.close();

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
	<!-- update.jsp -->
	<div class="container">
		<h1 class="page-header"> <small></small></h1>
		
		<% if (result > 0) { %>
			<div>수정 성공</div>
		<% } else { %>
			<div>수정 실패</div>
		<% } %>
			
	</div>
	
	<script>
	
	</script>
</body>
</html>







