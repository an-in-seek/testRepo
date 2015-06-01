<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.login_info!=null }">
	<table align="center">
		<tr>
			<td colspan="2">
			<font size="5" color="blue">${sessionScope.login_info.name }</font><font size="2">님 환영합니다.</font>
			</td>
		</tr>
		<tr height="50">
			<td>
				<a href="${initParam.rootPath }/member/mypage.do"><font size="1">마이페이지</font></a>
			</td>
			<td>
				<a href="${initParam.rootPath }/member/login/logout.do"><font size="1">로그아웃</font></a>
			</td>
		</tr>
		</table>
</c:if>
<c:choose>
	<c:when test="${sessionScope.login_info==null }">
	<form action="${initParam.rootPath }/member/login.do" method="post">
	<table >
		<tr>
			<td><font size="2">아이디</font></td>
			<td><input type="text" name="id" size="2" ></td>
		</tr>
		<tr>
			<td><font size="2">패스워드</font></td>
			<td><input type="password" name="password" size="2"></td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="로그인">
			</td>
			<td>
				<a href="${initParam.rootPath }/member/joinForm.do">회원가입</a>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href=""><font size="1">아이디찾기 | </font></a>
				<a href=""><font size="1">비밀번호찾기</font></a>
			</td>
		</tr>
	</table>
</form>
</c:when>
</c:choose>
	