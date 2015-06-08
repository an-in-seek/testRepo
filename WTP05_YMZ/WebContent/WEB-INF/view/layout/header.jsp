<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 인클루드 되므로 보여질 부분만 작성한다. -->
<c:if test="${sessionScope.login_info!=null }">
	
	<div width="1024">
		<table width="1024" align="right">
		<tr width="1024" >
			<td align="right">
			<font size="2" style="font-weight: bold">${sessionScope.login_info.nickname}님 환영합니다.</font><br>
			<a href="${initParam.rootPath }/member/mypage.do"><font size="2">마이페이지 | </font></a>
			<a href="${initParam.rootPath }/member/login/logout.do"><font size="2">로그아웃</font></a>
			</td>
		</tr>
		</table>
	</div>
	
	<table id="main" width="1024" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="3"><h1 align="center"><a href='${initParam.rootPath }/index.do'>YA! MUK ZA</a></h2></td>
		</tr>
	</table>
</c:if>

<c:choose>
	<c:when test="${sessionScope.login_info==null }">
		<div id="login">	
			<table width="150" align="right">	
				<tr>
					<td>
					<a href="${initParam.rootPath }/member/loginForm.do"><font size="2">로그인 | </font></a>
					<a href="${initParam.rootPath }/member/joinForm.do"><font size="2">회원가입</font></a>
					</td>
				</tr>
			</table>
		</div>
		<div id="main">
			<table width="1024" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="3"><h2 align="center"><a href='${initParam.rootPath }/index.do'>YA MEOK ZA!</a></h2></td>
				</tr>
			</table>
		</div>
</c:when>
</c:choose>