<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <%@ include file="/inc/asset.jsp" %>
   <style>
		.container {
			width: 1000px;
		}
		
		td {
			vertical-align: top !important;
			padding: 10px;
		}
		
		#map {
			width: 800px;
			height: 400px;
		}
		
		.list-group {
			width: 180px;
		}
		
		input {
			margin-bottom: 10px;
		}
		
   </style>
</head>
<body>
	<!-- ex08.jsp -->
	<div class="container">
		<h1 class="page-header">장소 즐겨찾기 <small>Kakao Map</small></h1>
		
		<table>
			<tr>
				<td>
					<div id="map"></div>
				</td>
				<td>
					<ul class="list-group">
						<c:forEach items="${list}" var="dto">
						<li class="list-group-item" data-lat="${dto.lat}" data-lng="${dto.lng}">${dto.name}</li>
						</c:forEach>
					</ul>
					<hr>
					<div class="panel panel-default">
						<div class="panel-heading">장소 추가</div>
						<div class="panel-body">
							<input type="text" name="name" autocomplete="off"
								class="form-control" id="name" required>
							<input type="button" value="추가하기"
								class="btn btn-default" id="btn">
						</div>
					</div>
				</td>
			</tr> 
		</table>
		
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1380dadbeabdb31d504967f94210d44d"></script>
	<script>
		
		var container = document.getElementById('map');
		
		var options = { 
			center: new kakao.maps.LatLng(37.499346, 127.033214),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
		
		
		//마커 등록하기
		var m;
		var lat, lng;
		
		daum.maps.event.addListener(map, "click", function(evt) {
			
			if (m != null) m.setMap(null);
			
			lat = evt.latLng.getLat();
			lng = evt.latLng.getLng();
			
			m = new daum.maps.Marker({
				position: evt.latLng
			});
					
			m.setMap(map);
			
			
			$('#name').focus();
			
			
		});
		
		
		$('#name').keyup(() => {
			if (event.keyCode == 13) {
				send();
			}
		});
		
		$('#btn').click(() => {
			send();
		});
		
		function send() {
			
			$.ajax({
				type: 'GET',
				url: '/jsp/ajax/ex08data.do',
				data: 'name=' + $('#name').val() + '&lat=' + lat + '&lng=' + lng,
				success: function(result) {
					if (result == '1') {
						$('.list-group').append('<li class="list-group-item" data-lat="' + lat + '" data-lng="' + lng + '" >' + $('#name').val() + '</li>');
						$('.list-group li').last().click(liClick);
						$('#name').val('');
					} else {
						alert('failed');
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
		}
		
		
		<c:forEach items="${list}" var="dto">
		var m2 = new daum.maps.Marker({
			position: new daum.maps.LatLng(${dto.lat}, ${dto.lng})
		});
		m2.setMap(map);
		</c:forEach>
		
		
		
		$('.list-group li').click(liClick);
		
		function liClick() {
			
			$('.list-group li').removeClass('active');
			$(this).addClass('active');
			
			map.panTo(new daum.maps.LatLng($(this).data('lat'),$(this).data('lng')));
		}
		
	</script>
</body>
</html>






