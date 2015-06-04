<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
$(document).ready(function(){
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
				
			})
})

</script>
<hr noshade="noshade" width="30%" align="left">

<h2>비밀번호 수정 폼</h2>

<form method="post" action="${initParam.rootPath }/member/modify_password.do" id="modifyPassword" enctype="multipart/form-data">
		<table style="width:500px" align="center">
			<tr>
				<td>기존비밀번호</td>
				<td><input type="password" name="current_password" id="current_password"></td>
			</tr>
			<tr>
				<td>변경할비밀번호</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="password_check" id="password_check"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="변경" id="submit">
					<input type="reset" value="초기화">
				</td>	
			</tr>
		</table>	
</form>			










