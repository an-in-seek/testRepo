<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<style type="text/css">
table#tb thead tr {
	font-weight: bold;
	background: lightgray;
}
article {
	border-bottom: 1px solid black;
	padding: 5px;
	padding-left: 10px;
}
</style>

<h2 align="center">게시물 내용</h2>

<table id="tb" width="100%" style="border:solid 2px #050099">
	<thead>
		<tr style="text-align:center">
			<td colspan="4"><font size="bold">글쓰기</font></td>
		</tr>
	</thead>
	<tr>
		<td width="1">&nbsp;</td>
		<td align="center" width="100">글번호</td>
		<td width="550">${requestScope.qna.number}번</td>
		<td width="1">&nbsp;</td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4" width="500"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center">조회수</td>
		<td>${requestScope.qna.hits}명</td>
		<td>&nbsp;</td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center">아이디</td>
		<td>${requestScope.qna.memberId}</td>
		<td>&nbsp;</td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center">작성일</td>
		<td>${requestScope.qna.registrationDate}</td>
		<td>&nbsp;</td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center">제목</td>
		<td>${requestScope.qna.title}</td>
		<td>&nbsp;</td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr>
		<td></td>
		<td align="center" height="200">내용</td>
		<td colspan="2">${requestScope.qna.content}</td>
	</tr>

	<tr height="2" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr align="center">
		<td width="0">&nbsp;</td>
		<td colspan="2" ><input type=button value="답글">
			<input type=button value="목록" OnClick="window.location='qnaList.do'">
			<input type=button value="수정"> <input type=button value="삭제">
		<td width="0">&nbsp;</td>
	</tr>
</table>
