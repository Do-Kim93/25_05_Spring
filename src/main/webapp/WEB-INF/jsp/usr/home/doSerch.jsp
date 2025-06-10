<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>
<table class="min-w-full divide-y divide-gray-200">
  <thead class="bg-gray-50">
    <tr>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">도로명 주소</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">계약일</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">보증금</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">임대방식</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">면적</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">층</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">위험내용</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">위험레벨</th>
      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">위험이유</th>
    </tr>
  </thead>
  <tbody class="bg-white divide-y divide-gray-200">
    <c:forEach var="Address" items="${addr}">
      <tr class="odd:bg-white even:bg-gray-50">
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.road_address}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.contract_date}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.deposit}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.lease_type}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.area}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.floor}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.warning_type}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.warning_level}</td>
        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${Address.warning_reason}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<%@ include file="../common/foot.jspf"%>
