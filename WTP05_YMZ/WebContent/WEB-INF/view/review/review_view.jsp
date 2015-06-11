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


//댓글 삭제
function removeReply(reviewNo, replyNum, pNo){
	var isDel = confirm("정말로 삭제하시겠습니까?");
	if (isDel) {
		document.location.href="${initParam.rootPath }/review/login/removeReviewReply.do?reviewNo="+reviewNo+"&replyNo="+replyNum+"&pageNo="+pNo;
	} else {
		return;
	}
}

//댓글 수정
function modifyReply(reviewNo, replyNum, pNo, idx){
	var isUp=confirm("수정하시겠습니까?")
	if(isUp){
		var rrr = $("#rContent"+idx).text(); 		// 수정하고픈 리플의 내용을 갖고온다.
		$("#dialog2").append("<input type='hidden' name='replyNo' value='"+replyNum+"'>"); // 댓글 번호값을 다이얼로그 폼으로 보낸다.
		$("#reviewModifyContent").html(rrr);		// 원본 리플을 화면에 출력해준다.
		$("#dialog").dialog({modal:true, width:800});
	}else{
		return;
	}
}

//댓글 신고
function reportReply(reviewNo, rnum, pNo){
	var isCom=confirm("신고할랭???")
	if(isCom){
		$("#report_dialog").dialog({modal:true, width:800});
	}else{
		return;
	}
}

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
				$("#hitsCount").html("조회수 : "+txt);
			}
		});
	}
	
	///////////////////////////////////////////////////////////////////////// 회원별 버튼 보여주기 유/무 
	$.ajax({
		url:"${initParam.rootPath}/review/ajax/findLoginMember.do", //요청 url 설정
		type:"post", //HTTP 요청 방식(method)
		dataType:"json", //javascript객체로 변환해서 응답데이터를 전달.
		beforeSend:function(){
			$("#modifyBtn").hide();
			$("#deleteBtn").hide();
			$("#reportBtn").hide();
		},
		success:function(member){
			if(member.grade == 'master'){								// 관리자
				$("#modifyBtn").show();
				$("#deleteBtn").show();
			}else if(member.id == '${requestScope.review.memberId}'){	// 글쓴이와 로그인한 회원이 같을 경우
				$("#modifyBtn").show();
				$("#deleteBtn").show();
				$("#reportBtn").show();
			}
		}
	});
	
	
	////////////////////////////////////////////////////// 리뷰 본문
	// 추천
	$(".recommendBtn").on("click", function(){		
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
				$("#recommendCount").html("추천수 : " + "<font color='red'>"+txt+"</font>");
				$("#recommendCountBtn").html("<font color='red' size='5'>"+txt+"</font>");
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
	
	// 댓글 등록 버튼
	$("#reply_registerBtn").click(function() {
		//내용 입력안했을시 경고창
 		if($("#reply_content").val().trim()==""){
			alert("내용을 입력하세요");
			$("#reply_content").focus();
			return false;
		} 
	})
	
	$("#reply_reportBtn").on("click", function(){
		alert("로그인부터 하세욥!!!");
	});
	
});
</script>	
<!-- css -->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

table#replyTB tbody tr:nth-child(even) {
    background-color: lavenderblush;
}
table#replyTB tbody tr:nth-child(odd) {
  	background-color:#fff;
}

table#replyTB thead tr{
	font-weight: bold;
	background: mistyrose;
	text-align: center;
}
table#replyTB tbody tr{
	font-family: 'Hanna', sans-serif;
	font-size: 25px;
	height: 140px;
}
button{
	font-family: 'Hanna', sans-serif;
	font-size: 16px;
	background: #808080;
	color: #fffff7;
	width:70px;
	height:40px;
	cursor: pointer;
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
}

div#dialog{
	width:800px;
	display: none;
}
.recommendBtn{		
	cursor: pointer;
}
#recommendCountBtn{
	ffont-family: 'Nanum Brush Script', cursive;
}
.listTable{
	font-family: 'Hanna', sans-serif;
	color: #545c72;
	border:2px solid #B70000;
    -webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
}
.listTable thead tr{
	font-weight: bold;
	background: #EAEAEA;
	text-align: center;
	border-collapse: collapse;
}
.listTable tbody td{
	border-collapse: collapse;
}

.listTable th, .listTable td{
    padding:6px 12px 2px;
}
.listTable tbody tr:first-child th, .listTable tbody tr:first-child td{
    border-top: none;
}
#writeReplyArea{
	background: #eaeaea;
	height: 105px;
  	padding-top: 30px;
  	border: 1px solid #bfbfbf;
}
#writeReplyTB{
	margin-right : auto; /*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left : auto; /*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-top: -10px;
}
</style>
<!-- css 끝 -->
</head>
<body>

<h4>리뷰</h4>
<div align="left">
<!-- ************************************** 리뷰 정보 ************************************* -->
<table class="listTable" style="width:1020px">
		<thead>
			<tr>
				<th style="height:80px" colspan="5"><font size="5">${requestScope.review.title}</font></th>
			</tr>
		</thead>
		<tbody>
			<tr align="right">
				<td style="width:200px; text-align: left;">글번호 : ${requestScope.review.reviewNo}</td> 
				<td style="width:200px"><font color="blue" size="4">${requestScope.review.nickname}</font></td> 
				<td style="width:400px">${requestScope.review.regDate}</td>
				<td id="hitsCount" style="width:150px">조회수 : ${requestScope.review.hits}</td> 
				<td id="recommendCount" style="width:150px">추천수 : <font color="red">${requestScope.review.recommend}</font></td>
			</tr> 
		</tbody>
	</table>
	<br>
</div>


<!-- ********************************* 리뷰 내용이 들어가는 공간 *************************************** -->
<div id="reviewContent" style="width: 1020px">
${requestScope.review.content }<br>
</div>

	
		<div align="center" id="recommend"> <!-- 추천 버튼 -->
			<img src="${initParam.rootPath}/uploadPhoto/recommend.jpg" class="recommendBtn"> <br>
			<span id="recommendCountBtn"><font color="red" size="5">${requestScope.review.recommend}</font></span>
	</div><br><br>
	
<!-- ******************************* 리뷰 내용이 들어가는 공간 끝 ************************************** -->



<div id="reply" align="right">
	<!-- 버튼 -->
	<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${requestScope.pageNo}"><button>목록</button></a>
	<a href="${initParam.rootPath }/review/login/modifyForm.do?reviewNo=${requestScope.review.reviewNo}">
	<button id="modifyBtn">수정</button></a>
	<button id="deleteBtn">삭제</button>
	<button id="reportBtn">신고</button><br><br>
</div>
<!-- ****************************************  댓 글 영 역  ****************************************** -->

<div id="repTable" align="left">
	<form action="${initParam.rootPath }/review/login/register.do"  method="post">
	<input type="hidden" name="reviewNo" value="${requestScope.review.reviewNo}">
	<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
<!-- 테이블 시작 -->
<table id="replyTB" style="width:1020px;">
		<thead>
			<tr>
				<td colspan="3">댓글달아줘!!</td>
			</tr>
		</thead>
		<tbody> 
			<c:forEach items="${requestScope.reviewReplyList }" var="reply"  varStatus="status">
				<tr id="reply${status.index+1}">
					<th width="100" style="text-align: center"><font color="#FF4848">${reply.nickname}</font></th>
					<td id="rContent${status.index+1}" width="700"><font size='4'>${reply.content}</font></td>
					<td width="200" align="center"><font size="3">${reply.regDate}</font><br><br>
						<c:choose>
							<c:when test="${sessionScope.login_info.id == reply.memberId}"> <!-- 글쓴이와 로그인 회원이 일치 -->
								<!-- 수정 -->
								<a href="javascript:modifyReply(${requestScope.review.reviewNo}, ${reply.replyNo}, ${requestScope.pageNo}, ${status.index+1});" title="댓글 수정">
								<img src="${initParam.rootPath}/uploadPhoto/reviewreplyEdit.png" ></a>
								<!-- 제거 -->
								<a href="javascript:removeReply(${requestScope.review.reviewNo}, ${reply.replyNo}, ${requestScope.pageNo});" title="댓글 삭제">
								<img src="${initParam.rootPath }/uploadPhoto/reviewreplyDel.png"></a>
								<!-- 신고 -->
								<a href="javascript:reportReply(${requestScope.review.reviewNo}, ${reply.replyNo}, ${requestScope.pageNo});" title="댓글 신고">
								<img src="${initParam.rootPath}/uploadPhoto/reviewreplyCom.png"></a>
							</c:when>
							<c:when test="${sessionScope.login_info.grade =='master'}"> <!-- 관리자일때 -->
								<!-- 제거 -->
								<a href="javascript:removeReply(${requestScope.review.reviewNo}, ${reply.replyNo}, ${requestScope.pageNo});" title="댓글 삭제">
								<img src="${initParam.rootPath }/uploadPhoto/reviewreplyDel.png"></a>
								<!-- 신고 -->
								<a href="javascript:reportReply(${requestScope.review.reviewNo}, ${reply.replyNo}, ${requestScope.pageNo});" title="댓글 신고">
								<img src="${initParam.rootPath}/uploadPhoto/reviewreplyCom.png"></a>
							</c:when>
							<c:when test="${not empty sessionScope.login_info }"> <!-- 로그인한 상태 -->
								<!-- 신고 -->
								<a href="javascript:reportReply(${requestScope.review.reviewNo}, ${reply.replyNo}, ${requestScope.pageNo});" title="댓글 신고">
								<img src="${initParam.rootPath}/uploadPhoto/reviewreplyCom.png"></a>
							</c:when>						
						</c:choose>
						</td>
				</tr > 
			</c:forEach>
			<!-- 수정해야행 끝 -->
		</tbody>
	</table>
	<br>
	
	<div id="writeReplyArea">
		<table id="writeReplyTB">
			<tr>
				<td>
					<!-- 댓글 작성 영역 -->
					<textarea name="content" id="reply_content" placeholder="로그인후 등록이 가능합니다." style="width:800px; height:80px;">
					저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다.
건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 단어들은 표시가 제한됩니다.
					</textarea><br>
				</td>	
			<td>
				<!-- 등록 버튼 -->
				<input type="image" src="${initParam.rootPath }/uploadPhoto/reviewregis.png"  id="reply_registerBtn" value="댓글 입력">
			</td>
		</tr>
		</table>
	</div>
</form>

<!-- 댓글수정 dialog -->
<div id="dialog" title="댓글 수정" align="left">
	<figure id="pic"></figure>
	<section>
	<header style="text-align: center;font-weight: bolder;font-size: 1.3em;border-bottom: 2px solid black;padding: 5px"> 댓글을 입력하세요. </header>
	<form id="dialog2" action="${initParam.rootPath }/review/login/modifyReviewReply.do" method="post">
	<input type="hidden" name="reviewNo" value="${requestScope.review.reviewNo}">
	<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
	<table>
		<tr>
			<td>
				<textarea id="reviewModifyContent" name="content" style="width:600px; height:100px;"></textarea><br>
			</td>
			<td>
				<input type="submit" style="width:140px;height:100px;" value="수정">
			</td>
		</tr>
	</table>
	</form>
	</section>
</div>
	<!-- 댓글신고 dialog -->
	<div id="report_dialog" title="댓글 신고" align="left" >
	<figure id="pic"></figure>
	<section>
	<header style="text-align: center;font-weight: bolder;font-size: 1.3em;border-bottom: 2px solid black;padding: 5px"> 신고내용 접수 </header>
	<select>
		<option value="fuck">욕설신고</option>
		<option value="badman">성희롱</option>
		<option value="money">상업적 홍보글</option>
		<option value="guitar">기타</option>
	</select>
	</section>
	</div>
</div>
</body>

</html>
