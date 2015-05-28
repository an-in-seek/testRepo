<%@ page contentType="text/html;charset=UTF-8"%>
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
	
	// 글쓰기 버튼 이벤트
	$("#writeBtn").on("click", function(){
		alert("글쓰기");
	});
	
	// 정렬방식 셀렉터 이벤트
	$("#searchSort").on("change", function(){
		txt = $(this).val(); // $(select객체).val() - 선택된 option의 value가 리턴
		alert("정렬방식 : "+txt);
	});
	
});
</script>
</head>
<body>
<h2>리뷰 목록이다.</h2>
<select id="searchSort">
			<option>정렬방식</option>
			<option value="추천수">추천수</option>
			<option value="조회수">조회수</option>
			<option value="최신글">최신글</option>
		</select>
<input type="text" id="searchText">
<input type="button" id="searchBtn" value="검색">
<input type="button" id="writeBtn" value="글쓰기">

</body>
</html>