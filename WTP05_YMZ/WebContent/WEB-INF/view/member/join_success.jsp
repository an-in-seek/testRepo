<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function goLogin() {

	location.href="${initParam.rootPath }/member/loginForm.do";
}
function goMain() {

	location.href="${initParam.rootPath }/index.do";
}
</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

#table{
	margin:50px 50px 50px 50px;
	padding: 30px;
	font-weight:bold;
	font-family: 'Nanum Gothic Coding', serif;
	font-size:30px
}
.s{
	font-size:20px;
	color:#C8C2C2;
	font-family: 'Jeju Myeongjo', serif;
}
.main {
	-moz-box-shadow:inset 0px 1px 0px 0px #f5978e;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f5978e;
	box-shadow:inset 0px 1px 0px 0px #f5978e;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f) );
	background:-moz-linear-gradient( center top, #f24537 5%, #c62d1f 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f');
	background-color:#f24537;
	-webkit-border-top-left-radius:10px;
	-moz-border-radius-topleft:10px;
	border-top-left-radius:10px;
	-webkit-border-top-right-radius:10px;
	-moz-border-radius-topright:10px;
	border-top-right-radius:10px;
	-webkit-border-bottom-right-radius:10px;
	-moz-border-radius-bottomright:10px;
	border-bottom-right-radius:10px;
	-webkit-border-bottom-left-radius:10px;
	-moz-border-radius-bottomleft:10px;
	border-bottom-left-radius:10px;
	text-indent:0;
	border:1px solid #d02718;
	display:inline-block;
	color:#ffffff;
	font-family:Verdana;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	width:120px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #810e05;
	cursor: pointer;
}

</style>
<img src="${initParam.rootPath }/memberImage/joinSu.png" id="header">
<div id="table" align="center">
<table >
	<tr>
		<td align="center">
		[${requestScope.member.id}]
		<font size="30" style="bold">'${requestScope.member.name}'님</font><br>
		<font size="30" color="grey">회원가입을 축하드립니다.</font></td>
	</tr>
	<tr>
		<td class="s" align="center">야먹자에 회원가입을 해주셔서 감사합니다.</td>
	</tr>
	<tr>
		<td class="s" align="center">야먹자는 알찬 정보와 서비스를 제공해줄것을 약속드립니다.</td>
	</tr>
	<tr >
		<td align="center">
			<input type="button" class="main" onclick="location.href='javascript:goMain();'" value="메인으로가기">&nbsp;
			<input type="button" class="main" onclick="location.href='javascript:goLogin()';" value="로그인">
		</td>
	</tr>
</table>
</div>	
	<img src="${initParam.rootPath }/memberImage/join.png" width="1024" height="100">
	














