<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.login_info != null}">
	<jsp:forward page="/res/member_info.jsp"/>
</c:if>
 
로그인 폼<br>   
<hr noshade="noshade" width="30%" align="left"> 
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>

<form action="${initParam.rootPath }/member/login.do" method="post" >
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" size="20" autofocus="autofocus"></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="password" size="20"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="reset" value="초기화">
			</td>
		</tr>
	</table>	
</form>
