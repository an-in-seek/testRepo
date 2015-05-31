<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#selectedPicture").prop("src",$("#selectPicture img:first").prop("src"));
	
	$(".isUpload").on("click",function(){
		$("#selectedPicture").prop("src",$(this).prop("src"));
	});
});
</script>
</head>
<body>
<table style="width:100%;">
<tr>

<td style="width:50%">
<table border="1" style="width:100%">
<tr align="center">
<td colspan="5"><img id="selectedPicture"></td>
</tr>
<tr id="selectPicture" align="center">
<td style="width:20%">
	<c:if test="${!empty requestScope.pic1 }"><img class="isUpload" src="${initParam.rootPath }/uploadPhoto/${requestScope.pic1}"></c:if>
</td>
<td style="width:20%">
	<c:if test="${!empty requestScope.pic2 }"><img class="isUpload" src="${initParam.rootPath }/uploadPhoto/${requestScope.pic2}"></c:if>
</td>
<td style="width:20%">
	<c:if test="${!empty requestScope.pic3 }"><img class="isUpload" src="${initParam.rootPath }/uploadPhoto/${requestScope.pic3}"></c:if>
</td>
<td style="width:20%">
	<c:if test="${!empty requestScope.pic4 }"><img class="isUpload" src="${initParam.rootPath }/uploadPhoto/${requestScope.pic4}"></c:if>
</td>
<td style="width:20%">
	<c:if test="${!empty requestScope.pic5 }"><img class="isUpload" src="${initParam.rootPath }/uploadPhoto/${requestScope.pic5}"></c:if>
</td>
</tr>
</table>
</td>

<td valign="top" style="width:50%">
<table>
<tr>
	<td style="width:100px" align="center">상호명</td>
	<td>${requestScope.restaurant.restaurantName }</td>
</tr>
<tr>
	<td align="center">업종</td>
	<td>${requestScope.restaurant.category }</td>
</tr>
<tr>
	<td align="center">전화번호</td>
	<td>${requestScope.restaurant.phoneNo }</td>
</tr>
<tr>
	<td align="center">위치</td>
	<td>${requestScope.restaurant_location }</td>
</tr>
<tr>
	<td align="center">평점</td>
	<td>${requestScope.restaurant.score }</td>
</tr>
<tr>
	<td align="center">테마</td>
	<td>${requestScope.restaurant.theme }</td>
</tr>
<tr>
	<td align="center">소개</td>
	<td>${requestScope.restaurant.description }</td>
</tr>
</table><p>
<hr>
<p align="right"><button>수정</button> <button>삭제</button></p>
</td>
</tr>
</table>

<!-- 여기부터 메뉴판 코드 -->
<p><font size="5"><b>메뉴판</b></font></p>
<table border="1" style="width:100%">
<thead>
<tr align="center">
<td rowspan="2">메뉴</td>
<td rowspan="2">가격</td>
<td colspan="2">예산짜기</td>
</tr>
<tr align="center">
<td>선택</td>
<td>수량</td>
</tr>
</thead>
<tbody id="menus">
<c:choose>
<c:when test="${empty requestScope.foods }">
<tr>
<td colspan="4" align="center">등록된 메뉴가 없습니다</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach items="${requestScope.foods }" var="food">
	<tr align="center">
		<td>${food.foodName }</td>
		<td>${food.foodPrice }원</td>
		<td><input type="checkbox"></td>
		<td>
			<input type="number" min="0" max="10" value="0" readonly="readonly">
			<button id="btn_up">↑</button>
			<button id="btn_down">↓</button>
		</td>
	</tr>
</c:forEach>
</c:otherwise>
</c:choose>
</tbody>
</table>
</body>
</html>