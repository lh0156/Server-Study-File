<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	.btns { margin-top: 20px; }
</style>
</head>
<body>
	<!-- map01.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kokao Map</small></h1>
		
		<div class="well">기본 지도를 출력합니다.</div>
		
		<div id="map" style="height:400px;"></div>
		
			
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1380dadbeabdb31d504967f94210d44d"></script>
	<script src="/jsp/data/map.js"></script>
	<script>
	
		var container = document.getElementById('map');
		
		var options = { 
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
		
	</script>
</body>
</html>







