<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>


<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">

	<thead>
		<tr>
			<th style="text-align: center;">주소</th>
			<th style="text-align: center;">도로명 주소</th>
			<th style="text-align: center;">계약일</th>
			<th style="text-align: center;">보증금</th>
			<th style="text-align: center;">월세</th>
			<th style="text-align: center;">면적</th>
			<th style="text-align: center;">층</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="Address" items="${addr }">
			<tr class="hover:bg-base-300">
				<td style="text-align: center;">${Address.address}</td>
				<td style="text-align: center;">${Address.road_address}</td>
				<td style="text-align: center;">${Address.contract_date}</td>
				<td style="text-align: center;">${Address.deposit}</td>
				<td style="text-align: center;">${Address.rent}</td>
				<td style="text-align: center;">${Address.area}</td>
				<td style="text-align: center;">${Address.floor}</td>
			</tr>
		</c:forEach>
	</tbody>


	<%@ include file="../common/foot.jspf"%>