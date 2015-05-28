<%@ page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
	// 자바 스크립트 시작
	function writeCheck() {
		var form = document.writeform;

		if (!form.name.value) // form 에 있는 name 값이 없을 때
		{
			alert("이름을 적어주세요"); // 경고창 띄움
			form.name.focus(); // form 에 있는 name 위치로 이동
			return;
		}

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}

		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

		if (!form.memo.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
			return;
		}

		form.submit();
	}
</script>

<h2 align="center">고객센터(Q&A)</h2>

<table align="center">
	<tr align="center">
		<td align="center">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr style="text-align: center;">
					<td>글쓰기</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center">제목</td>
					<td><input name="title" size="50" maxlength="100"></td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input name="name" size="50" maxlength="50"></td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input name="password" size="50" maxlength="50"></td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><textarea name="memo" cols="50" rows="13"></textarea></td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4"></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type=button value="등록"> <input
						type=button value="취소">
				</tr>
			</table>
		</td>
	</tr>
</table>
