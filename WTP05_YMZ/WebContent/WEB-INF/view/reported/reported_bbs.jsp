<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="table">
			<h2 align="center">게시물 신고 목록</h2>
			<c:choose>
				<c:when test="${fn:length(requestScope.bbsMap.reported_list) != 0 }">
				<table id="listTB" class="listTB" >
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