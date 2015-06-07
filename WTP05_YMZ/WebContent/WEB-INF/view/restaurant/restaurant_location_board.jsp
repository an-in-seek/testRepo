<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	color: black;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	if("${requestScope.isAdmin}"){
		$("#newRestaurantTd").append("<a href='${initParam.rootPath }/restaurant/login/admin/addNewRestaurantForm.do'><button>맛집등록</button>");
	}
	
	$("a").hover(function(){
		$(this).css("text-decoration","underline");
	},function(){
		$(this).css("text-decoration","none");
	});
	
	$("#buildingSelect").on("change",function(){
		$("#floorSelect").val("전체");
		$("#alignSelect").val("${requestScope.currentAlign}");
		$("#selectForm").submit();
	});
	
	$("#floorSelect").on("change",function(){
		$("#alignSelect").val("${requestScope.currentAlign}");
		$("#selectForm").submit();
	});
	
	$("#alignSelect").on("change",function(){
		$("#selectForm").submit();
	});
	
	$("#searchForm").on("submit",function(){
		if($("#search").val().trim()==""){
			return false;
		}
		$(this).append("<input type='hidden' name='buildingName' value='${currentBuildingName}'>");
		$(this).append("<input type='hidden' name='floor' value='${currentFloor}'>");
		$(this).append("<input type='hidden' name='align' value='${currentAlign}'>");
	});
	
	$("#alignSelect option[value=${requestScope.currentAlign}]").prop("selected","selected");
	
	$("td.pagingNo").hover(function(){
		$(this).css("border-style","solid").css("border-color","red");
	},function(){
		$(this).css("border-style","none");
	});
	
	$("tr.selectList").hover(function(){
		$(this).css("background-color","lightgray");
	},function(){
		$(this).css("background","none");
	});
});
</script>
</head>
<body><div align="center">

<table border="1" style="width:100%">
	<thead>
		<tr height="50px">
			<td style="border-left-style:hidden;border-top-style:hidden;border-right-style:hidden;" colspan="4">
			<form id="selectForm" action="${initParam.rootPath }/restaurant/boardByLocation.do" method="post">
				위치:
				<select id="buildingSelect" name="buildingName">
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
				<select id="floorSelect" name="floor">
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
				정렬:
				<select id="alignSelect" name="align">
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
		<tr height="60px" align="center">
			<td width="10%" style="border-left-style:hidden;border-right-style:hidden;"><font size="4"><b>번호</b></font></td>
			<td width="10%" style="border-right-style:hidden;"><font size="4"><b>분류</b></font></td>
			<td colspan="2" width="40%" style="border-right-style:hidden;"><font size="4"><b>상호명</b></font></td>
			<td width="20%" style="border-right-style:hidden;"><font size="4"><b>전화번호</b></font></td>
			<td width="10%" style="border-right-style:hidden;"><font size="4"><b>평점</b></font></td>
			<td width="10%" style="border-right-style:hidden;"><font size="4"><b>조회수</b></font></td>
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
					<tr class="selectList" align="center">
						<td style="border-left-style:hidden;border-right-style:hidden;">${restaurant.restaurantNo }</td>
						<td style="border-right-style:hidden;">${restaurant.category}</td>
						<td width="10%" style="border-right-style:hidden;">
							<img style="width:80px;height:60px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(restaurant.pictureName,',')[0]}">
						</td>
						<td align="left" style="border-right-style:hidden;">
							<a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${restaurant.restaurantNo }&backURL=${initParam.rootPath}/restaurant/boardByLocation.do?buildingName=${requestScope.currentBuildingName}%26floor=${requestScope.currentFloor }%26align=${requestScope.currentAlign}%26currentPage=${requestScope.pagingBean.currentPage}%26searchWord=${requestScope.searchWord}">${restaurant.restaurantName}</a>
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
<table border="1" style="border-style:none;border-color:white;">
<tr style="border-style:none;">
<!-- 이전 페이지 그룹 -->
<td>
<c:choose>
	<c:when test="${pagingBean.previousPageGroup }">
		<a href="${initParam.rootPath }/restaurant/boardByLocation.do?currentPage=${pagingBean.startPageOfPageGroup-1}&buildingName=${requestScope.currentBuildingName}&floor=${requestScope.currentFloor}&align=${requestScope.currentAlign}&searchWord=${requestScope.searchWord}">&lt;</a>
	</c:when>
	<c:otherwise>
		&lt;
	</c:otherwise>
</c:choose>
</td>
<!-- 페이지 번호 -->
<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
	<c:choose>
		<c:when test="${pageNum == pagingBean.currentPage }">
			<td style="padding:1px;border-color:red;border-style:solid;">
				&nbsp;
				<font color="red"><b>${pageNum}</b></font>
				&nbsp;
			</td>
		</c:when>
		<c:otherwise>
			<td class="pagingNo" style="padding:1px;">
				&nbsp;
				<a href="${initParam.rootPath }/restaurant/boardByLocation.do?currentPage=${pageNum}&buildingName=${requestScope.currentBuildingName}&floor=${requestScope.currentFloor}&align=${requestScope.currentAlign}&searchWord=${requestScope.searchWord}">${pageNum}</a>
				&nbsp;
			</td>
		</c:otherwise>
	</c:choose>
	&nbsp;
</c:forEach>
<!-- 다음 페이지 그룹 -->
<td>
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="${initParam.rootPath }/restaurant/boardByLocation.do?currentPage=${pagingBean.endPageOfPageGroup+1}&buildingName=${requestScope.currentBuildingName}&floor=${requestScope.currentFloor}&align=${requestScope.currentAlign}&searchWord=${requestScope.searchWord}">&gt;</a>
	</c:when>
	<c:otherwise>
		&gt;
	</c:otherwise>
</c:choose>
</td>
</tr>
</table>
<p/>
<form id="searchForm" action="${initParam.rootPath }/restaurant/boardByLocation.do">
<input type="text" id="search" name="searchWord" value="${requestScope.searchWord }">
<input type="submit" value="검색">
</form>

</div></body>
</html>