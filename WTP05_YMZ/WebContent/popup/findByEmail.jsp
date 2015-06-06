<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#findId").on("submit",function(){
		if(!$("#id").val()){
			alert("아이디를 입력하세요");
			return false;
		}
		if(!$("#emailName").val()){
			alert("이메일을 입력하세요");
			return false;
		}
		if(!$("#emailAddress").val()){
			alert("이메일을 입력하세요");
			return false;
		}
		alert("고객님의 메일로 임시비밀번호가 전송되었습니다");
	})
})
</script>
<form method="post" action="${initParam.rootPath }/member/sendpw.do"  id="registerForm" enctype="multipart/form-data">
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>
	<table>
		<tr>
			<td>
				ID
			</td>
			<td colspan="2">
				<input type="text" id="id" name="id">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" id="emailName" name="emailName">@<input type="text" id="emailAddress" name="emailAddress">
				<select name="selectEmail"  style="vertical-align:middle" onChange="javascript:mailCheck(this)">
				<option value="">직접입력</option><option value="naver.com" >네이버</option><option value="daum.net" >다음</option><option value="nate.com" >네이트</option><option value="google.com" >구글</option><option value="yahoo.com" >야후</option></select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="보내기">
			</td>
			<td>
				<input type="button" onclick="window.close();" value="취소">
			</td>	
		</tr>
	
	</table>

</form>