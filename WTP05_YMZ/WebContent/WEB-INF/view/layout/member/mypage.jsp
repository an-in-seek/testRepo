<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<style type="text/css">
a.menu:link {text-decoration:none; color: white;}/*방문하지 않은 페이지*/
a.menu:hover	{text-decoration:underline; color: white;}/*링크에 마우스 올라갔을 때*/
a.menu:active	{text-decoration:none; color: white;}/*링크 클릭시*/
a.menu:visited {text-decoration:none; color: white;}/*방문한 링크 표시*/

#leftMenu{
	width:auto;
	height:320px; 
	border: solid 1px #b70000;  
	background-color: #f8f8f8;
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
}
#leftMenu table tr{
	 width: 155px;
	 _width: 170px;
	 height: 23px;
	 _height: 33px;
	 padding: 10px 0 0 15px;
	 border-bottom: 1px solid #e9e9e9;
	 text-align: left;
}
</style>
<script type="text/javascript">
function removeConfirm(){
	var flag = confirm("정말 탈퇴하겠습니까?");
	if(flag){
		location.href = "${initParam.rootPath }/member/login/removeMember.do";
	}
}

</script>
<div id="leftMenu" >
	<table align="center"  cellspacing="0" cellpadding="0">
		<tr>
			<td><a href='${initParam.rootPath }/member/mypage.do' class="menu"><font color="black" size="3">메인(활동내역)</font></a></td>
		</tr>
		<tr>
			<td><a href="${initParam.rootPath }/member/login/modifyForm.do"  class="menu"><font color="black" size="3">회원기본수정</font></a></td>
		</tr>
		<tr>
			<td><a href="${initParam.rootPath }/member/mypage/modify_password.do"  class="menu"><font color="black" size="3">비밀번호수정</font></a></td>
		</tr>
		<tr>
			<td><a href="${initParam.rootPath }/member/couponTrade.do"  class="menu"><font color="black" size="3">쿠폰교환</font></a></td>
		</tr>
		<tr>
			<td><a href="javascript:removeConfirm();" class="menu"><font color="black" size="3">회원탈퇴</font></a></td>
		</tr>
	</table>    
</div>