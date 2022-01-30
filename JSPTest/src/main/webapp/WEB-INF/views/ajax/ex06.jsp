<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	.table { width: 400px; }
</style>
</head>
<body>

	<div class="container">
		<h1 class="page-header">회원 목록<small></small></h1>
		
		
		<form id="form1">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>아이디</th>
					<th>암호</th>
					<th>이름</th>
					<th>등급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td onclick="del('${dto.id}');">${dto.id}</td>
					<td>${dto.pw}</td>
					<td>${dto.name}</td>
					<td>${dto.lv}</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td><input type="text" class="form-control" required id="id" placeholder="아이디" autocomplete="off" name="id"></td>
					<td><input type="password" class="form-control" required id="pw" placeholder="암호" autocomplete="off" name="pw"></td>
					<td><input type="text" class="form-control" required id="name" placeholder="이름" autocomplete="off" name="name"></td>
					<td><input type="text" class="form-control" required id="lv" placeholder="등급" autocomplete="off" name="lv"></td>
				</tr>
			</tfoot>
		</table>
		</form>
	
	</div>

<script>
	
	$('#lv').keyup(()=>{
		if (event.keyCode == 13) {
			
			//alert($('#form1').serialize());
			
			//회원 가입 > Ajax
			$.ajax({
				type: 'POST',
				url: '/jsp/ajax/ex06data.do',
				data: $('#form1').serialize(),
				success: function(result) {
					if (result == '1') {
						
						//1. 테이블에 새로운 행 추가
						//2. 입력폼 초기화
						$('table tbody').append('<tr><td onclick="del(\'' + $('#id').val() + '\')">' + $('#id').val() + '</td><td>' + $('#pw').val() + '</td><td>' + $('#name').val() + '</td><td>' + $('#lv').val() + '</td></tr>');
						
						$('#id').val('');
						$('#pw').val('');
						$('#name').val('');
						$('#lv').val('');
						$('#id').focus();
						
					} else {
						alert('failed');
					}
				}
			});
			
		}
	});
	
	
	function del(id) {
		//alert(id);
		if (confirm('삭제하겠습니까?')) {
			
			let temp = event.srcElement; //<td>
			
			$.ajax({
				type: 'GET',
				url: '/jsp/ajax/ex06del.do',
				data: 'id=' + id,
				success: function(result) {
					if (result == '1') {
						$(temp).parent().remove();
					} else {
						alert('failed');
					}
				}
			});
		}
	}
	
</script>
</body>

</html>










