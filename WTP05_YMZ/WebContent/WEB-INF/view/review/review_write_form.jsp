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
		fCreator: "createSEditor2"
	});
	
	
});
</script>
<style type="text/css">
h2{
	text-align: center;
}
</style>
</head>
<body>
<h2>리뷰 글쓰기 폼</h2>

<form method="post" action="${initParam.rootPath }/review/review_write.do">
<input type="text" id="title" style="width:766px" value="제목 입력"><br><br>
<textarea name="content" id="content" rows="10" cols="100" style="width:766px; height:412px;">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea><br>
<input type="submit" value="등록">
<input type="button" value="취소" onclick="javascript:history.back(-1);">
</form>
</body>
</html>