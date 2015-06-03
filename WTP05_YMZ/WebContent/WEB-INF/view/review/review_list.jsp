<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>먹자먹자 야 먹자</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript">
$(document).ready(function(){
	
	var txt = "";
	// 검색 버튼 이벤트
	$("#searchBtn").on("click", function(){
		var search = $("#searchText").val();
		alert(search+" 검색!!!은 아직 안돼");
	});
	
	
	// 정렬방식 셀렉터 이벤트
	$("#searchSort").on("change", function(){
		txt = $(this).val(); // $(select객체).val() - 선택된 option의 value가 리턴
		alert("정렬방식 : "+txt);
	});
	
	// 리뷰 제목 클릭 이벤트
	$("table#listTB tbody tr").hover(function(){
		 $(this).css("background-color", "lavender");
	}, function(){
		 $(this).css("background-color", "linen");
	});
	
	// 등록일 글자수 자르기
	
});
</script>
<style type="text/css">

table#listTB thead tr{
	color: azure;
	font-weight: bold;
	background: darkcyan;
	text-align: center;
}
table#listTB tbody tr td#title{
	cursor: pointer;
}
table#listTB tbody tr{
	background: linen;
}
button{
	width:100px;
	height:50px;
}

a.list:link {text-decoration:none; color: black;}/*방문하지 않은 페이지*/
a.list:visited {text-decoration:none; color: black;}/*방문한 링크 표시*/ 
a.list:hover {text-decoration:underline; color: tomato;}/*링크에 마우스 올라갔을 때*/


</style>
</head>

<body>

<section>
	<div align="center">
	<h2>맛집 리뷰</h2>
	
	<!-- 테이블 시작 -->
	<table id="listTB" style="width:1000px">
		<thead>
			<tr>
				<td style="width:50px">번호</td>
				<td style="width:350px">상호명</td>
				<td style="width:150px">작성자</td>
				<td style="width:100px">작성일</td>
				<td style="width:50px">추천</td>
				<td style="width:50px">조회</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.reviewList }" var="review">
				<tr>
					<td align="center">${review.reviewNo }</td>
					<td align="left" id="title">
					<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${review.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
					${review.title} 
					<c:if test="${review.replyCount != 0}">
					<font color="red">[${review.replyCount}]</font>
					</c:if>
					</a>
					</td>
					<td align="center">${review.memberId}</td>
					<td id="regDate" align="center">${review.regDate}</td>
					<td align="center" style="width:50px">${review.recommend}</td>
					<td align="center">${review.hits}</td>
				</tr> 
			</c:forEach>
			<!-- 수정해야행 끝 -->
		</tbody>
	</table>
	<br>
	<!-- 테이블 끝 -->


	<!-- 페이징 처리 -->
	
	<!-- 이전 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.previousPageGroup }">
			<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${pagingBean.startPageOfPageGroup-1}">◀</a>
		</c:when>
		<c:otherwise>◀</c:otherwise>
	</c:choose>
	<!-- 페이지 번호 -->
	<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
		<c:choose>
			<c:when test="${pageNum == pagingBean.currentPage }">
				<font color="red"><b>${pageNum}</b></font>
			</c:when>
			<c:otherwise>
				<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${pageNum}">${pageNum} </a>
			</c:otherwise>
		</c:choose>
	&nbsp;&nbsp;
	</c:forEach>
	<!-- 다음 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.nextPageGroup }">
			<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${pagingBean.endPageOfPageGroup+1}">▶</a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
	<br>

	<!-- 기능 -->
	<table>
		<tr>
			<td>
			<select id="searchSort">
					<option value="latest">최신글</option>
					<option value="recommend">추천수</option>
					<option value="hits">조회수</option>
			</select>
			</td>
			<td><input type="text" id="searchText"></td>
			<td><input type="button" id="searchBtn" value="검색"></td>
			<td>
				<form action="${initParam.rootPath }/review/login/review_write_form.do" method="post">
					<input type="submit" value="글쓰기">
				</form>
			</td>
		</tr>
	</table>
	<br>
	</div>
	
	<!-- 인기글 테이블 -->
	<div id="famousText" align="center">
	
		<table id="bestTB" style="width:400px">
		<thead>
			<tr>
				<td colspan="2" align="center">
					<font color="blue">오늘 인기글</font>
				</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.todayBest }" var="review" varStatus="status">
				<tr>
					<td align="center">${status.index+1}.</td>
					<td align="left" id="title">
					<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${review.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
					${review.title}
					</a>
					</td>
				</tr> 
			</c:forEach>
			<!-- 수정해야행 끝 -->
		</tbody>
	</table>
	</div>
</section>

</body>
</html>