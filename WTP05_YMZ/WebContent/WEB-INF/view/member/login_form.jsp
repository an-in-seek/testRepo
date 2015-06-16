<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">
function id_pop(){
	  window.open('${initParam.rootPath }/popup/idFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
function pw_pop(){
	  window.open('${initParam.rootPath }/popup/pwFind.jsp','네이버팝업','width=450, height=350, scrollbars=no');
	 }
	 
$(document).ready(function(){ 
    var numberOfImages=3; 
    var imageNum = Math.round(Math.random()*(numberOfImages-1))+1; 
    var imgPath=('/WTP05_YMZ/memberImage/'+imageNum+'.png'); 
    $('#mainbgs').css('background-image', ('url("'+imgPath+'")')); 
      
    }); 	 
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#div{
	border: 1px steelblue;
	margin-left:auto;
	margin-right:auto;
	padding-bottom:350px;
	background-color:#FAFBFC;
}
#table{
	margin-top:2px;
	 width:500px;
	 height:auto;
	 float:left;
	 margin-left:100px;
}

#mainbgs{
	margin-top : 20px;
	float:right;
	width:300px;
	height:200px;
	background-repeat:no-repeat;
	background-size: contain;
	padding-left:10px;
	padding-right:100px;
	
}

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




.btn{
	-moz-box-shadow:inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f29c93;
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fe1a00), color-stop(1, #ce0100) );
	background:-moz-linear-gradient( center top, #fe1a00 5%, #ce0100 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00', endColorstr='#ce0100');
	background-color:#fe1a00;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #d83526;
	display:inline-block;
	color:#ffffff;
	font-family:Impact;
	font-size:17px;
	font-weight:bold;
	font-style:normal;
	height:73px;
	line-height:73px;
	width:108px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #b23e35;
}
.btn:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #fe1a00) );
	background:-moz-linear-gradient( center top, #ce0100 5%, #fe1a00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#fe1a00');
	background-color:#ce0100;
}
.btn:active {
	position:relative;
	top:1px;
}
#col{
	font-family:'Malgun Gothic', dotum;	
	font-size : 16px;
	font-weight: bold;
	color:#6B6666;
	width:80px;
	background:#ffffff;
	padding-left:2px;
}

#col3{
	;
}

</style>
 
<div id="div">
		<form action="${initParam.rootPath }/member/login.do" method="post" >
			<table id="table">
			<tr>
				<td colspan="3"><font size="7">Login</font><font>&nbsp;로그인</font><br>
				<p id="content"><font size="2" color="grey">로그인 하시면 더욱 다양한 야먹자의 서비스를 즐길실 수 있습니다.</font></p>
				<hr noshade="noshade" width="100%" align="center"> 
				<c:if test="${requestScope.error_message != null}">
					<font color="red" size="3" style="font-weight: bold">${requestScope.error_message}</font>
				</c:if>
				</td>
				
			</tr>
				<tr align="left" >
					<td id="col">아이디</td>
					<td><input type="text" name="id" autofocus="autofocus" placeholder="ID" class="int" maxlength='11' required="required"></td>
					<td id="col2" rowspan="2"><input  class="btn" type="submit" value="로그인" style="font-size:16px; border:solid 1px #050099;"></td>
				</tr>
				<tr align="left" >
					<td id="col">패스워드</td>
					<td id="col2"><input type="password" name="password"  placeholder="Password" class="int" required="required" maxlength="24"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3"><a style="text-decoration:none;" href="javascript:id_pop();"><font size="3">아이디 찾기 |</font></a>
					<a style="text-decoration:none;" href="javascript:pw_pop();"><font size="3">비밀번호 찾기 |</font></a>
					<a style="text-decoration:none;" href="${initParam.rootPath }/member/joinBefore.do"><font size="3"> 회원가입</font></a>
					</td>
				</tr>
			</table>
		</form>
			<p id="mainbgs"></p>
</div>
