<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<h2 align="center">신고 목록</h2> 

<c:choose>
	<c:when test="${fn:length(requestScope.reported_list) != 0 }">
	<table id="listTB"  border="1">
		<thead>
			<tr align="center">
				<td>번호</td>
				<td>신고번호</td>
				<td>분류</td>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${requestScope.reported_list }" var="reported"
					varStatus="cnt">
					<tr align="center">
						<td>${cnt.count }</td>
						<td>${reported.reportNo }</td>
						<td>${reported.category}</td>
					</tr>
				</c:forEach>
			</tbody>
	</table>

	<p align="center">
	<!-- 페이징 처리 -->
	<!-- 이전 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.previousPageGroup }">
			<a href="${initParam.rootPath }/reported/login/reportedList.do?page=${pagingBean.startPageOfPageGroup-1}">◀&nbsp;</a>
		</c:when>
		<c:otherwise>◀&nbsp;</c:otherwise>
	</c:choose>	
	<!-- 페이지 번호 -->
	<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
		<c:choose>
			<c:when test="${pageNum == pagingBean.currentPage }">
				&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
			</c:when>
			<c:otherwise>
				<a href="${initParam.rootPath }/reported/login/reportedList.do?page=${pageNum}">&nbsp;${pageNum}&nbsp;</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<!-- 다음 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.nextPageGroup }">
			<a href="${initParam.rootPath }/reported/login/reportedList.do?page=${pagingBean.endPageOfPageGroup+1}">&nbsp;▶</a>
		</c:when>
		<c:otherwise>&nbsp;▶</c:otherwise>
	</c:choose>	
	</p>
	</c:when>
</c:choose>
