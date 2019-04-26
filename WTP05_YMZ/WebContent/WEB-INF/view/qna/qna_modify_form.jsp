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
			sSkinURI : "/se2/SmartEditor2Skin.html",
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
				oEditors.getById["content"].exec("PASTE_HTML", ["${requestScope.qna.content}"]);
			},
			fCreator : "createSEditor2"
		});
		// 등록버튼 클릭시 form 전송
			$("#save").click(function() {
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD");
				if($("#category").val() == '분류'){
 					alert("분류항목을 선택하세요.");
 					$("#category").focus();
 					return false;
 				}
				if(!$("#title").val()){
 					alert("제목을 입력하세요");
 					$("#title").focus();
 					return false;
 				}
 				if(!$("#content").val()){
 					alert("내용을 입력하세요");
 					$("#content").focus();
 					return false;
 				} 
		}); 
});
</script>

<style type="text/css">
h2 {
	text-align: center;
}
table#tb thead tr{
	width: auto;
	font-weight: bold;
	background: lightgray;
}
</style>

<h2>QNA게시물 수정</h2>
<div align="center" style="padding:20px">
	<!-- <form id="write" method="post" action="${initParam.rootPath }/review/register.do">  -->
	<form id="write" method="post" action="${initParam.rootPath}/qna/login/modifyQna.do">
		<input type="hidden" id="number" name="number" value="${requestScope.qna.number}" >
		<input type="hidden" id="memberId" name="memberId" value="${requestScope.qna.memberId}" >
		<!-- 테이블 -->
		<table id="tb" align="center" style="border: 2px solid #B70000">
			<thead>
				<tr style="text-align: center;">
					<td colspan="4"><font size="4">수정하기</font></td>
				</tr>
			</thead>
			<tr>
				<td>&nbsp;</td>
				<td align="center"  width="50px">작성자</td>
				<td>${requestScope.qna.memberId}</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center" >분류</td>
				<td>
					<select id="category" name="category">
						<option>분류</option>
						<c:forEach items="${requestScope.categoryList}" var="c">
								<c:choose>
									<c:when test="${c.categoryName == requestScope.qna.category}">
										<option value="${c.categoryName}" selected="selected">${c.categoryName}</option>
									</c:when>
									<c:otherwise>
										<option value="${c.categoryName}">${c.categoryName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">제목</td>
				<td><input type="text" id="title" name="title" style="width: 700px" value="${requestScope.qna.title}" required="required" maxlength="30"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">내용</td>
				<td><textarea name="content" id="content" rows="10" cols="100" style="width: 700px; height: 350px;"></textarea><br></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr align="center">
				<td>&nbsp;</td>
				<td colspan="2">
				<input type="submit" id="save" value="수정">
				<input type="button" value="취소" onclick="location='${initParam.rootPath }/qna/qnaList.do'">
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		<!-- 테이블 끝 -->
	</form>
</div>