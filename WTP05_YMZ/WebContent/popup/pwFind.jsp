<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>비밀번호찾기 팝업창</title>
<script type="text/javascript">

</script>

<h2>비밀번호찾기</h2>
<label for="phone"> 휴대폰으로찾기</label> <input type="radio" name="find" value="phone" id="phone">
<label for="email">이메일로찾기</label> <input type="radio" name="find" value="email" id="email">
<label for="ipin">아이핀으로찾기</label> <input type="radio" name="find" value="ipin" id="ipin">  
<form method="post" action="${initParam.rootPath }/member/loginPwFind.do">
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>
	<table>
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
