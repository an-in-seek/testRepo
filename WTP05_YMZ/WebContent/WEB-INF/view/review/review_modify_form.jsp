<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹자먹자 야 먹자</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript" src="/WTP05_YMZ/se2/js/HuskyEZCreator.js" charset="utf-8"></script> 

<script type="text/javascript">
$(document).ready(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "/WTP05_YMZ/se2/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function(){
				
			}
		},
		fOnAppLoad : function(){
			// 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할 때 사용
			oEditors.getById["content"].exec("PASTE_HTML", [""]);
		},
		fCreator: "createSEditor2"
	});
	
	// 등록버튼 클릭시 form 전송
	$("#save").click(function(){
		if (!$("#title").val()) {
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}
		if (!$("#content").val()) {
			alert("내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
	});

	
	
});
</script>
<style type="text/css">
h2{
	text-align: center;
}
button{
	width:100px;
	height:50px;
}
table#t1{
	width: 100%;
}
</style>
</head>
<body>
<div align="center">
<h2>리뷰 수정폼</h2>

<!-- <form id="write" method="post" action="${initParam.rootPath }/review/register.do">  -->
<form id="write" method="post" action="${initParam.rootPath }/review/login/modifyReview.do?reviewNo=${review.reviewNo}">

<!-- 테이블 -->
<table id="t1">
	<tr>
		<td align="center">제목</td>
		<td><input type="text" id="title" name="title" style="width:900px" value="${requestScope.review.title}"></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td>
			<textarea name="content" id="content" rows="10" cols="100"
			 style="width:900px; height:420px;">${requestScope.review.content}</textarea><br>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="center">
			<input type="submit" id="save" value="수정">
			<input type="button" value="취소" onclick="javascript:history.back(-1);">
		</td>
	</tr>	
</table>
<!-- 테이블 끝 -->
</form>
</div>

</body>
</html>