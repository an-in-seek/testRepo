<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:choose>
	<c:when test="${fn:length(requestScope.myReply.replyList) != 0 }">
	<table width="680px" border="1">
		<thead class="tableHead">
			<tr align="center" style="border-color:#ccc;">
				<td width="70px">게시물 NO</td>
				<td width="70px">댓글 NO</td>
				<td width="320px">내용</td>
				<td width="80px">작성자</td>
				<td width="80px">날짜</td>
			</tr>
		</thead>
		<tbody style="border-color:#ccc;">
			<c:forEach items="${requestScope.myReply.replyList}" var="reply">
				<tr align="center">
					<td>${reply.reviewNo}</td>
					<td>${reply.replyNo}</td>
					<td>
						<c:choose>
							<c:when test="${fn:length(reply.content) <= 20}">
								${reply.content}
							</c:when>
							<c:otherwise>
								${reply.content.substring(0,19)}...
							</c:otherwise>
						</c:choose>
					</td>
					<td>${reply.memberId}</td>
					<td>${reply.regDate.substring(0,10)}</td>
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
						<c:when test="${myReply.pagingBean.previousPageGroup }">
							<a href="${initParam.rootPath }/member/login/mypage.do?pageNo2=${myReply.pagingBean.startPageOfPageGroup-1}">◀&nbsp;</a>
						</c:when>
						<c:otherwise>◀&nbsp;</c:otherwise>
					</c:choose>
					<!-- 페이지 번호 -->
					<c:forEach begin="${myReply.pagingBean.startPageOfPageGroup }" end="${myReply.pagingBean.endPageOfPageGroup}" var="pageNum">
						<c:choose>
							<c:when test="${pageNum == myReply.pagingBean.currentPage }">
								&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${initParam.rootPath }/member/login/mypage.do?pageNo2=${pageNum}">&nbsp;${pageNum}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 페이지 그룹 -->
					<c:choose>
						<c:when test="${myReply.pagingBean.nextPageGroup }">
							<a href="${initParam.rootPath }/member/login/mypage.do?pageNo2=${myReply.pagingBean.endPageOfPageGroup+1}">&nbsp;▶</a>
						</c:when>
						<c:otherwise>&nbsp;▶</c:otherwise>
					</c:choose>
				</p>
			</td>
		</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table width="680px" border="1" class="listTB">
		<thead class="tableHead">
			<tr align="center">
				<td width="70px">게시물NO</td>
				<td width="70px">댓글NO</td>
				<td width="320px">내용</td>
				<td width="80px">작성자</td>
				<td width="80px">날짜</td>
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
