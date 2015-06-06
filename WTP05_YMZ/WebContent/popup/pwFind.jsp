<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">
	/*
	 * 이메일주소 select 값 선택
	 */
	function mailCheck(selectObj){ 
		document.getElementById('emailAddress').value=selectObj.value;
		if(selectObj.value==""){
			$("#emailAddress").focus();	
		}
	}
$(document).ready(function(){

	$("#findPw").on("submit",function(){
		var flag = confirm("비밀번호를 수정하시겠습니까");
		if(!flag){
			alert("취소하셨습니다");
			return false;
			window.close();
		}else{
		if(!$("#id").val()){
			alert("아이디를 입력하세요");
			return false;
		}
		if(!$("#name").val()){
			alert("이름을 입력하세요");
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
		
		}
		//window.close();
	})
})
</script>
<h2>비밀번호찾기</h2>
<form method="post" action="${initParam.rootPath }/member/sendpw.do"  id="findPw" enctype="multipart/form-data">
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>
	<table>
		<tr>
			<td>
				ID
			</td>
			<td>
				<input type="text" id="id" name="id">
			</td>
		</tr>
		<tr>
			<td>
				이름
			</td>
			<td>
				<input type="text" id="name" name="name">
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