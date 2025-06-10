<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="https://cdn.tailwindcss.com"></script>
<c:set var="pageTitle" value="Project" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>전세사기 방지 플랫폼 - 데모</title>
</head>
<body class="bg-gray-50 text-gray-800">
	<!-- 네비게이션 & 검색바 -->
	<nav class="bg-white shadow mb-6">
		<div class="max-w-7xl mx-auto px-4 py-4 flex items-center justify-between">
			<h1 class="text-2xl font-semibold">전세사기 방지 플랫폼</h1>
			<form id="search-bar" class="flex space-x-2">
				<input id="address-input" type="text" placeholder="도로명 주소"
					class="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" />
				<input id="floor-input" type="number" placeholder="층"
					class="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" />
				<button id="search-btn" type="button" class="bg-blue-600 hover:bg-blue-700 text-white font-medium px-4 py-2 rounded">
					검색</button>
			</form>
		</div>
	</nav>


	<!-- 지도 및 결과 영역 -->
	<div class="max-w-7xl mx-auto px-4">
		<!-- 지도 영역 -->
		<div id="map" class="w-full h-96 rounded-lg shadow-lg mb-6"></div>
		<!-- 결과 테이블 포함 -->
		<div id="results" class="bg-white shadow-lg rounded-lg overflow-x-auto">
			<!-- 초기 로드 시 빈 상태: AJAX로 채워집니다 -->
			<div class="p-4 text-gray-500">검색 결과가 여기에 표시됩니다.</div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cd954871c0d9192614f489194845539&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var geocoder = new kakao.maps.services.Geocoder();
		var marker = new kakao.maps.Marker({
			map : map
		});

		document
				.getElementById('search-btn')
				.addEventListener(
						'click',
						function(e) {
							e.preventDefault(); // form 전송 막기

							var address = document
									.getElementById('address-input').value
									.trim();
							var floor = document.getElementById('floor-input').value
									.trim();

							if (!address || !floor) {
								alert('주소와 층을 모두 입력해주세요.');
								return;
							}

							// 1. 지도 이동
							geocoder.addressSearch(address, function(result,
									status) {
								if (status === kakao.maps.services.Status.OK) {
									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);
									map.setCenter(coords);
									marker.setPosition(coords);
								}
							});

							// 2. Ajax 요청으로 검색 결과 가져오기
							$.ajax({
								url : './doSerch',
								method : 'GET',
								data : {
									address : address,
									floor : floor
								},
								success : function(html) {
									$('#results').html(html); // 결과 테이블 삽입
								},
								error : function() {
									$('#results').html(
											'<p>검색 결과를 불러오는 데 실패했습니다.</p>');
								}
							});
						});
	</script>

</body>
</html>
