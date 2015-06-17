<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="table">
	<h2 align="center">댓글 신고 목록</h2>
			<c:choose>
				<c:when test="${fn:length(requestScope.replyMap.reported_list) != 0 }">
				<table id="listTB" class="listTB">
					<thead>
						<tr align="center">
							<td width="40">NO</td>
							<td width="40">분류</td>
							<td width="100">게시물NO</td>
							<td>댓글내용</td>
							<td width="110">신고사유</td>
							<td width="110">신고날짜</td>
							<!--  <td width="80">처리상태</td> -->
							<td width="80">신고자</td>
						</tr>
					</thead>
					<tbody>
							<c:forEach items="${requestScope.replyMap.reported_list }" var="reported" varStatus="cnt">
								<tr align="center">
									<td>${reported.reportNo }</td>
									<td>${reported.category}</td>
									<td>${reported.reviewNo}</td>
									<td>
									<c:choose>
										<c:when test="${fn:length(reported.content) <= 20}">
											${reported.content}
										</c:when>
										<c:otherwise>
											${reported.content.substring(0,19)}...
										</c:otherwise>
									</c:choose>
									</td>
									<td>${reported.reason}</td>
									<td>${reported.reportedDate}</td>
									<!-- <td>${reported.state}</td> -->
									<td>${reported.reporterId}</td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
			
				<p align="center">
				<!-- 페이징 처리 -->
				<!-- 이전 페이지 그룹 -->
				<c:choose>
					<c:when test="${replyMap.pagingBean.previousPageGroup }">
						<a href="${initParam.rootPath }/reported/login/admin/reportedList.do?pageNo2=${replyMap.pagingBean.startPageOfPageGroup-1}">◀&nbsp;</a>
					</c:when>
					<c:otherwise>◀&nbsp;</c:otherwise>
				</c:choose>	
				<!-- 페이지 번호 -->
				<c:forEach begin="${replyMap.pagingBean.startPageOfPageGroup }" end="${replyMap.pagingBean.endPageOfPageGroup}" var="pageNum">
					<c:choose>
						<c:when test="${pageNum == replyMap.pagingBean.currentPage }">
							&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="${initParam.rootPath }/reported/login/admin/reportedList.do?pageNo2=${pageNum}">&nbsp;${pageNum}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 그룹 -->
				<c:choose>
					<c:when test="${replyMap.pagingBean.nextPageGroup }">
						<a href="${initParam.rootPath }/reported/login/admin/reportedList.do?pageNo2=${replyMap.pagingBean.endPageOfPageGroup+1}">&nbsp;▶</a>
					</c:when>
					<c:otherwise>&nbsp;▶</c:otherwise>
				</c:choose>	
				</p>
				</c:when>
				<c:otherwise>
					데이터가 없습니다.
				</c:otherwise>
			</c:choose>
			</div>