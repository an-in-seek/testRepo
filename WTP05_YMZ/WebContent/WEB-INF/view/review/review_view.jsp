<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.cookie.js"></script> <!-- 쿠키 사용 -->
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function(){
	
	var reviewNumber = ${requestScope.review.reviewNo};
	// 새로고침 조회수 증가 막기
	var c = $.cookie('reviewNo'); // 쿠키 조회
	$.cookie('reviewNo', '${requestScope.review.reviewNo}'); // 쿠키 reviewNo를 셋팅
	if(c!='${requestScope.review.reviewNo}'){
		$.ajax({
			url:"${initParam.rootPath}/review/ajax/updateHits.do", // 요청 url
			type:"post",
			data:{reviewNo:reviewNumber}, // 요청 파라미터 id = xxxxxxxx
			success:function(txt){
				$("#hitsCount").html(txt);
			}
		});
	}
	
	
	////////////////////////////////////////////////////// 리뷰 본문
	// 추천
	$("#recommendBtn").on("click", function(){		
		var id = "${empty sessionScope.login_info}";
		if(id=="true"){
			alert("로그인 안했엉");
			return;
		}
		$.ajax({
			url:"${initParam.rootPath }/review/login/ajax/recommendReview.do", // 요청 url
			type:"post",
			data:{reviewNo:reviewNumber}, // 요청 파라미터 id = xxxxxxxx
			success:function(txt){
				$("#recommendCount").html(txt);
				$("#recommendCountBtn").html(txt);
			}
		});
		
	});
	// 삭제
	$("#deleteBtn").on("click", function(){
		var isDel = confirm("정말로 삭제하시겠습니까?");
		if (isDel) {
			document.location.href="${initParam.rootPath }/review/login/removeReview.do?reviewNo="+${requestScope.review.reviewNo};
		} else {
			return;
		}
	});
	$("#reportBtn").on("click", function(){
		alert("아직 안했엉!! ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
	});
	
	
	// 댓글 버튼
	$("#reply_modifyBtn").on("click", function(){
		alert("로그인부터 하세욥!!!");
	});
	$("#reply_deleteBtn").on("click", function(){
		alert("로그인부터 하세욥!!!");
	});
	$("#reply_reportBtn").on("click", function(){
		alert("로그인부터 하세욥!!!");
	});
	
});
</script>	
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
	background: hotpink;
	width:100px;
	height:50px;
}
button#recommendBtn{
	width:200px;
	height:100px;
	background: palegreen;
}

</style>
<!-- css 끝 -->
</head>
<body>

<div align="center">
<h2>리뷰</h2>

<!-- ************************************** 리뷰 정보 ************************************* -->
<table id="contentTB" style="width:900px">
		<thead>
			<tr>
				<td style="width:100px">글번호</td>
				<td style="width:450px">제목</td>
				<td style="width:50px">ID</td>
				<td style="width:100px">조회수</td>
				<td style="width:100px">등록일</td>
				<td style="width:100px">추천수</td>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td>${requestScope.review.reviewNo}</td>
				<td>${requestScope.review.title}</td>
				<td>${requestScope.review.memberId}</td> 
				<td id="hitsCount">${requestScope.review.hits}</td> 
				<td>${requestScope.review.regDate}</td>
				<td id="recommendCount">${requestScope.review.recommend}</td>
			</tr> 
		</tbody>
	</table>
	<br>
<hr>
</div>


<!-- ********************************* 리뷰 내용이 들어가는 공간 *************************************** -->

${requestScope.review.content }<br>

	<div align="center" id="recommend"> <!-- 추천 버튼 -->
		<button id="recommendBtn">
			<span id="recommendCountBtn">${requestScope.review.recommend}</span>
			<font color="" size='4'>♥</font>
		</button>
	</div><br><br>
	
<!-- ******************************* 리뷰 내용이 들어가는 공간 끝 ************************************** -->



<div id="reply" align="center">
	<!-- 버튼 -->
	<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${requestScope.pageNo}"><button>목록</button></a>
	<a href="${initParam.rootPath }/review/login/modifyForm.do?reviewNo=${requestScope.review.reviewNo}">
	<button id="modifyBtn">수정</button></a>
	<button id="deleteBtn">삭제</button>
	<button id="reportBtn">신고</button>

<hr>
<!-- ****************************************  댓 글 영 역  ****************************************** -->

<form action="${initParam.rootPath }/review/login/register.do"  method="post">
	<input type="hidden" name="reviewNo" value="${requestScope.review.reviewNo}">
	<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
<!-- 테이블 시작 -->
<table id="replyTB" style="width:800px">
		<thead>
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>등록일</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<!-- 여기 수정해야행 -->
			<c:forEach items="${requestScope.reviewReplyList }" var="reply">
				<tr>
					<td>${reply.memberId}</td>
					<td>${reply.content}</td>
					<td>${reply.regDate}</td>
					<td>
						<button id="reply_modifyBtn" style="width:80px;height:20px;">수정</button>
						<button id="reply_deleteBtn" style="width:80px;height:20px;">삭제</button>
						<button id="reply_reportBtn" style="width:80px;height:20px;">신고</button>
					</td>
				</tr> 
			</c:forEach>
			<!-- 수정해야행 끝 -->
		</tbody>
	</table>
	<br>
	
	<table>
		<tr>
			<td>
				<!-- 댓글 작성 영역 -->
				<textarea name="content" id="reply_content" style="width:600px; height:100px;"></textarea><br>
			</td>
			<td>
				<!-- 등록 버튼 -->
				<input type="submit" style="width:200px;height:100px;" value="등록">
				
				
			</td>
		</tr>
	</table>
</form>

</div>
</body>

</html>
