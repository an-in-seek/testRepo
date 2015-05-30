<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<!-- css -->
<style type="text/css">
table#contentTB thead tr{
	font-weight: bold;
	background: lightgray;
	text-align: center;
}
table#contentTB tbody tr{
	cursor: pointer;
}
table#replyTB thead tr{
	font-weight: bold;
	background: lightgray;
	text-align: center;
}
table#replyTB tbody tr{
	cursor: pointer;
}
h2{
	text-align: center;
}
</style>
<!-- css 끝 -->
</head>
<body>

<h2>스마트에디터 연습 페이지</h2>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
%>


<table id="contentTB" style="width:700px">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>등록일</td>
				<td>추천수</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>111</td>
				<td>222</td> 
				<td>333</td>
				<td>444</td>
			</tr> 
		</tbody>
	</table>
	<p>
<hr>
내용 <br>
<%=content %><br>
내용 끝<br>
<!-- 글 내용이 들어가는 공간 -->


<!-- 글 내용이 들어가는 공간 끝 -->

<div id="reply" align="center">
<hr>
<!-- 테이블 시작 -->
<table id="replyTB" style="width:700px">
		<thead>
			<tr>
				<td>번호</td>
				<td>내용</td>
				<td>작성자</td>
				<td>등록일</td>
			</tr>
		</thead>
		<tbody>
			<!-- 여기 수정해야행 -->
			<c:forEach items="${requestScope.reviewReplyList }" var="reviewReply">
				<tr>
					<td>${reviewReply.댓글번호 }</td>
					<td>${reviewReply.내용}</td>
					<td>${reviewReply.회원ID}</td>
					<td>${reviewReply.등록일}</td>
				</tr> 
			</c:forEach>
			<!-- 수정해야행 끝 -->
		</tbody>
	</table>
	<p>
ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ<br>
ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ<br>
</div>
</body>

</html>