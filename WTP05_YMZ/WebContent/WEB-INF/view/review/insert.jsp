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
button{
	width:100px;
	height:50px;
}

</style>
<!-- css 끝 -->
</head>
<body>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
%>
<div align="center">
<h2>스마트에디터 연습 페이지</h2>

<!-- ************************************** 리뷰 정보 ************************************* -->
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
			<tr align="center">
				<td>111</td>
				<td>222</td> 
				<td>333</td>
				<td>444</td>
			</tr> 
		</tbody>
	</table>
	<p>
<hr>
</div>


<!-- ********************************* 리뷰 내용이 들어가는 공간 *************************************** -->
내용 시작<br>
<%=content %><br>
내용 끝<p>

<!-- ******************************* 리뷰 내용이 들어가는 공간 끝 ************************************** -->



<div id="reply" align="center">

<!-- 버튼 -->
<a href="${initParam.rootPath }/review/reviewList.do"><button>목록</button></a>
<button id="	">수정</button>
<button id="	">삭제</button>
<button id="	">추천</button>
<button id="	">신고</button>
<hr>
<!-- ****************************************  댓 글 영 역  ****************************************** -->


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

<!-- 댓글 작성 영역 -->
<textarea name="reply_content" id="reply_content" rows="5" cols="50" style="width:800px; height:100px;"></textarea><br>

<!-- 댓글 버튼 -->
<button id="	" style="width:100px;height:50px;">등록</button>
<button id="	" style="width:100px;height:50px;">수정</button>
<button id="	" style="width:100px;height:50px;">삭제</button>
<button id="	" style="width:100px;height:50px;">신고</button>
<button id="	" style="width:100px;height:50px;">목록</button>

</div>
</body>

</html>