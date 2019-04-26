<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹자먹자 야 먹자</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script> 

<script type="text/javascript">
$(document).ready(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "/se2/SmartEditor2Skin.html",
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
		
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD");
		
		
		
		if($("#category").val() == '분류'){
			alert("분류항목을 선택하세요.");
			$("#category").focus();
			return false;
		}
		
		if (!$("#title").val()) {
			alert("제목을 입력하세요!!");
			$("#title").focus();
			return false;
		}
		if (!$("#content").val() || $("#content").val().trim()=="<p>&nbsp;</p>") {
			alert("내용을 입력하세요!!");
			$("#content").focus();
			return false;
		}
		
	});

	
	
});
</script>
<style type="text/css">
h3{
	text-align: center;
}
#save, #cancel{
	font-family: 'Hanna', sans-serif;
	font-size: 16px;
	color: #808080;
	background: #fffff7;
	width:70px;
	height:40px;
	cursor: pointer;
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
}
table#t1{
	width: 900px;
}
table#t1 thead tr{
	width: auto;
	font-weight: bold;
	background: lightgray;
}
</style>
</head>
<body>

<h3>리뷰 등록</h3>

<div align="center" style="padding:20px">
	<form id="write" method="POST" action="${initParam.rootPath }/review/login/write.do">
	
	<!-- 테이블 -->
	<table id="t1" align="center" style="border:solid 2px #B70000">
		<thead>
			<tr style="text-align: center;">
				<td colspan="4"><font size="4">리뷰(Review)</font></td>
			</tr>
		</thead>
		<c:if test="${sessionScope.login_info.grade != 'master' }">
		<tr>
			<td>&nbsp;</td>
			<td align="center" width="60px">분류</td>
			<td>
				<select id="category" name="category">
					<option>분류</option>
						<c:forEach items="${requestScope.categoryList}" var="c">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		</c:if>
		<tr>
			<td>&nbsp;</td>
			<td align="center" width="60px">제목</td>
			<td><input type="text" id="title" name="title" maxlength="20" style="width:800px" required="required"></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd">
			<td colspan="4"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">내용</td>
			<td><textarea name="content" id="content" rows="10" cols="100" style="width:800px; height:420px;"></textarea><br></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd">
			<td colspan="4"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center" colspan="2">
			<c:if test="${sessionScope.login_info.grade == 'master' }">
				<input type="hidden" name="category" value="공지">
			</c:if>
				<input type="submit" id="save" value="등록">
				<input type="button" id="cancel" value="취소" onclick="location='${initParam.rootPath }/review/reviewList.do'">
			</td>
			<td>&nbsp;</td>
		</tr>	
	</table>
	<!-- 테이블 끝 -->
	</form>
</div>

</body>
</html>