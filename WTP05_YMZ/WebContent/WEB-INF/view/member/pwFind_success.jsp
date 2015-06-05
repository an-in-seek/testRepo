<%@ page contentType="text/html;charset=UTF-8"%>

<form>
<%=request.getAttribute("id") %>
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
