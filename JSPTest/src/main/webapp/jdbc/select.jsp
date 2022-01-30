<%@page import="com.test.jdbc.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//반환값이 있는 쿼리
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null; //select 결과 테이블 참조 객체
	
	//1. DB 연결
	conn = DBUtil.open();
	
	//2.
	String sql = "select * from tblJava";
	stat = conn.createStatement();
	
	rs = stat.executeQuery(sql); //rs -> 결과 테이블
	
	

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
	<!-- select.jsp -->
	<div class="container">
		<h1 class="page-header">목록 <small></small></h1>
		
		<%
					
			//레코드를 한개씩 접근 > 커서 이동
			while (rs.next()) {
				
				//가르키고 있는 레코드의 데이터를 접근
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String regdate = rs.getString("regdate");
		%>
			<div><%= id %>, <%= name %>, <%= age %>, <%= regdate %></div>
		<%				
			}
		%>
			
	</div>
	
	<script>
	
	</script>
</body>
</html>
<%
	
	//3.
	rs.close();
	stat.close();
	conn.close();

%>






