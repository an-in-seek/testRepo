<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
function id_pop(){
	  window.open('${initParam.rootPath }/popup/idFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
function pw_pop(){
	  window.open('${initParam.rootPath }/popup/pwFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
	

</script>
<style>
#main-title {color:#050099;font-size:70pt;margin-top:20%;}
.se {font-family: serif;}
.sa {font-family: sans-serif;}
.cu {font-family: cursive;}
.fa {font-family: fantasy;}
.mo {font-family: monospace;}
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
  color: #4a4a4a;
  -webkit-appearance: none;
  zoom: 1;}
  .btn input {
  width: 90px;
  height: 30px;
  border: 0;
  border-radius: 0;
  background: darkslateblue;
  font-size: 12px;
  line-height: 55px\9;
  color:white; 
  -webkit-appearance: none;
  cursor: pointer;
}
</style>
  
<c:if test="${sessionScope.login_info!=null }">
	<table align="center">
		<tr align="center" height="30px" >
			<td></td>
		</tr>
		<tr align="center" >
			<td>
			<font size="6" color="blue">${sessionScope.login_info.nickname }</font><font size="2">님 환영합니다.</font>
			</td>
		</tr>
	</table>
	
	<table align="center"  style="border:solid 1px #050099; margin-top:4%" width="220px">
		<tr align="center" height="50px" >
			<td class="btn">
			<input type="button"  value="마이페이지" style="border:solid 1px #050099; " 
					OnClick="window.location='${initParam.rootPath }/member/mypage.do'">
			</td>
			<td class="btn">
				<input type="button"  value="로그아웃" style="border:solid 1px #050099; " 
					OnClick="window.location='${initParam.rootPath }/member/login/logout.do'">
			</td>
		</tr>
	</table>
	
</c:if>
<c:choose>
	<c:when test="${sessionScope.login_info==null }">
		<form action="${initParam.rootPath }/member/login.do" method="post" >
		
			<table align="center"  style="border:solid 1px #050099; margin-top:4%">
				<tr align="center" >
					<td><font size="3">아이디</font></td>
					<td><input type="text" name="id"  placeholder="ID" class="int" required="required"></td>
				</tr>
				<tr align="center" >
					<td><font size="3">비밀번호</font></td>
					<td><input type="password" name="password"  placeholder="Password" class="int" required="required" maxlength="16"></td>
				</tr>
			</table>
			
			<table align="center" style="margin-top:1%">
				<tr align="center" >
					<td class="btn"><input type="submit"  value="로그인" style="font-size:16px; border:solid 1px #050099; "></td>
					<td class="btn"><input type="button"  value="회원가입" style="font-size:16px; border:solid 1px #050099; " 
					OnClick="window.location='${initParam.rootPath }/member/joinForm.do'"></td>
				</tr>
			</table>
			
			<table align="center" height="50" style="margin-top:1%" class="mo">
				<tr>
					<td><a style="text-decoration:none;" href="javascript:id_pop();"><font size="2">아이디 찾기 |</font></a></td>
					<td><a style="text-decoration:none;" href="javascript:pw_pop();"><font size="2">비밀번호 찾기</font></a></td>
				</tr>
			</table>
		</form>
	</c:when>
</c:choose>
	