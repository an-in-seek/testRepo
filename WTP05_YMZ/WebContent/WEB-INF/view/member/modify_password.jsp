<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
var pwCheck = false;
$(document).ready(function(){
	
	$("#current_password").on("keyup",function(){
		var current_password = $(this).val();
		alert(current_password);
				$.ajax({
					url:"${initParam.rootPath}/member/passwordCheck.do",
					data:{"current_password":current_password},
					dataType:"text",
					success:function(ret){
						if(ret=="false"){
							alert("비밀번호가 틀렸습니다.")
							pwCheck = false;
						}else{
							pwCheck = true;
						}
					}
			});
			
	})
	$("#modifyPassword").on("submit",function(){
		alert("asdfadfasdf")
				if(!("#current_password").val()){
					alert("기존비밀번호를 입력하세요");
					$("#current_password").focus();
					return false;
				}
				if(!("#password").val()){
					alert("password를 입력하세요");
					$("#password").focus();
					return false;
				}
				if(!("#password_check").val()){
					alert("password를 입력하세요");
					$("#password_check").focus();
					return false;
				}
				if(!pwCheck){
					alert("비밀번호가 틀렸다고요.....")
					$("#current_password").focus();
					return false;
				}
			})
})

</script>

<h2>비밀번호 수정 폼</h2>

<form method="post" action="${initParam.rootPath }/member/mypage/modifyPassword.do" id="modifyPassword" enctype="multipart/form-data">
		<table style="width:500px" align="center">
			<tr>
				<td>기존비밀번호</td>
				<td><input type="text" name="current_password" id="current_password"></td>
			</tr>
			<tr>
				<td>변경할비밀번호</td>
				<td><input type="text" name="password" id="password"></td>
			</tr>
			<tr>	
				<td>비밀번호확인</td>
				<td><input type="text" name="password_check" id="password_check"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="변경" id="submit">
					<input type="reset" value="초기화">
				</td>	
			</tr>
		</table>	
</form>			










