<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#mainLogo").on("click", function(){
		document.location.href="${initParam.rootPath }/index.do";
	});
});
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#main{
	font-family: 'Hanna', sans-serif;
}
#login{
	font-family: 'Hanna', sans-serif;
}
/*테이블 기본 스타일*/
table, td, th{
	border-collapse: collapse;
}
td, th{
	padding: 5px;
}
#mainLogo{
	cursor: pointer;
}
</style>

<!-- 인클루드 되므로 보여질 부분만 작성한다. -->
<c:if test="${sessionScope.login_info!=null }">
	<div id="main">
		<div id="login">
			<table style="width:100%; text-align: right">
			<tr>
				<td align="right">
				<font color="#B70000" size="2" style="font-weight: bold">${sessionScope.login_info.nickname}님 환영합니다.</font>
				<a href="${initParam.rootPath }/member/mypage.do"><font size="2">마이페이지 | </font></a>
				<a href="${initParam.rootPath }/member/login/logout.do"><font size="2">로그아웃</font></a>
				</td>	
			</tr>
			</table>
		<table style="border-collapse:collapse; border-spacing:0; width:100%; height:50px; background: white">
		<tr>
			<td><img src="${initParam.rootPath}/uploadPhoto/logo.png" height="50px" width="300px" id="mainLogo"/></td>
		</tr>
		</table>
	</div>
	</div>	
</c:if>

<c:choose>
	<c:when test="${sessionScope.login_info==null }">
	<div id="login">	
		<table style="width:100%; text-align: right">	
			<tr>
				<td>
				<a href="${initParam.rootPath }/member/loginForm.do"><font size="2">로그인 | </font></a>
				<a href="${initParam.rootPath }/member/joinBefore.do"><font size="2">회원가입</font></a>
				</td>
			</tr>
		</table>
		</div>
	<div id="main">
	<table cellspacing="0" cellpadding="0" style="border-left:none; width:100%; height:50px; background: white">
	<tr>
		<td><img src="${initParam.rootPath}/uploadPhoto/logo.png" height="50px" width="300px" id="mainLogo"/></td>
	</tr>
	</table>
	</div>

</c:when>
</c:choose>
