<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:choose>
	<c:when test="${fn:length(requestScope.myReport.reportList) != 0 }">
	<table width="680px" border="1" class="listTB">
		<thead class="tableHead">
			<tr align="center" style="border-color:#ccc;">
				<td width="70px">게시물NO</td>
				<td>신고사유</td>
				<td width="100px">신고날짜</td>
				<td width="80px">신고자</td>
			</tr>
		</thead>
		<tbody style="border-color:#ccc;">
			<c:forEach items="${requestScope.myReport.reportList}" var="report">
				<tr align="center">
					<td>${report.reviewNo}</td>
					<td>${report.reason}</td>
					<td>${report.reportedDate.substring(0,10)}</td>
					<td>${report.reporterId}</td>
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
						<c:when test="${myReport.pagingBean.previousPageGroup }">
							<a href="${initParam.rootPath }/member/login/mypage.do?pageNo3=${myReport.pagingBean.startPageOfPageGroup-1}&state=report">◀&nbsp;</a>
						</c:when>
						<c:otherwise>◀&nbsp;</c:otherwise>
					</c:choose>
					<!-- 페이지 번호 -->
					<c:forEach begin="${myReport.pagingBean.startPageOfPageGroup }" end="${myReport.pagingBean.endPageOfPageGroup}" var="pageNum">
						<c:choose>
							<c:when test="${pageNum == myReport.pagingBean.currentPage }">
								&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${initParam.rootPath }/member/login/mypage.do?pageNo3=${pageNum}&state=report">&nbsp;${pageNum}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 페이지 그룹 -->
					<c:choose>
						<c:when test="${myReport.pagingBean.nextPageGroup }">
							<a href="${initParam.rootPath }/member/login/mypage.do?pageNo3=${myReport.pagingBean.endPageOfPageGroup+1}&state=report">&nbsp;▶</a>
						</c:when>
						<c:otherwise>&nbsp;▶</c:otherwise>
					</c:choose>
				</p>
			</td>
		</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table width="680px" border="1" >
		<thead class="tableHead">
			<tr align="center">
				<td width="70px">게시물NO</td>
				<td >신고사유</td>
				<td width="100px">신고날짜</td>
				<td width="80px">신고자</td>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td colspan="5"><font color="red">등록된 게시물이 없습니다.</font></td>
			</tr>
		</tbody>
	</table>
	</c:otherwise>
</c:choose>
