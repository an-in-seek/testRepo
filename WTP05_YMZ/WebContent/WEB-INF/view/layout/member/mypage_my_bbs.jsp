<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:choose>
	<c:when test="${fn:length(requestScope.myBBS.list) != 0 }">
	<table width="680px" border="1">
		<thead class="tableHead">
			<tr align="center" style="border-color:#ccc;">
				<td width="40px">NO</td>
				<td width="320px">제목</td>
				<td width="90px">날짜</td>
				<td width="90px">추천</td>
				<td width="90px">작성자</td>
			</tr>
		</thead>
		<tbody style="border-color:#ccc;">
			<c:forEach items="${requestScope.myBBS.list}" var="review">
				<tr align="center">
					<td>${review.reviewNo}</td>
					<td>${review.title}</td>
					<td>${review.regDate.substring(0,10)}</td>
					<td>${review.recommend}</td>
					<td>${review.memberId}</td>
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
						<c:when test="${myBBS.pagingBean.previousPageGroup }">
							<a href="${initParam.rootPath }/member/login/mypage.do?pageNo=${myBBS.pagingBean.startPageOfPageGroup-1}">◀&nbsp;</a>
						</c:when>
						<c:otherwise>◀&nbsp;</c:otherwise>
					</c:choose>
					<!-- 페이지 번호 -->
					<c:forEach begin="${myBBS.pagingBean.startPageOfPageGroup }" end="${myBBS.pagingBean.endPageOfPageGroup}" var="pageNum">
						<c:choose>
							<c:when test="${pageNum == myBBS.pagingBean.currentPage }">
								&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${initParam.rootPath }/member/login/mypage.do?pageNo=${pageNum}">&nbsp;${pageNum}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 페이지 그룹 -->
					<c:choose>
						<c:when test="${myBBS.pagingBean.nextPageGroup }">
							<a href="${initParam.rootPath }/member/login/mypage.do?pageNo=${myBBS.pagingBean.endPageOfPageGroup+1}">&nbsp;▶</a>
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
				<td width="40px">NO</td>
				<td width="320px">제목</td>
				<td width="90px">날짜</td>
				<td width="90px">추천</td>
				<td width="90px">작성자</td>
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
