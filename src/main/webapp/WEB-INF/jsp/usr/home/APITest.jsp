<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="타슈" />

<script>
	const API_KEY = 'sJ4HItdinisDninoszV8jJ49ywRtNrqvhAl%2Bp6fuO0yryS%2F8G17QSLmH0qjXqQvopgqhYPDu%2FfC8NfwUcq7Zgw%3D%3D'; // Encoding된 키

	async function getAirData() {
		const url = 'https://apis.data.go.kr/1613000/RTMSDataSvcAptTrade/getRTMSDataSvcAptTrade'
			+ '?LAWD_CD=11200'
			+ '&DEAL_YMD=202505'
			+ '&numOfRows=999'
			+ '&serviceKey=' + API_KEY;

		try {
			const response = await fetch(url);
			if (!response.ok) {
				throw new Error(`HTTP 오류! 상태 코드: ${response.status}`);
			}

			const xmlText = await response.text();
			const parser = new DOMParser();
			const xml = parser.parseFromString(xmlText, "application/xml");

			// 에러 메시지 확인 (있을 경우)
			const errMsg = xml.querySelector("errMsg")?.textContent;
			if (errMsg) {
				console.warn("API 에러 메시지:", errMsg);
				return;
			}

			const itemsNode = xml.querySelector("items");
			if (!itemsNode) {
				console.log("조회된 항목이 없습니다.");
				return;
			}

			const serializer = new XMLSerializer();
			const itemsXmlString = serializer.serializeToString(itemsNode);

			console.log("전체 items XML:\n", itemsXmlString);

		} catch (e) {
			console.error("API 호출 실패:", e);
		}
	}

	getAirData();
</script>

<%@ include file="../common/head.jspf"%>
<%@ include file="../common/foot.jspf"%>