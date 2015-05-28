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
	
	
	
});
</script>
</head>
<body>
리뷰 글쓰기 폼

<form method="post" action="${initParam.rootPath }/review/review_write.do">
제목 : <input type="text" id="title"><br>
내용 : <textarea name="description" style="width:500px; height:100px"></textarea><br>
<input type="submit" id="submitBtn" value="등록">
<input type="button" id="cancelBtn" value="취소">
</form>
</body>
</html>