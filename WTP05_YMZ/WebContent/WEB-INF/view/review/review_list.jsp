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
	color:azure;
	font-weight: bold;
	background: indigo;
	text-align: center;
}
table#listTB tbody tr{
	cursor: pointer;
}
button{
	width:100px;
	height:50px;
}
h2{
	text-align: center;
}
</style>


</head>
<body>
<h2>리뷰 목록</h2>
<div align="center">
<!-- 테이블 시작 -->
<table id="listTB" style="width:900px">
		<thead>
			<tr>
				<td style="width:50px">번호</td>
				<td style="width:450px">상호명</td>
				<td style="width:150px">작성자</td>
				<td style="width:50px">작성일</td>
				<td style="width:50px">추천</td>
				<td style="width:50px">조회</td>
			</tr>
		</thead>
		<tbody>
			<!-- 여기 수정해야행 -->
			<c:forEach items="${requestScope.reviewList }" var="review">
				<tr>
					<td align="center">${review.reviewNo }</td>
					<td align="left">${review.title}</td>
					<td align="center">${review.memberId}</td>
					<td align="center">${review.regDate}</td>
					<td align="right" style="width:50px">${review.recommend}</td>
					<td align="right">${review.hits}</td>
				</tr> 
			</c:forEach>
			<!-- 수정해야행 끝 -->
		</tbody>
	</table>
	<p>
<!-- 테이블 끝 -->

<!-- 기능 -->
<table>
		<tr>
			<td>
			<select id="searchSort">
					<option>정렬방식</option>
					<option value="추천수">추천수</option>
					<option value="조회수">조회수</option>
					<option value="최신글">최신글</option>
			</select>
			</td>
			<td><input type="text" id="searchText"></td>
			<td><input type="button" id="searchBtn" value="검색"></td>
			<td>
				<form action="${initParam.rootPath }/review/review_write_form.do" method="post">
					<input type="submit" value="글쓰기">
				</form>
			</td>
		</tr>
</table>
	
</div>
</body>
</html>