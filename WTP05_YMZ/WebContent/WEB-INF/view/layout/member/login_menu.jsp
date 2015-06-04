<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#main-title {color:#050099;font-size:70pt;margin-top:20%;}
.se {font-family: serif;}
.sa {font-family: sans-serif;}
.cu {font-family: cursive;}
.fa {font-family: fantasy;}
.mo {font-family: monospace;}
</style>
  
<c:if test="${sessionScope.login_info!=null }">
	<table align="center">
		<tr>
			<td colspan="2">
			<font size="5" color="blue">${sessionScope.login_info.nickname }</font><font size="2">님 환영합니다.</font>
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
		
			<table align="center"  style="border:solid 1px #050099; margin-top:4%">
				<tr align="center" >
					<td><font size="3">아이디</font></td>
					<td><input type="text" name="id" size="16px" placeholder="ID"></td>
				</tr>
				<tr align="center" >
					<td><font size="3">비밀번호</font></td>
					<td><input type="password" name="password" size="16px" placeholder="Password"></td>
				</tr>
			</table>
			
			<table align="center" style="margin-top:1%">
				<tr align="center" >
					<td><input type="submit"  value="로그인" style="background-color:darkslateblue; color:white; font-size:16px; border:solid 1px #050099; "></td>
					<td><input type="button"  value="회원가입" style="background-color:darkslateblue; color:white; font-size:16px; border:solid 1px #050099; " 
					OnClick="window.location='${initParam.rootPath }/member/joinForm.do'"></td>
				</tr>
			</table>
			
			<table align="center"  border="1" style="border:solid 1px #050099; margin-top:2%"></table>
			
			<table align="center" height="50" style="margin-top:1%" class="mo">
				<tr>
					<td><a style="text-decoration:none;" href=""><font size="2">아이디 찾기 |</font></td>
					<td><a style="text-decoration:none;" href=""><font size="2">비밀번호 찾기</font></td>
				</tr>
			</table>
		</form>
	</c:when>
</c:choose>
	