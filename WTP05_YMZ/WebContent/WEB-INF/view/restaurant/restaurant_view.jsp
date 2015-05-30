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

<td style="width:60%">
<table border="1" style="width:100%">
<tr align="center">
<td colspan="5" height="370px"><img id="selectedPicture"></td>
</tr>
<tr id="selectPicture" align="center" height="105px">
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

<td style="width:40%">
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
</table>
</td>

</tr>
</table>

</body>
</html>