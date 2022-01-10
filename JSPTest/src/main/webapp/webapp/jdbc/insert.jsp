<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//*** JDBC(Java)의 모든 SQL 작업은 자동 커밋이다. > 수동 커밋 전환 가능
	//1. Oracle > 프로시저 > 트랜잭션 제어
	//2. JDBC > Connection > 트랜잭션 제어
	

	//1. DB 연결(접속)
	// - 연결 문자열(DB 서버 접속 정보)
	// - Connection 클래스
	
	//2. DB 작업
	// - SQL 작성 + 실행
	// - Statement 클래스
	//		a. 반환값이 없는 SQL > insert, update, delete, create, alter, drop..
	//			- void executeUpdate()
	//		b. 반환값이 있는 SQL > select
	//			- ResultSet executeQuery()
	
	//3. DB 종료
	//	- Connection 클래스
	
	
	
	//JDBC 환경 설정(설치)
	// - webapp > WEB-INF > lib > ojdbc6.jar
	
	
	//1. DB 연결
	Connection conn = null;
	
	//연결 문자열(Connection String)
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "hr";
	String pw = "java1234";
	
	try {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		
		//DB 접속한 정보를 가지고 있는 Connection 객체 생성
		//conn = new Connection();
		conn = DriverManager.getConnection(url, id, pw);
		conn.setAutoCommit(false); //수동 트랜잭션 제어
		
		
		System.out.println(conn.isClosed()); //false
		
		
		
		//DB 작업 > insert
		//- SQL 작성 > "SQL" 문자열로 작성
		String sql = "insert into tblJava (id, name, age, regdate) values ('test', '테스트', 22, default)";
		
		Statement stat = null;
		
		stat = conn.createStatement();
		
		//SQL 실행
		stat.executeUpdate(sql); //SQL Developer > Ctrl + Enter 동일 행동
		
		//최종 선택
		conn.commit();
		
		//DB 접속 종료
		conn.close();
		
		System.out.println(conn.isClosed()); //true

	} catch (Exception e) {
		System.out.println(e);
		conn.rollback();
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
	<!-- insert.jsp -->
	<div class="container">
		<h1 class="page-header"> <small></small></h1>
		
		
			
	</div>
	
	<script>
	
	</script>
</body>
</html>







