<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="">한식</a> <a href="">양식</a> <a href="">중식</a> <a href="">일식</a>
<p>
<table>
	<thead>
		<tr>
			<td>번호</td>
			<td>분류</td>
			<td>상호명</td>
			<td>전화번호</td>
			<td>평점</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.restaurantList }" var="restaurant">
			<tr>
				<td>${restaurant.restaurantNo }</td>
				<td>${restaurant.category}</td>
				<td>${restaurant.restaurantName}</td>
				<td>${restaurant.phoneNo}</td>
				<td>${restaurant.score}</td>
				<td>${restaurant.hits}</td>
			</tr> 
		</c:forEach>
	</tbody>
</table>
<p>

<!-- 페이징 처리 -->
<!-- 이전 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.previousPageGroup }">
		<a href="${initParam.rootPath }/restaurant/showListByType.do?currentPage=${pagingBean.startPageOfPageGroup-1}">◀</a>
	</c:when>
	<c:otherwise>
		◀
	</c:otherwise>
</c:choose>	
<!-- 페이지 번호 -->
<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
	<c:choose>
		<c:when test="${pageNum == pagingBean.currentPage }">
			<b>[${pageNum}]</b>
		</c:when>
		<c:otherwise>
			<a href="${initParam.rootPath }/member/memberListPaging.do?page=${pageNum}">
				${pageNum}
			</a>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;
</c:forEach>
<!-- 다음 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="${initParam.rootPath }/restaurant/showListByType.do?currentPage=${pagingBean.endPageOfPageGroup+1}">▶</a>
	</c:when>
	<c:otherwise>
		▶
	</c:otherwise>
</c:choose>
<p>

<a href="">맛집등록</a>
</body>
</html>