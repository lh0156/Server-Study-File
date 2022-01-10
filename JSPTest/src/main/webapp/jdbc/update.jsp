<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//'hong' > 정보 수정
	
	//1. DB 연결
	
	Connection conn = null;
	Statement stat = null;
	
	conn = DBUtil.open();
	
	//2. SQl
	String sql = "update tblJava set name = '엄섭윤', age = 25 where id = 'lh0156'";
	stat = conn.createStatement();
	int result = stat.executeUpdate(sql);
	
	//연결 종료
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
		<h1 class="page-header"><small></small></h1>
	<% if (result > 0){ %>
		<div>'test' 계정을 삭제했습니다.</div>
	<% } else { %>
		<div>'test' 계정을 삭제를 실패했습니다.</div>
	<% } %>
	
	</div>

<script>

</script>
</body>

</html>