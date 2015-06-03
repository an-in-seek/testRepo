<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><div align="center">

<table border="1" style="width:100%">
	<thead>
		<tr height="50px">
			<td style="border-left-style:hidden;border-top-style:hidden;border-right-style:hidden;" colspan="4">
				<select>
					<c:forEach items="${requestScope.buildingNames }" var="buildingName">
						<c:choose>
							<c:when test="${requestScope.currentBuildingName==buildingName }">
								<option selected="selected">${buildingName }</option>
							</c:when>
							<c:otherwise>
								<option>${buildingName }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<select>
					<option value="전체">전체보기</option>
					<c:forEach items="${requestScope.floors }" var="floor">
						<c:choose>
							<c:when test="${requestScope.currentFloor==floor }">
								<option selected="selected">${floor }층</option>
							</c:when>
							<c:otherwise>
								<option>${floor }층</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
			<td style="border-top-style:hidden;border-right-style:hidden;" colspan="3" align="right"><a href="${initParam.rootPath }/restaurant/addNewRestaurantForm.do"><button>맛집등록</button></a></td>
		</tr>
		<tr height="50px" align="center">
			<td width="10%" style="border-left-style:hidden;border-right-style:hidden;"><b>번호</b></td>
			<td width="10%" style="border-right-style:hidden;"><b>분류</b></td>
			<td colspan="2" width="40%" style="border-right-style:hidden;"><b>상호명</b></td>
			<td width="20%" style="border-right-style:hidden;"><b>전화번호</b></td>
			<td width="10%" style="border-right-style:hidden;"><b>평점</b></td>
			<td width="10%" style="border-right-style:hidden;"><b>조회수</b></td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty requestScope.restaurants }">
				<tr>
					<td align="center" height="50px" colspan="7" style="border-left-style:hidden;border-right-style:hidden;">등록된 맛집이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.restaurants }" var="restaurant">
					<tr align="center">
						<td style="border-left-style:hidden;border-right-style:hidden;">${restaurant.restaurantNo }</td>
						<td style="border-right-style:hidden;">${restaurant.category}</td>
						<td width="10%" style="border-right-style:hidden;">
							<img style="width:80px;height:60px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(restaurant.pictureName,',')[0]}">
						</td>
						<td align="left" style="border-right-style:hidden;">
							<a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${restaurant.restaurantNo }">${restaurant.restaurantName}</a>
							<c:if test="${restaurant.replyCount>0 }"><font color="gray">[${restaurant.replyCount }]</font></c:if>
							<c:if test="${requestScope.today==restaurant.regDate }"><img style="width:12px;height:10px;" src="${initParam.rootPath }/uploadPhoto/new.png"></c:if>
						</td>
						<td style="border-right-style:hidden;">${restaurant.phoneNo}</td>
						<td style="border-right-style:hidden;">${restaurant.score}</td>
						<td style="border-right-style:hidden;">${restaurant.hits}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<p/>

<!-- 페이징 처리 -->
<!-- 이전 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.previousPageGroup }">
		<a href="${initParam.rootPath }/restaurant/boardByLocation.do?currentPage=${pagingBean.startPageOfPageGroup-1}&buildingName=${requestScope.currentBuildingName}&floor=${requestScope.currentFloor}">&lt;</a>
	</c:when>
	<c:otherwise>
		&lt;
	</c:otherwise>
</c:choose>	
<!-- 페이지 번호 -->
<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
	&nbsp;
	<c:choose>
		<c:when test="${pageNum == pagingBean.currentPage }">
			<u><b>${pageNum}</b></u>
		</c:when>
		<c:otherwise>
			<a href="${initParam.rootPath }/restaurant/boardByLocation.do?currentPage=${pageNum}&buildingName=${requestScope.currentBuildingName}&floor=${requestScope.currentFloor}">${pageNum}</a>
		</c:otherwise>
	</c:choose>
	&nbsp;
</c:forEach>
<!-- 다음 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="${initParam.rootPath }/restaurant/boardByLocation.do?currentPage=${pagingBean.endPageOfPageGroup+1}&buildingName=${requestScope.currentBuildingName}&floor=${requestScope.currentFloor}">&gt;</a>
	</c:when>
	<c:otherwise>
		&gt;
	</c:otherwise>
</c:choose>

</div></body>
</html>