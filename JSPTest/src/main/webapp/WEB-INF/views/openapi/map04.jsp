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
	<!-- map04.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kokao Map</small></h1>
		
		<div class="well">마커 제어하기</div>
		
		<div id="map" style="height:400px;"></div>
		
			
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
		
		var m;
		
		//지도 객체 + 이벤트 추가
		daum.maps.event.addListener(map, "click", function(evt) {
			
			//alert();
			
			//클릭한 좌표?
			//alert(evt.latLng);
			
			$('.well').text('마커 제어하기 > 클릭한 위치(위도: ' + evt.latLng.getLat() + ', 경도: ' + evt.latLng.getLng() + ')');
			
			if (m != null) m.setMap(null);
			
			m = new daum.maps.Marker({
				position: evt.latLng
			});
			
			m.setTitle('이곳을 선택하셨습니다.');
			
			m.setMap(map);
			
		});
		
		
	</script>
</body>
</html>







