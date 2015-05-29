<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="${initParam.rootPath }/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "/WTP05_YMZ/se2/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
					fOnBeforeUnload : function() { }
				},
				fOnAppLoad : function() {
					// 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할 때 사용
					oEditors.getById["content"].exec("PASTE_HTML", [ "첫번째 에디터! 기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
				},
				fCreator : "createSEditor2"
			});
			// 등록버튼 클릭시 form 전송
			$("#save").click(function() {
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			});
	});
</script>
<style type="text/css">
h2 {
	text-align: center;
}
table#t1 {
	width: auto;
}
</style>

<div align="center">
	<h2>QNA게시물 등록</h2>
	<!-- <form id="write" method="post" action="${initParam.rootPath }/review/register.do">  -->
	<form id="write" method="post" action="${initParam.rootPath }/qna/insert.do">
		<!-- 테이블 -->
		<table id="t1">
			<tr>
				<td width="60px">제목</td>
				<td><input type="text" id="title" name="title" style="width: 700px"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" id="content" rows="10" cols="100" style="width: 700px; height: 350px;">
				에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.
				</textarea><br>
				</td>
			</tr>
			<tr align="center">
				<td></td>
				<td>
				<input type="submit" id="save" value="등록">
				<input type="button" value="취소" onclick="javascript:history.back(-1);">
				</td>
			</tr>
		</table>
		<!-- 테이블 끝 -->
	</form>
</div>