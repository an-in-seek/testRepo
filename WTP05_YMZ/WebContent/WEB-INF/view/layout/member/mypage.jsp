<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<style type="text/css">
	a.menu:link {text-decoration:none; color: white;}/*방문하지 않은 페이지*/
	a.menu:hover	{text-decoration:underline; color: white;}/*링크에 마우스 올라갔을 때*/
	a.menu:active	{text-decoration:none; color: white;}/*링크 클릭시*/
	a.menu:visited {text-decoration:none; color: white;}/*방문한 링크 표시*/
</style>
<table align="center" width="200" height="600" cellspacing="0" cellpadding="0">
	<tr>
		<td><a href='${initParam.rootPath }/member/myPage.do' class="menu"><font color="black" size="3">메인(활동내역)</font></a></td>
	</tr>
	<tr>
		<td><a href="${initParam.rootPath }/member/login/modifyForm.do"  class="menu"><font color="black" size="3">회원기본수정</font></a></td>
	</tr>
	<tr>
		<td><a href=""  class="menu"><font color="black" size="3">비밀번호수정</font></a></td>
	</tr>
	<tr>
		<td><a href=""  class="menu"><font color="black" size="3">쿠폰교환</font></a></td>
	</tr>
	<tr>
		<td><a href=""  class="menu"><font color="black" size="3">회원탈퇴</font></a></td>
	</tr>
</table>    