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
	if("${requestScope.hasRight}"){
		$("#newRestaurantTd").append("<a href='${initParam.rootPath }/restaurant/login/admin/addNewRestaurantForm.do'><button>맛집등록</button>");
	}
	
	$("a").hover(function(){
		$(this).css("text-decoration","underline");
	},function(){
		$(this).css("text-decoration","none");
	});
	
	$("#align").on("change",function(){
		$("#alignForm").append("<input type='hidden' name='category' value='${requestScope.category}'>");
		alignForm.submit();
	});
	
	$("#alignForm select option[value=${requestScope.align}]").prop("selected","selected");
	
	$("#searchForm").on("submit",function(){
		if($("#search").val().trim()==""){
			return false;
		}
		$(this).append("<input type='hidden' name='category' value='${requestScope.category}'>");
		$(this).append("<input type='hidden' name='align' value='${requestScope.align}'>");
	});
});
</script>
</head>
<body><div align="center">
<a href="${initParam.rootPath }/restaurant/showListByType.do?category=전체&align=${requestScope.align}">전체보기</a>
<a href="${initParam.rootPath }/restaurant/showListByType.do?category=한식&align=${requestScope.align}">한식</a>
<a href="${initParam.rootPath }/restaurant/showListByType.do?category=양식&align=${requestScope.align}">양식</a>
<a href="${initParam.rootPath }/restaurant/showListByType.do?category=중식&align=${requestScope.align}">중식</a>
<a href="${initParam.rootPath }/restaurant/showListByType.do?category=일식&align=${requestScope.align}">일식</a>
<p/>
<table border="1" style="width:100%">
	<thead>
		<tr height="50px">
			<td style="border-left-style:hidden;border-top-style:hidden;border-right-style:hidden;" colspan="4">
				<form id="alignForm" action="${initParam.rootPath }/restaurant/showListByType.do" method="post">
				정렬:
				<select id="align" name="align">
					<option value="date">최근 등록일순</option>
					<option value="name">상호명순</option>
					<option value="hits">조회수 많은순</option>
					<option value="manyScore">평가 많은순</option>
					<option value="highScore">평점 높은순</option>
				</select>
				</form>
			</td>
			<td id="newRestaurantTd" style="border-top-style:hidden;border-right-style:hidden;" colspan="3" align="right"></td>
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
<p>

<!-- 페이징 처리 -->
<!-- 이전 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.previousPageGroup }">
		<a href="${initParam.rootPath }/restaurant/showListByType.do?currentPage=${pagingBean.startPageOfPageGroup-1}&category=${requestScope.category}&align=${requestScope.align}&searchWord=${requestScope.searchWord}">&lt;</a>
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
			<a href="${initParam.rootPath }/restaurant/showListByType.do?currentPage=${pageNum}&category=${requestScope.category}&align=${requestScope.align}&searchWord=${requestScope.searchWord}">${pageNum}</a>
		</c:otherwise>
	</c:choose>
	&nbsp;
</c:forEach>
<!-- 다음 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="${initParam.rootPath }/restaurant/showListByType.do?currentPage=${pagingBean.endPageOfPageGroup+1}&category=${requestScope.category}&align=${requestScope.align}&searchWord=${requestScope.searchWord}">&gt;</a>
	</c:when>
	<c:otherwise>
		&gt;
	</c:otherwise>
</c:choose>

<form id="searchForm" action="${initParam.rootPath }/restaurant/showListByType.do">
<input type="text" id="search" name="searchWord" value="${requestScope.searchWord }">
<input type="submit" value="검색">
</form>

</div></body>
</html>