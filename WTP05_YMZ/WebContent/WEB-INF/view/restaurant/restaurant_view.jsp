<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<td align="center">주소</td>
	<td>${requestScope.restaurant.address }</td>
</tr>
<tr>
	<td align="center">소개</td>
	<td>${requestScope.restaurant.description }</td>
</tr>
<tr>
	<td align="center">평점</td>
	<td>${requestScope.restaurant.score }</td>
</tr>
<tr>
	<td align="center">테마</td>
	<td>${requestScope.restaurant.theme }</td>
</tr>
</table>

</body>
</html>