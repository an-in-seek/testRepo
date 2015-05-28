<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹자먹자 야 먹자</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript">
$(document).ready(function(){
	
	var txt = "";
	// 정렬 버튼 이벤트
	$("#searchBtn").on("click", function(){
		alert("검색");
	});
	
	
	// 정렬방식 셀렉터 이벤트
	$("#searchSort").on("change", function(){
		txt = $(this).val(); // $(select객체).val() - 선택된 option의 value가 리턴
		alert("정렬방식 : "+txt);
	});
	
});
</script>
<style type="text/css">
table#listTB thead tr{
	font-weight: bold;
	background: lightgray;
	text-align: center;
}
table#listTB tbody tr{
	cursor: pointer;
}
</style>


</head>
<body>
<h2>리뷰 목록이다.</h2>

<!-- 테이블 시작 -->
<table id="listTB" style="width:700px">
		<thead>
			<tr>
				<td>번호</td>
				<td>상호명</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>추천수</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<!-- 여기 수정해야행 -->
			<c:forEach items="${requestScope.reviewList }" var="review">
				<tr>
					<td>${review.reviewNo }</td>
					<td>${review.title}</td>
					<td>${review.memberId}</td>
					<td>${review.regDate}</td>
					<td>${review.recommend}</td>
					<td>${review.hits}</td>
				</tr> 
			</c:forEach>
			<!-- 수정해야행 끝 -->
		</tbody>
	</table>
	<p>
<!-- 테이블 끝 -->

<!-- 기능 -->
<form method="post" action="${initParam.rootPath }/review/review_write_form.do">
<select id="searchSort">
			<option>정렬방식</option>
			<option value="추천수">추천수</option>
			<option value="조회수">조회수</option>
			<option value="최신글">최신글</option>
</select>
<input type="text" id="searchText">
<input type="button" id="searchBtn" value="검색">
<input type="submit" id="writeBtn" value="글쓰기">
</form>
</body>
</html>