<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.code } LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-24 text-xl px-4">
	<div class="mx-auto">
		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">

			<thead>
				<tr>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">Registration Date</th>
					<th style="text-align: center;">Title</th>
					<th style="text-align: center;">Writer</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articles }">
					<tr class="hover:bg-base-300">
						<td style="text-align: center;">${article.id}</td>
						<td style="text-align: center;">${article.regDate.substring(0,10)}</td>
						<td style="text-align: center;">
							<a class="hover:underline" href="detail?id=${article.id }">${article.title }</a>
						</td>
						<td style="text-align: center;">${article.extra__writer }</td>
					</tr>
				</c:forEach>

				<c:if test="${empty articles }">
					<tr>
						<td colspan="4" style="text-align: center;">게시글이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<form action="../article/list" method="POST">
		<select name="boardId">
			<option value="" selected disabled>게시판을 선택해주세요</option>
			<option value="1">공지사항</option>
			<option value="2">자유</option>
			<option value="3">QnA</option>
		</select>
		<select name="search">
			<option value="" selected disabled>검색</option>
			<option value="title">제목</option>
			<option value="body">내용</option>
			<option value="memberId">작성자</option>
		</select>

		<input class="input input-primary input-sm" required="required" name="keyWord" type="text" autocomplete="off"
			placeholder="검색어 입력" />
		<a href="?boardId=${board.id}&keyWord=${keyWord}">검색</a>
	</form>

	<c:if test="${totalPage > 1}">
		<div class="pagination">
			<c:forEach var="i" begin="1" end="${totalPage}">
				<c:choose>
					<c:when test="${i == page}">
						<strong>[${i}]</strong>
					</c:when>
					<c:otherwise>
						<a href="?boardId=${board.id}&page=${i}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</c:if>
</section>



<%@ include file="../common/foot.jspf"%>