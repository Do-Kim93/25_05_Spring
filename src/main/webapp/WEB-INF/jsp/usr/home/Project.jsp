<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Project" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전세사기 방지 플랫폼 - 데모</title>
<style>
/* 기본 레이아웃 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

header {
	background-color: #f8f8f8;
	padding: 16px;
	text-align: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#search-bar {
	display: flex;
	justify-content: center;
	margin: 20px;
}

#address-input {
	width: 300px;
	padding: 8px;
	font-size: 16px;
}

#search-btn {
	padding: 8px 12px;
	margin-left: 8px;
	font-size: 16px;
	cursor: pointer;
}

#map {
	width: 100%;
	height: 400px;
	min-height: 300px;
}

#results {
	padding: 20px;
	background: #fff;
}
</style>
</head>
<body>
	<header>
		<h1>전세사기 방지 플랫폼</h1>
	</header>
<form method="POST" action="./doSerch">
	<div id="search-bar">
		<input type="text" name="address" id="address-input" placeholder="주소를 입력하세요">
		<input type="number" name="floor" id="floor-input" placeholder="층을 입력하세요">
		<button id="search-btn">검색</button>
	</div>
</form>
	<div id="map"></div>

	<div id="results">
		<h2>검색 결과</h2>
		<p>여기에 결과가 표시됩니다.</p>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cd954871c0d9192614f489194845539&libraries=services"></script>
	<script>
		// 지도 초기화
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 지오코더 및 마커 생성
		var geocoder = new kakao.maps.services.Geocoder();
		var marker = new kakao.maps.Marker({
			map : map
		});

		// 검색 버튼 클릭 이벤트
		document
				.getElementById('search-btn')
				.addEventListener(
						'click',
						function() {
							var address = document
									.getElementById('address-input').value
									.trim();
							if (!address) {
								alert('주소를 입력해주세요.');
								return;
							}
							geocoder
									.addressSearch(
											address,
											function(result, status) {
												if (status === kakao.maps.services.Status.OK) {
													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);
													map.setCenter(coords);
													marker.setPosition(coords);
													// 간단한 결과 표시
													document
															.getElementById('results').innerHTML = '<p>위도: '
															+ result[0].y
															+ ', 경도: '
															+ result[0].x
															+ '</p>';
												} else {
													alert('검색 결과가 없습니다.');
												}
											});
						});
	</script>
</body>
</html>
