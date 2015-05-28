<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript">
	$(document).ready(function() {
		$("table#listTB tbody tr").on("mouseover", function() {
			$("table#listTB tbody tr").css("background-color", "white");
			$(this).css("background-color", "silver");
		});
	});
</script>

<style type="text/css">
table#listTB thead tr{
	font-weight: bold;
	background: lightgray;
}
table#listTB tbody tr{
	cursor: pointer;
}
div#dialog{
	width:400px;
	display: none;
}
article{
	border-bottom: 1px solid black;
	padding: 5px;
	padding-left: 10px;
}
</style>

<h2 align="center">고객센터(Q&A)</h2>

<%-- <c:if test="${fn:length(requestScope.qna_list) != 0 }"> --%>
	<table align="center" id="listTB" style="width: 700px" border="1">
		<thead>
			<tr align="center">
				<td>NO</td>
				<td>제목</td>
				<td>분류</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.qna_list }" var="qna">
				<tr align="center">
					<td>${qna.number }</td>
					<td>${qna.title}</td>
					<td>${qna.category}</td>
					<td>${qna.memberId}</td>
					<td>${qna.registrationDate}</td>
					<td>${qna.hits}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" >
		<tr height="10" align="center"></tr>
	</table>

	

	<table>
		<tr>
			<td>
			<select id="searchSort">
					<option>정렬방식</option>
					<option value="추천수">추천수</option>
					<option value="조회수">조회수</option>
					<option value="최신글">최신글</option>
			</select>
			</td>
			<td><input type="text" id="searchText"></td>
			<td><input type="button" id="searchBtn" value="검색"></td>
			<td>
				<form action="${initParam.rootPath }/qna/writeForm.do" method="post">
					<input type="submit" value="글쓰기">
				</form>
			</td>
		</tr>
	</table>
<%-- </c:if> --%>

<p align="center">
	<!-- 페이징 처리 -->
	<!-- 이전 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean1.previousPageGroup }">
			<a
				href="${initParam.rootPath }/qna/qnaList.do?page=${pagingBean1.startPageOfPageGroup-1}">◀</a>
		</c:when>
		<c:otherwise>◀</c:otherwise>
	</c:choose>
	<!-- 페이지 번호 -->
	<c:forEach begin="${pagingBean1.startPageOfPageGroup }" end="${pagingBean1.endPageOfPageGroup}" var="pageNum">
		<c:choose>
			<c:when test="${pageNum == pagingBean1.currentPage }">
				<b>[${pageNum}]</b>
			</c:when>
			<c:otherwise>
				<a href="${initParam.rootPath }/qna/qnaList.do?page=${pageNum}">${pageNum} </a>
			</c:otherwise>
		</c:choose>
	&nbsp;&nbsp;
</c:forEach>
	<!-- 다음 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean1.nextPageGroup }">
			<a href="${initParam.rootPath }/qna/qnaList.do?page=${pagingBean1.endPageOfPageGroup+1}">▶</a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
</p>
