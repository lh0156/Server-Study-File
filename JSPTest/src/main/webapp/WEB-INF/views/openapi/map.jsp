<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	.container > div { margin: 10px 0; }
</style>
</head>
<body>
	<!-- openapi > map.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kakao Map</small></h1>
		
		<div><input type="button" value="첫번째 지도" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?01', 'child', '');"></div>
		
		<div><input type="button" value="좌표, 드래그, 확대/축소" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?02', 'child', '');"></div>
		
		<div><input type="button" value="마커 제어하기" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?03', 'child', '');"></div>
		
		<div><input type="button" value="마커 제어하기" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?04', 'child', '');"></div>
		
		<div><input type="button" value="마커 제어하기" class="btn btn-default" onclick="window.open('/jsp/openapi/map.do?05', 'child', '');"></div>
			
	</div>
	
	<script>
	
	</script>
</body>
</html>







