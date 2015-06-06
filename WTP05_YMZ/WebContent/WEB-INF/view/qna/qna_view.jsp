<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<script type="text/javascript" src="${initParam.rootPath}/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.cookie.js"></script> <!-- 쿠키 사용 -->
<link type="text/css" href="${initParam.rootPath}/css/jquery-ui.css" rel="stylesheet"></link>	
<script type="text/javascript">
	$(document).ready(function() {
		
		var qnaNumber = ${requestScope.qna.number}; // 새로고침 조회수 증가 막기
		var c = $.cookie('number'); // 쿠키 조회
		
		$.ajax({
			url:"${initParam.rootPath}/qna/findLoginMember.do", //요청 url 설정
			type:"post", //HTTP 요청 방식(method)
			dataType:"json", //javascript객체로 변환해서 응답데이터를 전달.
			beforeSend:function(){
				$("#commentBtn").hide();
				$("#modifyBtn").hide();
				$("#deleteBtn").hide();
			},
			success:function(member){
				$("#commentBtn").show();
				if(member.grade == 'master'){
					$("#modifyBtn").show();
					$("#deleteBtn").show();
				}else if(member.id == '${requestScope.qna.memberId}'){
					$("#modifyBtn").show();
					$("#deleteBtn").show();
				}
			}
		});
		
		$.cookie('number', '${requestScope.qna.number}'); // 쿠키 reviewNo를 셋팅
		if(c!='${requestScope.qna.number}'){
			$.ajax({
				url:"${initParam.rootPath}/qna/ajax/updateHits.do", // 요청 url
				type:"post",
				data:{number:qnaNumber}, // 요청 파라미터 id = xxxxxxxx
				success:function(txt){
					$("#count").html(txt);
				}
			});
		}
		
		$("#commentBtn").on("click", function() {
			document.location.href="login/commentForm.do?number="+${requestScope.qna.number};
		});
		
		$("#listBtn").on("click", function() {
			document.location.href="qnaList.do";
		});
		
		$("#modifyBtn").on("click", function() {
			var isDel = confirm("정말로 수정하시겠습니까?");
			if (isDel) {
				document.location.href="login/modifyForm.do?number="+${requestScope.qna.number};
			} else {
				return;
			}
		});
		
		$("#deleteBtn").on("click", function() {
			var isDel = confirm("정말로 삭제하시겠습니까?");
			if (isDel) {
				document.location.href="login/removeQna.do?number="+${requestScope.qna.number};
			} else {
				return;
			}
		});
	});
</script>

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

<table id="tb" align="center" width="700px" style="border:solid 2px #050099">
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
		<td id="count">${requestScope.qna.hits}</td>
		<td>&nbsp;</td>
	</tr>
	<tr height="1" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center">작성자</td>
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
		<td align="center">분류</td>
		<td>${requestScope.qna.category}</td>
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
		<td>&nbsp;</td>
		<td align="center" height="200">내용</td>
		<td colspan="1">${requestScope.qna.content}</td>
		<td>&nbsp;</td>
	</tr>

	<tr height="2" bgcolor="#dddddd">
		<td colspan="4"></td>
	</tr>
	<tr align="center">
		<td width="0">&nbsp;</td>
		<td colspan="2" >
			<input id="commentBtn" type=button value="답글">
			<input id="listBtn" type=button value="목록" > <!--OnClick="window.location='qnaList.do'"-->
			<input id="modifyBtn" type=button value="수정"> 
			<input id="deleteBtn" type=button value="삭제" >
		<td width="0">&nbsp;</td>
	</tr>
</table>
