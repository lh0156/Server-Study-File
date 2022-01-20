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
	<!-- map02.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kokao Map</small></h1>
		
		<div class="well">좌표 설정, 지도 드래그, 지도 확대 축소</div>
		
		<div id="map" style="height:400px;"></div>
		
		<div class="btns">
			<input type="button" value="서울역으로 이동하기" id="btn1" class="btn btn-default">
			<input type="button" value="역삼역으로 이동하기" id="btn2" class="btn btn-default">
		</div>
			
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1380dadbeabdb31d504967f94210d44d"></script>
	<script src="/jsp/data/map.js"></script>
	<script>
	
		var container = document.getElementById('map');
		
		var options = { 
			center: new kakao.maps.LatLng(37.499336, 127.033212),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
		
		
		//지도 드래그 제어
		map.setDraggable(false);
		
		//확대/축소 제어
		map.setZoomable(false);
		
		var mapTypeControl = new daum.maps.MapTypeControl();
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		
		$("#btn1").click(function() {
			
			var seoulStation = new daum.maps.LatLng(37.554909, 126.971319);
			map.setCenter(seoulStation);
			
		});
		
		
		$("#btn2").click(()=> {
			
			var yeoksamStation = new daum.maps.LatLng(plist[1].position.lat, plist[1].position.lng);
			
			//map.setCenter(yeoksamStation);
			map.panTo(yeoksamStation); //지도내에서 보이는 곳에 한해서 효과 발생
			
		});
		
		
	</script>
</body>
</html>







