<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("a").hover(function(){
		$(this).css("text-decoration","underline");
	},function(){
		$(this).css("text-decoration","none");
	});
	
	$("#align").on("change",function(){
		alignForm.submit();
	});
	
	$("#alignForm select option[value=${requestScope.align}]").prop("selected","selected");
	
	$("#searchForm").on("submit",function(){
		if($("#search").val().trim()==""){
			return false;
		}
		searchForm.submit();
	});
});
</script>
</head>
<body><div align="center">
<a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=전체">전체보기</a>
<a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=가족">가족</a>
<a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=연인">연인</a>
<a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=친구">친구</a>
<a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=회식">회식</a>
<p/>
<table border="1" style="width:100%;">
	<thead>
		<tr>
			<td style="border-left-style:hidden;border-top-style:hidden;border-right-style:hidden;" colspan="4">
				<form id="alignForm" action="${initParam.rootPath }/restaurant/showListByType.do" method="post">
				정렬방식:
				<select id="align" name="align">
					<option value="date">최근 등록일순</option>
					<option value="hits">조회수 많은순</option>
					<option value="manyScore">평가 많은순</option>
					<option value="highScore">평점 높은순</option>
				</select>
				<input type="hidden" name="category" value="${requestScope.category }">
				</form>
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
			<c:when test="${empty requestScope.restaurantList }">
				<tr>
					<td align="center" height="50px" colspan="7" style="border-left-style:hidden;border-right-style:hidden;">등록된 맛집이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.restaurantList }" var="restaurant">
					<tr align="center">
						<td style="border-left-style:hidden;border-right-style:hidden;">${restaurant.restaurantNo }</td>
						<td style="border-right-style:hidden;">${restaurant.category}</td>
						<td width="10%" style="border-right-style:hidden;">
							<img width="80" height="80" src="${initParam.rootPath }/uploadPhoto/${fn:substring(restaurant.pictureName, 0, 14)}">
						</td>
						<td align="left" style="border-right-style:hidden;">
							<a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${restaurant.restaurantNo }">${restaurant.restaurantName}</a>
							<c:if test="${restaurant.replyCount>0 }"><font color="gray">[${restaurant.replyCount }]</font></c:if>
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
<p>

<!-- 페이징 처리 -->
<!-- 이전 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.previousPageGroup }">
		<a href="${initParam.rootPath }/restaurant/showListByTheme.do?currentPage=${pagingBean.startPageOfPageGroup-1}">&lt;</a>
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
			<a href="${initParam.rootPath }/restaurant/showListByTheme.do?currentPage=${pageNum}">
				${pageNum}
			</a>
		</c:otherwise>
	</c:choose>
	&nbsp;
</c:forEach>
<!-- 다음 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="${initParam.rootPath }/restaurant/showListByTheme.do?currentPage=${pagingBean.endPageOfPageGroup+1}">&gt;</a>
	</c:when>
	<c:otherwise>
		&gt;
	</c:otherwise>
</c:choose>

<form id="searchForm" action="${initParam.rootPath }/restaurant/showListByTheme.do">
<input type="text" id="search" name="searchWord">
<input type="submit" value="검색">
<input type="hidden" name="theme" value="${requestScope.category }">
<input type="hidden" name="align" value="${requestScope.align }">
</form>

</div></body>
</html>