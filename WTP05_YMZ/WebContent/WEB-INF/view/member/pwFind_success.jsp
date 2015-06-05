<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#passwordChange").on("submit",function(){
		var p1 = $("#password").val();
		var p2 = $("#passwordCheck").val();
		if(!$("#password").val()){
			alert("패스워드를 입력하세요");
			return false;
		}
		if(!$("#passwordCheck").val()){
			alert("패스워드를 입력하세요");
			return false;
		}
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다");
			return false;
		}
		alert("패스워드가 변경되었습니다");
		window.close();
	});

})
</script>
<form method="post" action="${initParam.rootPath }/member/passwordChange.do" id="passwordChange">
	<table>
		<tr><td colspan="2"><input type="hidden" id="id" name="id" value="${requestScope.id }">변경할 비밀번호를 입력해 주세요</td></tr>
		<tr>
			<td>새로운비밀번호</td>
			<td><input type="password" id="password" name="password"></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input type="password" id="passwordCheck" name="passwordCheck"></td>
		</tr>
		<tr>
			<td><input type="submit" value="확인"></td>
			<td><input type="button" onclick="window.close();" value="취소"></td>
		</tr>
	</table>
</form>
