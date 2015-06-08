<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>먹자먹자 야 먹자</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	

<script type="text/javascript">

function chagee(time, num){			// 오늘 날짜 비교하기
	var nowdate = new Date();
	var year = nowdate.getFullYear();
	var month = nowdate.getMonth() + 1;
	var day = nowdate.getDate();
	var date_str = year + "-" + (month<=9? '0'+month:month) + "-" + (day<=9? '0'+day:day);
	var regDate = time.substring(0,10);
	if(date_str == regDate){
		$("#regDate"+num).html(time.substring(11,19));
	}else{
		$("#regDate"+num).html(regDate);
	}
}

$(document).ready(function(){
	
	var txt = "";
	
	// 검색 방식 셀렉터 이벤트
	$("#searchSort").on("change", function(){
		txt = $(this).val(); // $(select객체).val() - 선택된 option의 value가 리턴
		// alert("검색방식 : "+txt);
	});
	
	// 조회수 정렬
	$("#latestSort").on("click", function(){
		var txt = "latest";
		document.location.href="${initParam.rootPath }/review/reviewList.do?sortType="+txt;
	});
	
	// 조회수 정렬
	$("#hitsSort").on("click", function(){
		var txt = "hits";
		document.location.href="${initParam.rootPath }/review/reviewList.do?sortType="+txt;
	});
	
	// 추천수 정렬
	$("#recommendSort").on("click", function(){
		var txt = "recommend";
		document.location.href="${initParam.rootPath }/review/reviewList.do?sortType="+txt;
	});
	
	// 리뷰 제목 클릭 이벤트
	$(".listTable tbody tr").hover(function(){
		 $(this).css("background-color", "lightcyan");
	}, function(){
		 $(this).css("background-color", "white");
	});
	
	// 검색 전송 이벤트
	$("#searchForm").on("submit",function(){
		if($("#searchText").val().trim()==""){  // 검색어를 입력하지 않았을 경우에 경고창
			alert("검색어를 입력하세요!!");
			return false;
		}
		var type = $("#searchSort").val();		// 검색 종류 
		var search = $("#searchText").val();	// 검색어
		$(this).append("<input type='hidden' name='searchType' value='"+type+"'>");
		$(this).append("<input type='hidden' name='query' value='"+search+"'>");
	});

});
</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
a.list:link {text-decoration:none; color: black;}/*방문하지 않은 페이지*/
a.list:visited {text-decoration:none; color: black;}/*방문한 링크 표시*/ 
a.list:hover {text-decoration:none; color: tomato;}/*링크에 마우스 올라갔을 때*/

.listTable{
	font-family: 'Hanna', sans-serif;
    border-collapse:collapse;
    table-layout:fixed; 
    min-width:800px;
}
.todayBestTB, .bestMonthTB{
	font-family: 'Hanna', sans-serif;
}
.listTable thead tr, .todayBestTB thead tr, .bestMonthTB thead tr{
	font-weight: bold;
	background: lavender;
	text-align: center;
}
.listTable th, .listTable td, .todayBestTB th, .todayBestTB td, .bestMonthTB th, .bestMonthTB td{
    border-left:1px solid;
    border-bottom:1px solid;
    border-color:#ccc;
    padding:6px 12px 2px;
}
.listTable tr:first-child th, .listTable tr:first-child td{
    border-top:1px solid #6c9d31;
}
.listTable tr th:first-child{
    border-left:none;
}
.listTable thead tr td#hitsSort{
	cursor: pointer;
}
.listTable thead tr td#recommendSort{
	cursor: pointer;
}
.listTable thead tr td#latestSort{
	cursor: pointer;
}
</style>
</head>

<body>

<section>
	<div align="center">
	<h4>맛집 리뷰</h4>

	
	<!-- 인기글 테이블 -->
	<div id="famousText" align="center">
	
		<table id="total">
			<tr>
				<td>
					<!-- 오늘 인기글 -->
					<table class="todayBestTB" style="width:500px">
						<thead>
							<tr>
								<td colspan="2" align="center">
								오늘 인기글
								</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.todayBest }" var="review" varStatus="status">
								<tr>
									<c:choose>
										<c:when test="${status.index+1 == 1}">
											<th align="center" width="100px"><font color="#FF3636">${status.index+1}위</font></th>
											<td align="left" id="title">
										<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${review.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
										<font color="#FF3636">${review.title}</font>
										</a>
										</td>
										</c:when>
										<c:otherwise>
											<th align="center" width="100px">${status.index+1}위</th>
											<td align="left" id="title">
											<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${review.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
											${review.title}
											</a>
										</td>
										</c:otherwise>
									</c:choose>
								
								</tr> 
							</c:forEach>
							<c:forEach begin="${fn:length(requestScope.todayBest)}" end="4" varStatus="status"> <!-- 5개 이하일 경우 빈공간을 만들어준다. -->
								<tr>
									<th align="center"  width="100px">${status.index+1}위</th>
									<td align="left" id="title">
									&nbsp;
									</td>
								</tr> 
							</c:forEach>
						</tbody>
					</table>
				</td>
				<td>
				<!-- 이번달 인기글 -->
				<table class="bestMonthTB" style="width:500px">
					<thead>
						<tr>
							<td colspan="2" align="center">
							이번달 인기글
							</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.monthBest }" var="review" varStatus="status">
						<tr>
							<c:choose>
							<c:when test="${status.index+1 == 1}">
								<th align="center" width="100px"><font color="#FF3636">${status.index+1}위</font></th>
								<td align="left" id="title">
								<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${review.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
								<font color="#FF3636">${review.title}</font>
								</a>
								</td>
							</c:when>
							<c:otherwise>
								<th align="center" width="100px">${status.index+1}위</th>
								<td align="left" id="title">
								<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${review.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
								${review.title}
								</a>
								</td>
							</c:otherwise>
							</c:choose>
						</tr> 
						</c:forEach>
						<c:forEach begin="${fn:length(requestScope.monthBest)}" end="4" varStatus="status">
								<tr>
									<td align="center">${status.index+1}위</td>
									<td align="left" id="title">&nbsp;</td>
								</tr> 
						</c:forEach>
					</tbody>
				</table>
				</td>
			</tr>
		</table>
	</div>
	<br>
	
	<!-- 테이블 시작 -->
	<c:choose>
	<c:when test="${fn:length(requestScope.reviewList) != 0 }">
	<table class="listTable" style="width:1000px">
		<thead>
			<tr>
				<td style="width:50px">번호</td>
				<td style="width:400px">제목</td>
				<td style="width:100px">작성자</td>
				<td id="latestSort" style="width:100px">작성일<font size="1" color="red">▼</font></td>
				<td id="recommendSort" style="width:70px">추천<font size="1" color="red">▼</font></td>
				<td id="hitsSort" style="width:70px">조회<font size="1" color="red">▼</font></td>
			</tr>
		</thead>
		<tbody>
			<!-- 공지 먼저 출력 -->
			<c:forEach items="${requestScope.notices }" var="notices">
					<tr>
						<th>공지</th>
						<td align="left" id="title">
							<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${notices.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
							<font color="blue">${notices.title}</font>
							</a>
						</td>
						<td align="center"><font color="blue">${notices.nickname}</font></td>
						<td id="regDate" align="center">${notices.regDate.substring(0,10)}</td>
						<td align="center" style="width:50px">${notices.recommend}</td>
						<td align="center">${notices.hits}</td>
					</tr>
			</c:forEach>
			<!-- 일반 게시물 출력 -->
			<c:forEach items="${requestScope.reviewList }" var="review" varStatus="status">
				<tr>
					<th align="center">${review.reviewNo }</th>
					<td align="left" id="title">
					<a href="${initParam.rootPath}/review/reviewView.do?reviewNo=${review.reviewNo}&pageNo=${pagingBean.currentPage}" class="list">
					${review.title} 
					<c:if test="${review.replyCount != 0}">
					<font color="#A748FF">[${review.replyCount}]</font>
					</c:if>
					</a>
					</td>
					<td align="center">${review.nickname}</td>
					<td id="regDate${status.index+1}" align="center">
						<script type="text/javascript">
							var tt = "${review.regDate}";
							var num = "${status.index+1}";
							chagee(tt, num);
						</script>
					</td>
					<td align="center" style="width:50px">${review.recommend}</td>
					<td align="center">${review.hits}</td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
	<br>
	</c:when>
	<c:otherwise>
	<table class="listTable" style="width:1100px">
		<thead>
			<tr>
				<td style="width:50px">번호</td>
				<td style="width:350px">제목</td>
				<td style="width:150px">작성자</td>
				<td style="width:100px">작성일</td>
				<td style="width:50px">추천</td>
				<td style="width:50px">조회</td>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td colspan="6"><font color="red">검색결과가 없습니다.</font></td>
			</tr>
		</tbody>
	</table>
	<br>
	</c:otherwise>
	</c:choose>
	<!-- 테이블 끝 -->


	<!-- 페이징 처리 -->
	
	<!-- 이전 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.previousPageGroup }">
			<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${pagingBean.startPageOfPageGroup-1}&sortType=${requestScope.sortType}
										&searchType=${requestScope.searchType}&query=${requestScope.query}">◀</a>
		</c:when>
		<c:otherwise>◀</c:otherwise>
	</c:choose>
	<!-- 페이지 번호 -->
	<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
		<c:choose>
			<c:when test="${pageNum == pagingBean.currentPage }">
				<font color="red"><b>${pageNum}</b></font>
			</c:when>
			<c:otherwise>
				<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${pageNum}&sortType=${requestScope.sortType}
										&searchType=${requestScope.searchType}&query=${requestScope.query}">${pageNum} </a>
			</c:otherwise>
		</c:choose>
	&nbsp;&nbsp;
	</c:forEach>
	<!-- 다음 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.nextPageGroup }">
			<a href="${initParam.rootPath }/review/reviewList.do?pageNo=${pagingBean.endPageOfPageGroup+1}&sortType=${requestScope.sortType}
										&searchType=${requestScope.searchType}&query=${requestScope.query}">▶</a>
		</c:when>
		<c:otherwise>▶</c:otherwise>
	</c:choose>
	<br>

	<!-- 검색 기능 & 글쓰기 -->
	<table>
		<tr>
			<td>
			<form id="searchForm" action="${initParam.rootPath }/review/reviewList.do" method="get">
			<select id="searchSort" style="width: 100px; height: 30px;">
					<option value="title">제목</option>
					<option value="id">아이디</option>
					<option value="nickname">닉네임</option>
			</select>
			
			<input type="text" id="searchText" style="width: 190px; height: 30px;">
			<input type="submit" id="searchBtn" value="검색" style="width: 100px; height: 30px;">
			</form>
			</td>
			<td>
			<form id="writeForm" action="${initParam.rootPath }/review/login/review_write_form.do">
				<input type="submit" value="글쓰기" style="width: 100px; height: 30px;">
			</form>
			</td>
		</tr>
	</table>
	<br>
	</div>
	
</section>

</body>
</html>
