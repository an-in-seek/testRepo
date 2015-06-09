<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="${initParam.rootPath}/script/menuScript.js"></script>

<link type="text/css" href="${initParam.rootPath }/css/menuStyles.css"  rel="stylesheet">
<style type="text/css">
#menu{ background: #2b2f3a; }
</style> 

<body>
	<div id = "cssmenu" align="center">
		<ul>
			<li><a href='${initParam.rootPath }/index.do' class="menu">메인페이지</a></li>
			<li>
				<a href="${initParam.rootPath }/restaurant/restaurantTypeSelect.do" class="menu">맛집정보 &#9662;</a>
				<ul>
					<li><a href="${initParam.rootPath }/restaurant/restaurantTypeSelect.do">유형별</a></li>
					<li><a href="${initParam.rootPath }/restaurant/restaurantThemeSelect.do">테마별</a></li>
					<li><a href="${initParam.rootPath }/restaurant/selectLocation.do">위치별</a></li>
				</ul>
			</li>
			<li><a href="${initParam.rootPath }/review/reviewList.do" class="menu">맛집리뷰</a></li>
			<li>
				<a href="${initParam.rootPath }/faq/faqList.do" class="menu">고객센터 &#9662;</a>
				<ul>
					<li><a href="${initParam.rootPath }/faq/faqList.do">FAQ</a></li>
					<li><a href="${initParam.rootPath }/qna/qnaList.do">Q&A</a></li>
				</ul>
			</li>
			<li>
			<c:if test="${sessionScope.login_info.grade=='master'}">
				<li><a href="${initParam.rootPath }/reported/login/reportedList.do" class="menu">신고관리</a></li>
				<li><a href="${initParam.rootPath }/member/login/memberListPaging.do" class="menu">회원관리</a></li>
			</c:if>
			</li>
		</ul>
	</div>

</body>
