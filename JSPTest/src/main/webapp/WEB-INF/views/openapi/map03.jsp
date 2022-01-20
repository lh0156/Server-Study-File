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
	
	#map, #tbl {
		float: left;
	}
	
	#map { width: 80%; }
	#tbl { width: 20%; }
	
</style>
</head>
<body>
	<!-- map03.jsp -->
	<div class="container">
		<h1 class="page-header">Map API <small>Kokao Map</small></h1>
		
		<div class="well">마커 제어하기</div>
		
		<div id="map" style="height:400px;"></div>
		<table id="tbl" class="table table-bordered">
			<thead>
				<tr>
					<th>장소</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		
			
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
		
		
		
		
		/*
		//특정 위치에 마커 표시하기(정적)
		var m1 = new daum.maps.Marker({
			position: new daum.maps.LatLng(37.499336, 127.033212)
		});
		
		//지도에 마커를 추가하기
		m1.setMap(map);
		*/
		
		
		/*
		plist.forEach((item) => {
			
			var m = new daum.maps.Marker({
				position: new daum.maps.LatLng(item.position.lat, item.position.lng)
			});
			
			m.setMap(map);
			
		});
		*/
		
		
		plist.forEach((item, index) => {
			
			$("#tbl").append("<tr><td onclick='showMarker(" + index + ");'>" + item.name + "</td></tr>");
			
		});
		
		
		var m1;
		
		function showMarker(index) {
			//alert(plist[index].name);
			
			//지도상에 마커를 유일하게..
			if (m1 != null) {
				m1.setMap(null);
			}
			
			m1 = new daum.maps.Marker({
				position: new daum.maps.LatLng(plist[index].position.lat, plist[index].position.lng)
			});
			
			m1.setMap(map);
			
			map.panTo(new daum.maps.LatLng(plist[index].position.lat, plist[index].position.lng));
			
			
			$('#tbl tbody tr').css('background-color', 'transparent');
			$('#tbl tbody tr').eq(index).css('background-color', 'cornflowerblue');
			
		}
		
	</script>
</body>y
</html>







