<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript">

	$(document).ready(function() {
		$("#listTB tbody tr").on("mouseover", function() {
			$("#listTB tbody tr").css("background-color", "white");
			$(this).css("background-color", "lightgray");
		});
		
		$.ajax({
			url:"${initParam.rootPath}/qna/findLoginMember.do", //요청 url 설정
			type:"post", //HTTP 요청 방식(method)
			dataType:"json", //javascript객체로 변환해서 응답데이터를 전달.
			beforeSend:function(){
				$("#writeBtn").hide();
			},
			success:function(member){
				if(member){
					$("#writeBtn").show();
				}
			}
		});
	});
</script>

<style type="text/css">
table#listTB thead tr{
	font-weight: bold;
	background: silver;
}
div#dialog{
	width:400px;
	display: none;
}
article{
	border-bottom: 1px solid black;
	padding: 5px;
	padding-left: 10px;
}
#listTB{
	margin-left: 10px;
}
</style>



<%-- <c:if test="${fn:length(requestScope.qna_list) != 0 }"> --%>
<table align="left" style="width: 700px">
	<tr>
		<td><h2 align="center">고객센터(Q&A)</h2></td>
	</tr>
</table>
<table align="left" id="listTB" style="width: 700px" border="1">
		<thead>
			<tr align="center">
				<td>NO</td>
				<td>제목</td>
				<td>분류</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.qna_list}" var="qna">
				<tr align="center">
					<td>${qna.number }</td>
					<td align="left">
						<c:forEach begin="1" end="${qna.relevel}">
							&nbsp;&nbsp;
						</c:forEach> 
						<c:if test="${qna.relevel != 0}"><img src="${initParam.rootPath}/se2/img/reply_icon.gif" /></c:if>
						<a href="${initParam.rootPath}/qna/qnaView.do?qnaNo=${qna.number}">${qna.title}</a>
					</td>
					<td>${qna.category}</td>
					<td>${qna.memberId}</td>
					<td>${qna.registrationDate}</td>
					<td>${qna.hits}</td>
				</tr>
			</c:forEach>
		</tbody>
</table>

	<table style="width: 700px">
		<tr height="10" align="center"></tr>
	</table>

	<table align="center">
		<tr>
			<td>
			<select id="searchSort">
					<option>분류방식</option>
					<option value="회원관련">회원관련</option>
					<option value="맛집관련">맛집관련</option>
					<option value="리뷰관련">리뷰관련</option>
			</select>
			</td>
			<td><input type="text" id="searchText"></td>
			<td><input type="button" id="searchBtn" value="검색"></td>
			<td>
				<form action="${initParam.rootPath }/qna/login/writeForm.do" method="post">
					<input id="writeBtn" type="submit" value="글쓰기">
				</form>
			</td>
		</tr>
	</table>
<%-- </c:if> --%>

<p align="center">
	<!-- 페이징 처리 -->
	<!-- 이전 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean1.previousPageGroup }">
			<a
				href="${initParam.rootPath }/qna/qnaList.do?page=${pagingBean1.startPageOfPageGroup-1}">◀</a>
		</c:when>
		<c:otherwise>◀</c:otherwise>
	</c:choose>
	<!-- 페이지 번호 -->
	<c:forEach begin="${pagingBean1.startPageOfPageGroup }" end="${pagingBean1.endPageOfPageGroup}" var="pageNum">
		<c:choose>
			<c:when test="${pageNum == pagingBean1.currentPage }">
				<font color="red"><b>${pageNum}</b></font>
			</c:when>
			<c:otherwise>
				<a href="${initParam.rootPath }/qna/qnaList.do?page=${pageNum}">${pageNum} </a>
			</c:otherwise>
		</c:choose>
	&nbsp;&nbsp;
</c:forEach>
	<!-- 다음 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean1.nextPageGroup }">
			<a href="${initParam.rootPath }/qna/qnaList.do?page=${pagingBean1.endPageOfPageGroup+1}">▶</a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
</p>
