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
	<!-- map05.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kokao Map</small></h1>
		
		<div class="well">마커</div>
		
		<div id="map" style="height:400px;"></div>
		
			
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1380dadbeabdb31d504967f94210d44d"></script>
	<script src="/jsp/data/map.js"></script>
	<script>
	
		var container = document.getElementById('map');
		
		var options = { 
			center: new kakao.maps.LatLng(plist[0].position.lat, plist[0].position.lng),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
		
		
		plist.forEach((item) => {
			
			var m = new daum.maps.Marker({
				position: new daum.maps.LatLng(item.position.lat,item.position.lng)
			});
			
			m.setMap(map);
			
		});
		
		
		
		
		
		
		daum.maps.event.addListener(map, 'dragend', function(evt) {
			
			//alert();
			
			//지도 영역 반환
			//$('.well').text(map.getBounds());
			//$('.well').text(map.getBounds().getSouthWest()); //남서쪽 좌표
			//$('.well').text(map.getBounds().getNorthEast()); //북동쪽 좌표
			
			var mcount = 0;
			var sw = map.getBounds().getSouthWest();
			var ne = map.getBounds().getNorthEast();
			
			plist.forEach((item) => {
				if (item.position.lat >= sw.getLat()
					&& item.position.lat <= ne.getLat()
					&& item.position.lng >= sw.getLng()
					&& item.position.lng <= ne.getLng()) {
					mcount++;
				}
			});
			
			$('.well').text('마커: ' + mcount + '개');
			
		});
		
		
		
		daum.maps.event.addListener(map, 'zoom_changed', function(evt) {
			
			//alert();
			
			//지도 영역 반환
			//$('.well').text(map.getBounds());
			//$('.well').text(map.getBounds().getSouthWest()); //남서쪽 좌표
			//$('.well').text(map.getBounds().getNorthEast()); //북동쪽 좌표
			
			var mcount = 0;
			var sw = map.getBounds().getSouthWest();
			var ne = map.getBounds().getNorthEast();
			
			plist.forEach((item) => {
				if (item.position.lat >= sw.getLat()
					&& item.position.lat <= ne.getLat()
					&& item.position.lng >= sw.getLng()
					&& item.position.lng <= ne.getLng()) {
					mcount++;
				}
			});
			
			$('.well').text('마커: ' + mcount + '개');
			
		});
		
		
		
	</script>
</body>
</html>







