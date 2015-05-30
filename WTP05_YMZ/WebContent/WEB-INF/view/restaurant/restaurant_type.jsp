<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><div align="center">
<a href="">한식</a> <a href="">양식</a> <a href="">중식</a> <a href="">일식</a>
<p/>
<table style="width:100%;">
<tr>
<td width="50%" align="left"></td>
<td width="50%" align="right"><a href="${initParam.rootPath }/restaurant/addNewRestaurantForm.do"><button>맛집등록</button></a></td>
</tr>
</table>
<table border="1">
	<thead>
		<tr align="center">
			<td width="70px">번호</td>
			<td width="70px">분류</td>
			<td width="250px">상호명</td>
			<td width="150px">전화번호</td>
			<td width="80px">평점</td>
			<td width="70px">조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.restaurantList }" var="restaurant">
			<tr align="center">
				<td>${restaurant.restaurantNo }</td>
				<td>${restaurant.category}</td>
				<td align="left">
					<a href="">${restaurant.restaurantName}</a>
					<c:if test="${restaurant.replyCount>0 }"><font color="gray">[${restaurant.replyCount }]</font></c:if>
				</td>
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
</div></body>
</html>