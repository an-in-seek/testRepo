<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){

		$("#findId").on("submit",function(){
			
			if(!$("#name").val()){
				alert("이름을 입력하세요");
				return false;
			}
			if(!$("#num1").val()){
				alert("전화번호를 입력하세요");
				return false;
			}
			if(!$("#num2").val()){
				alert("전화번호를 입력하세요");
				return false;
			}
			
		});
	
})
</script>
<title>아이디찾기 팝업창</title>
<h2>아이디찾기</h2>
<form method="post" id="findId" action="${initParam.rootPath }/member/loginIdFind.do" enctype="multipart/form-data">
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>
	<table align="center">
		<tr>
			<td>
				이름
			</td>
			<td colspan="2">
				<input type="text" id="name" name="name">
			</td>
		</tr>
		<tr>
			<td>
				전화번호
			</td>
			<td>
				<select name="phoneCP" id="phoneCP" class="input_text w60" style="vertical-align:middle">
			<option value="010" >010</option><option value="011" >011</option><option value="017" >017</option><option value="018" >018</option><option value="019" >019</option></select>
			&nbsp;-&nbsp;<input type="text" id="num1" name="num1" size="2" style="vertical-align:middle">&nbsp;&nbsp;<input type="text" id="num2" name="num2" size="2" class="input_text w60" style="vertical-align:middle">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="확인">
			</td>
			<td>
				<input type="button" onclick="window.close();" value="취소">
			</td>	
		</tr>
	</table>
</form>

