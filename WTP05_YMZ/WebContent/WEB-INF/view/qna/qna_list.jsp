<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#listTB tbody tr").on("mouseover", function() {
			$("#listTB tbody tr").css("background-color", "white");
			$(this).css("background-color", "lightcyan");
		});

		if("${requestScope.category}" != null){
			$("#category").val("${requestScope.category}");
		}else if("${requestScope.category}" == '전체보기'){
			$("#category").val("전체보기");
		}
		
		$("#category").on("change", function() {
			var idx = this.selectedIndex;
			var category = this.value; //카테고리 값(회원관련, 맛집관련, 리뷰관련)
			document.categoryForm.submit();
		});
		
		$("#searchBtn").on("click",  function() {
			if(!$("#searchInfo1").val()){
				alert("검색할 내용을 입력하세요.");
				return false;
			}
		});
	});
</script>

<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />
<style type="text/css">
a.list:link {text-decoration:none; color: #545c72;}/*방문하지 않은 페이지*/
a.list:visited {text-decoration:none; color: #545c72;}/*방문한 링크 표시*/ 
a.list:hover {text-decoration:none; color: tomato;}/*링크에 마우스 올라갔을 때*/

#table{
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	padding: 20px;
	text-align:center;
	float:center;   /*왼쪽으로 띄움 */
}
.listTB {
	width: 800px;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
}
.listTB thead{
	background: #F8F8F8;
	border: 2px solid #B70000;
	text-align: center;
}
.listTB thead tr {
	font-weight: bold;
}
.listTB tbody{
	border: 1px solid white;
}
div#dialog {
	width: 400px;
	display: none;
}
article {
	border-bottom: 1px solid black;
	padding: 5px;
	padding-left: 10px;
}
</style>


<h2 align="center">고객센터(Q&A)</h2>
<div align="center" id="table">
<c:choose>
	<c:when test="${fn:length(requestScope.qna_list) != 0 }">
	<table id="listTB"  class="listTB" border="1">
		<thead>
			<tr align="center" style="border-color:#ccc;">
				<td width="40px">NO</td>
				<td width="320px">제목</td>
				<td width="90px">분류</td>
				<td width="70px">작성자</td>
				<td width="110px">작성일</td>
				<td width="70px">조회수</td>
			</tr>
		</thead>
		<tbody style="border-color:#ccc;">
			<c:forEach items="${requestScope.qna_list}" var="qna">
				<tr align="center" style="border-color:#ccc;">
					<td>${qna.number }</td>
					<td align="left"><c:forEach begin="1" end="${qna.relevel}">
							&nbsp;&nbsp;
						</c:forEach> <c:if test="${qna.relevel != 0}">
							<img src="${initParam.rootPath}/se2/img/reply_icon.gif" />
						</c:if> <a href="${initParam.rootPath}/qna/qnaView.do?qnaNo=${qna.number}" class="list">${qna.title}</a>
					</td>
					<td>${qna.category}</td>
					<td>${qna.memberId}</td>
					<td>${qna.registrationDate}</td>
					<td>${qna.hits}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table align="center">
		<tr>
			<td>
				<p align="center">
					<!-- 페이징 처리 -->
					<!-- 이전 페이지 그룹 -->
					<c:choose>
						<c:when test="${pagingBean1.previousPageGroup }">
							<a href="${initParam.rootPath }/qna/qnaListByCategory.do?pageNo=${pagingBean1.startPageOfPageGroup-1}&category=${requestScope.category}&searchInfo=${requestScope.searchInfo}">◀&nbsp;</a>
						</c:when>
						<c:otherwise>◀&nbsp;</c:otherwise>
					</c:choose>
					<!-- 페이지 번호 -->
					<c:forEach begin="${pagingBean1.startPageOfPageGroup }" end="${pagingBean1.endPageOfPageGroup}" var="pageNum">
						<c:choose>
							<c:when test="${pageNum == pagingBean1.currentPage }">
								&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${initParam.rootPath }/qna/qnaListByCategory.do?pageNo=${pageNum}&category=${requestScope.category}&searchInfo=${requestScope.searchInfo}">&nbsp;${pageNum}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 페이지 그룹 -->
					<c:choose>
						<c:when test="${pagingBean1.nextPageGroup }">
							<a href="${initParam.rootPath }/qna/qnaListByCategory.do?pageNo=${pagingBean1.endPageOfPageGroup+1}&category=${requestScope.category}&searchInfo=${requestScope.searchInfo}">&nbsp;▶</a>
						</c:when>
						<c:otherwise>&nbsp;▶</c:otherwise>
					</c:choose>
				</p>
			</td>
		</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table style="width: 800px" border="1" class="listTB">
		<thead>
			<tr align="center">
				<td width="40px">NO</td>
				<td width="320px">제목</td>
				<td width="90px">분류</td>
				<td width="70px">작성자</td>
				<td width="110px">작성일</td>
				<td width="70px">조회수</td>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td colspan="6"><font color="red">등록된 게시물이 없습니다.</font></td>
			</tr>
		</tbody>
	</table>
	</c:otherwise>
</c:choose>

	<table align="center">
		<tr>
			<td>
				<form id="categoryForm" name="categoryForm" action="${initParam.rootPath }/qna/qnaListByCategory.do" method="post">
					<input type="hidden" id="pageNo" name="pageNo" value="1">
					<input type="hidden" id="searchInfo2" name="searchInfo">	
					<select id="category" name="category">
						<option value="전체보기">전체보기</option>
						<c:forEach items="${requestScope.categoryList}" var="c">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</form>
			</td>
			<td colspan="2">
				<form id="searchQna" name="searchQna" action="${initParam.rootPath }/qna/qnaListByCategory.do" method="post">
					<input type="text" id="searchInfo1" name="searchInfo" placeholder="제목검색">						
					<input type="submit" id="searchBtn" value="검색">
				</form>
			</td>
			<td>
				<form action="${initParam.rootPath }/qna/login/writeForm.do" method="post">
					<input id="writeBtn" type="submit" value="글쓰기">
				</form>
			</td>
		</tr>
	</table>
</div>
