<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- ex01.jsp -->
	<div class="container">
		<h1 class="page-header">Ajax <small></small></h1>
		
		<div class="well" id="txt1"></div>
		<input type="button" value="버튼1" id="btn1" class="btn btn-default">
		
			
	</div>
	
	<script>
	
		$('#btn1').click(() => {
			
			//DB의 데이터를 가져와서 화면에 출력하기
			//location.href = '/jsp/ajax/ex01ok.do';
			
			//jQuery Ajax
			//$('태그').css();
			
			//jQuery 전역 함수
			//$.ajax() > 서버에게 데이터 요청 > 응답 데이터 수신 > 업무 처리 
			
			$.ajax({
				type: 'GET',						//요청 메소드 <form method="">
				url: '/jsp/data/data.txt',			//요청 대상 <form action="">
			
				success: function(result) {	//콜백 함수 > 응답 이벤트 함수
					$('#txt1').text(result);
				}
			});
			
			
		});	
	</script>
</body>
</html>







