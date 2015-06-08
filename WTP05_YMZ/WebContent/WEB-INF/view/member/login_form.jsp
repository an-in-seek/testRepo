<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function id_pop(){
	  window.open('${initParam.rootPath }/popup/idFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
function pw_pop(){
	  window.open('${initParam.rootPath }/popup/pwFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
</script>

<style>
#main-title {color:#050099; font-size:20pt; font-weight: bold; margin-top:2%;}
.mo {font-family: monospace;}
.int {position: relative;
  z-index: 10;
  width: 180px;
  height: 24px;
  padding: 3px 0 2px 5px;
  border: 1;
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
 
<div align="center" style="padding:20px">
	<fieldset style="width:380px" >
	<legend  id="main-title">로그인 폼</legend>   
		<form action="${initParam.rootPath }/member/login.do" method="post" >
			<c:if test="${requestScope.error_message != null}">
				<font color="red" size="3" style="font-weight: bold">${requestScope.error_message}</font>
			</c:if>
			<table align="center" style="border:solid 1px #050099; margin-top:5%">
				<tr align="center" >
					<td><font size="3" style="font-weight: bold">아이디</font></td>
					<td><input type="text" name="id" autofocus="autofocus" placeholder="ID" class="int" required="required"></td>
				</tr>
				<tr align="center" >
					<td><font size="3" style="font-weight: bold">패스워드</font></td>
					<td><input type="password" name="password"  placeholder="Password" class="int" required="required" maxlength="16"></td>
				</tr>
			</table>
			<table align="center" style="margin-top:1%">
				<tr align="center">
					<td class="btn"><input type="submit" value="로그인" style="font-size:16px; border:solid 1px #050099;"></td>
					<td class="btn"><input type="reset" value="초기화" style="font-size:16px; border:solid 1px #050099;"></td>
				</tr>
			</table>	
			<hr noshade="noshade" width="80%" align="center"> 
			<table align="center" height="40" class="mo">
				<tr>
					<td><a style="text-decoration:none;" href="javascript:id_pop();"><font size="3">아이디 찾기 |</font></a></td>
					<td><a style="text-decoration:none;" href="javascript:pw_pop();"><font size="3">비밀번호 찾기</font></a></td>
				</tr>
			</table>
		</form>
	</fieldset>
</div>
