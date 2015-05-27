<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">

table#memberInfoTB{
	width: 500px;
	border-collapse: collapse;
}
</style>
<h2>회원 정보</h2>
<table id="memberInfoTB"> 
	<tr>
		<th width="100px" align="left">ID</th>
		<td>${sessionScope.login_info.id }</td>
	</tr>
	<tr>
		<th  align="left">패스워드</th>
		<td>${sessionScope.login_info.password}</td>
	</tr>
	<tr>
		<th align="left">이름</th>
		<td>${sessionScope.login_info.name}</td>
	</tr>
	<tr>
		<th align="left">Email</th>
		<td>${sessionScope.login_info.email}</td>
	</tr>
	<tr>
		<th align="left">가입일</th>
		<td>${sessionScope.login_info.joinDate }</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:choose>
				<c:when test="${empty sessionScope.login_info.pictureName }"  >
					<img src="${initParam.rootPath }/uploadPhoto/no-photo.png">
				</c:when>
				<c:otherwise>
					<img src="${initParam.rootPath }/uploadPhoto/${sessionScope.login_info.pictureName }">
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>












