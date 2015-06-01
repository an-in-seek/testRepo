<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("submit").on("click",function(){
		$.ajax({
			url:"${initParam.rootPath}/member/passwordCheck.do",
			data:{"current_password":current_password},
			type:"post",
			dataType:"JSON",
			beforeSend:function(){
				if(!current_password){
					return false;
					alert("asdfasdfasdf");
				}
			},
			success:function(ret){
				if(!ret){
					alert("비밀번호를 잘못입력하셨습니다.")
				}
			}
		});
	})s
	$("#modifyPassword").on("submit",function(){
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
	});
})

</script>

<h2>비밀번호 수정 폼</h2>

<form method="post" action="${initParam.rootPath }/member/login/modifyPassword" id="modifyPassword"
			enctype="multipart/form-data">
		<table style="width:500px" align="center">
			<tr>
				<td>기존비밀번호</td>
				<td><input type="password" id="current_password"></td>
			</tr>
			<tr>
				<td>변경할비밀번호</td>
				<td><input type="password" id="password"></td>
			</tr>
			<tr>	
				<td>비밀번호확인</td>
				<td><input type="password" id="password_check"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="변경" id="submit">
					<input type="reset" value="초기화">
				</td>	
			</tr>
		</table>	
</form>			










