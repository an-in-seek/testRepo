<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript"src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#listTB tbody tr").on("mouseover", function() {
			$("#listTB tbody tr").css("background-color", "white");
			$(this).css("background-color", "lightgray");
		});
		
		$("#listTB tbody tr").on("click", function(){
			var reviewNo = $(this).find(":nth-child(3)").text();
			document.location.href="${initParam.rootPath }/review/reviewView.do?reviewNo="+reviewNo;
		});
		
	});
</script>

<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />
<style type="text/css">
#mainTable{
	font-family:'Malgun Gothic', dotum;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	padding: 20px;
	text-align:center;
	float:center;   /*왼쪽으로 띄움 */
}
.table{
	font-family:'Malgun Gothic', dotum;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	padding: 5px;
	text-align:center;
	float:center;   /*왼쪽으로 띄움 */
}
.listTB{
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	align:center;
	width:800px;
	border: 1;
}
.listTB thead tr {
	font-weight: bold;
	background: silver;
}
.listTB tbody tr{
	cursor: pointer;
}
</style>

<table id="mainTable">
	<tr>
		<td>
			<div class="table">
			<h2 align="center">게시물 신고 목록</h2>
			<c:choose>
				<c:when test="${fn:length(requestScope.bbsMap.reported_list) != 0 }">
				<table id="listTB" class="listTB" border="1" >
					<thead>
						<tr align="center">
							<td>NO</td>
							<td>분류</td>
							<td>신고된 게시물 번호</td>
							<td>신고사유</td>
							<td>신고날짜</td>
							<td>처리상태</td>
							<td>신고자</td>
						</tr>
					</thead>
					<tbody>
							<c:forEach items="${requestScope.bbsMap.reported_list }" var="reported" varStatus="cnt">
								<tr align="center">
									<td>${reported.reportNo }</td>
									<td>${reported.category}</td>
									<td>${reported.reviewNo}</td>
									<td>${reported.reason}</td>
									<td>${reported.reportedDate}</td>
									<td>${reported.state}</td>
									<td>${reported.reporterId}</td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
			
				<p align="center">
				<!-- 페이징 처리 -->
				<!-- 이전 페이지 그룹 -->
				<c:choose>
					<c:when test="${bbsMap.pagingBean.previousPageGroup }">
						<a href="${initParam.rootPath }/reported/login/admin/reportedList.do?pageNo=${bbsMap.pagingBean.startPageOfPageGroup-1}">◀&nbsp;</a>
					</c:when>
					<c:otherwise>◀&nbsp;</c:otherwise>
				</c:choose>	
				<!-- 페이지 번호 -->
				<c:forEach begin="${bbsMap.pagingBean.startPageOfPageGroup }" end="${bbsMap.pagingBean.endPageOfPageGroup}" var="pageNum">
					<c:choose>
						<c:when test="${pageNum == bbsMap.pagingBean.currentPage }">
							&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="${initParam.rootPath }/reported/login/admin/reportedList.do?pageNo=${pageNum}">&nbsp;${pageNum}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 그룹 -->
				<c:choose>
					<c:when test="${bbsMap.pagingBean.nextPageGroup }">
						<a href="${initParam.rootPath }/reported/login/admin/reportedList.do?pageNo=${bbsMap.pagingBean.endPageOfPageGroup+1}">&nbsp;▶</a>
					</c:when>
					<c:otherwise>&nbsp;▶</c:otherwise>
				</c:choose>	
				</p>
				</c:when>
			</c:choose>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			 <%@include file="reported_reply.jsp"%> 
		</td>
	</tr>
</table>
