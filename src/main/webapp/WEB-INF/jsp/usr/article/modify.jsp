<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<form action="/usr/article/doModify" method="post">
    <input type="hidden" name="id" value="${article.id}" />
    <div>번호 : ${article.id}</div>
    <div>날짜 : ${article.regDate}</div>
    <div>
        새 제목 :
        <input type="text" placeholder="제목 입력" name="title" value="${article.title}" />
    </div>
    <div>
        새 내용 :
        <textarea placeholder="내용 입력" name="body">${article.body}</textarea>
    </div>
    <button type="submit">수정</button>
</form>



<%@ include file="../common/foot.jspf"%>