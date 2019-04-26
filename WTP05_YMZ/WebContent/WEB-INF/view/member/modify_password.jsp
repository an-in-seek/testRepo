<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
$(document).ready(function(){
pwVal = false;	
	//password 유효성검사
	$("#password").on("change",function(){
		var password = $("#password").val();
		var pwSize = password.length;
		 // 아이디 검사
		if(pwSize<4){
			$("#pwsMessage").text("");
			$("#pwMessage").text("password는 4자리이상 입력하세요.");
			pwVal = false;
			return false;
		}
		if(!/^[a-zA-Z0-9]{4,24}$/.test(password)){
			$("#pwsMessage").text("");
			$("#pwMessage").text("password는 영문,숫자를 혼합하여 주세요.");
			pwVal = false;
			return false;
		}
		$('#pwMessage').text("");	
		$("#pwsMessage").text("사용가능한 password입니다");
		pwVal = true;
	});
var pwCheck = false;
	$("#current_password").on("keyup",function(){
		var current_password = $(this).val();
				$.ajax({
					url:"${initParam.rootPath}/member/confirmPassword.do",
					data:{"current_password":current_password},
					dataType:"text",
					beforeSend:function(){
					if(!$("#current_password")){//password에 입력된 값이 없으면 전송하지 않는다.
							return false
						}
					},
					success:function(ret){
						if(ret=="false"){
							pwCheck=false;
						}else{
							pwCheck=true;
						}
					}
			});
			
	})
	$("#modifyPassword").on("submit",function(){
				var password = $("#password").val();
				var password_check = $("#password_check").val();
				var flag = confirm("비밀번호를 수정하시겠습니까");
				if(!flag){
					return false;
				}else{
				if(!pwVal){
					alert("비밀번호양식이 맞지 않습니다");
					return false;
				}
					
				if(!$("#current_password").val()){
					alert("기존비밀번호를 입력하세요");
					$("#current_password").focus();
					return false;
				}
				if(!$("#password").val()){
					alert("password를 입력하세요");
					$("#password").focus();
					return false;
				}
				if(!$("#password_check").val()){
					alert("password를 입력하세요");
					$("#password_check").focus();
					return false;
				}
				
				if(!pwCheck){
					alert("기존 비밀번호가 아닙니다");
					$("#current_password").focus();
					return false;
				}
				
				if(password!=password_check){
					alert("비밀번호가 일치하지 않습니다");
					$("#password_check").focus();
					return false;
				}
			}	
				alert("비밀번호가 수정되었습니다.");
				
			})
})

</script>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/hanna.css);
table{
	margin-left: auto;
	margin-right: auto;
}

#col{
	font-family: 'Hanna', sans-serif;	
	font-size : 15px;
	width:150px;
	background:#f0f0f0;
	font-color:#756C6C;
}
#col2{
	width:50px;
}
.id_btn{
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:55px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}
.nick_btn{
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:55px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}
.zip_btn{
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:9px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:100px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}
</style>

<form method="post" action="${initParam.rootPath }/member/modify_password.do" id="modifyPassword" enctype="multipart/form-data">
<h2 align="center">비밀번호 수정</h2>
<hr noshade="noshade" width="100%" align="center">
		<table style="width:550px; border: 1px solid lightgray">
			<tr>
				<td id="col" align="center">기존비밀번호</td>
				<td id="col2"></td>
				<td><input type="password" name="current_password" id="current_password" maxlength='24'></td>
			</tr>
			<tr>
				<td id="col" align="center">변경할비밀번호</td>
				<td id="col2"></td>
				<td><input type="password" name="password" id="password" maxlength='24'>
				<font color="red" size="1"><span  id="pwMessage"></span></font>
				<font color="blue" size="1"><span  id="pwsMessage"></span></font>
				</td>
			</tr>
			<tr>
				<td id="col" align="center">비밀번호확인</td>
				<td id="col2"></td>
				<td><input type="password" name="password_check" id="password_check" maxlength='24'></td>
			</tr>
		</table>
		<table>
			<tr>
				<td width="500px" align="center">
					<input type="submit" class="nick_btn" value="변경" id="submit">
					<input type="reset" class="nick_btn" value="초기화">
				</td>	
			</tr>
		</table>	
</form>			
