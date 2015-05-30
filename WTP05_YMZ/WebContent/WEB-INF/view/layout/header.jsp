<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 인클루드 되므로 보여질 부분만 작성한다. -->
<c:if test="${sessionScope.login_info!=null }">
	<table width="1024" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="3"><h2 align="center"><a href='${initParam.rootPath }/index.do'>YA MEOK ZA!</a></h2></td>
	</tr>
	<tr>
		<td align="center">
		<a href="${initParam.rootPath }/member/myPage.do"><font size="2">마이페이지 | </font></a>
		<a href="${initParam.rootPath }/member/login/logout.do"><font size="2">로그아웃</font></a>
		</td>
	</tr>
</table>
</c:if>
<c:choose>
	<c:when test="${sessionScope.login_info==null }">
<table width="1024" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="3"><h2 align="center"><a href='${initParam.rootPath }/index.do'>YA MEOK ZA!</a></h2></td>
	</tr>
	<tr>
		<td align="center">
		<a href="${initParam.rootPath }/member/loginForm.do"><font size="2">로그인 | </font></a>
		<a href="${initParam.rootPath }/member/joinForm.do"><font size="2">회원가입</font></a>
		</td>
	</tr>
</table>
</c:when>
</c:choose>