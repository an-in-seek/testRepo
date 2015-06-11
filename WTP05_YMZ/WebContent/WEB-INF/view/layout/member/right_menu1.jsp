<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function id_pop(){
	  window.open('${initParam.rootPath }/popup/idFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
function pw_pop(){
	  window.open('${initParam.rootPath }/popup/pwFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#main-title {color:#f8f8f8;font-size:70pt;margin-top:20%;}
.se {font-family: serif;}
.sa {font-family: sans-serif;}
.cu {font-family: cursive;}
.fa {font-family: fantasy;}
#right_menu1{										/* 메인화면 오른쪽 로그인창 */
	width:220px;
	height:auto;
	font-family: 'Hanna', sans-serif;
	background-color: #f8f8f8;
	border: solid 1px #b70000;   
	line-height:20px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	text-align:center;
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
}
#mainInfofind {					/* 회원 정보 찾기 */
	font-family: 'Hanna', sans-serif;
	margin-left: auto;
	margin-right: auto;
	height: 20px;
	font-size: 2;
	text-align: center;
}
#mainLoginForm {				/* 로그인 입력 폼 */
	text-align: center;
	border: solid 1px #bfbfbf;  /* 로그인 입력폼 테두리 선 */ 
	margin-top: 4%;
	margin-left: auto;
	margin-right: auto;
	color: #808080;

}
#mainLoginInput{
	font-family: 'Hanna', sans-serif;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	cursor: pointer;
}
#loginSuccess{
	color: #B70000;
}
#loginSuccessStatus{
	margin-top:4%
}
.int {position: relative;
  z-index: 10;
  width: 120px;
  height: 21px;
  padding: 3px 0 2px 5px;
  border: 0;
  border-radius: 0;
  background: #fff;
  line-height: 16px;
  font-size: 12px;
  color: #808080;
  -webkit-appearance: none;
  zoom: 1;}
.btn input {			/* 버튼 */
  width: 90px;
  height: 30px;
  border: 0;
  border-radius: 0;
  background: #808080;
  font-size: 12px;
  line-height: 55px\9;
  color:white; 
  -webkit-appearance: none;
  cursor: pointer;
  font-family: 'Hanna', sans-serif;
}
</style>
  
<div id="right_menu1">
<c:if test="${sessionScope.login_info!=null }">	
	<table id="loginSuccess" align="center">
		<tr align="center" height="30px" >
			<td></td>
		</tr>
		<tr align="center" >
			<td>
			<font size="5">${sessionScope.login_info.nickname }</font><font size="2">님 환영합니다.</font>
			</td>
		</tr>
	</table>
	
	<table id="loginSuccessStatus" align="center" width="220px">
		<tr align="center" height="50px" >
			<td class="btn">
			<input type="button"  value="마이페이지" 
					OnClick="window.location='${initParam.rootPath }/member/mypage.do'">
			</td>
			<td class="btn">
				<input type="button"  value="로그아웃" 
					OnClick="window.location='${initParam.rootPath }/member/login/logout.do'">
			</td>
		</tr>
	</table>
	
</c:if>
<c:choose>	
	<c:when test="${sessionScope.login_info==null }">
		<form action="${initParam.rootPath }/member/login.do" method="post" >
			<table id="mainLoginForm">
				<tr align="center" >
					<td><font size="3">아이디</font></td>
					<td><input type="text" name="id"  placeholder="ID" class="int" required="required"></td>
				</tr>
				<tr align="center" >
					<td><font size="3">비밀번호</font></td>
					<td><input type="password" name="password"  placeholder="Password" class="int" required="required" maxlength="16"></td>
				</tr>
			</table>
			<table id="mainLoginInput" style="margin-top:1%">
				<tr align="center" >
					<td class="btn"><input type="submit"  value="로그인"></td>
					<td class="btn"><input type="button"  value="회원가입"
					OnClick="window.location='${initParam.rootPath }/member/joinBefore.do"></td>
				</tr>
			</table>
			
			<table id="mainInfofind">
				<tr>
					<td><a style="text-decoration:none;" href="javascript:id_pop();">아이디 찾기 |</a></td>
					<td><a style="text-decoration:none;" href="javascript:pw_pop();">비밀번호 찾기</a></td>
				</tr>
			</table>
		</form>
	</c:when>
</c:choose>
</div>

