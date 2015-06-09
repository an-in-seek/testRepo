<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link type="text/css" href="${initParam.rootPath }/css/menudropbox.css"  rel="stylesheet">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

	.seek ul{ padding:0; list-style: none;}
    .seek ul li{ width:120px; display: inline-block; position: relative; text-align: center; line-height: 20px; }
    .seek ul li a{ width:100px; display: block; padding:5px 10px; color:#ffffff; border:0px solid #ffffff; background:#B70000; text-decoration:none; nowrap;}
    .seek ul li a:hover{color: gold;}
    .seek ul li ul{display: none; position: absolute; z-index: 999; left: 0;}
    .seek ul li:hover ul{display: block; border:1px #ffffff; /* display the dropdown */} 
    .seek{
    	width:100%;
    	margin-top: 2px;
    	font-family: 'Hanna', sans-serif;
    	height: 30px;
    	background: #B70000;
    	/* border:solid 2px #050099;  */
    }
</style> 
<body>
	<div>
		<ul class="jjooo">
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
					<li><a href="${initParam.rootPath }/qna/qnaList.do">QNA</a></li>
				</ul>
			</li>
			<li>
			<c:if test="${sessionScope.login_info.grade=='master'}">
				<li><a href="${initParam.rootPath }/member/login/memberListPaging.do" class="menu">회원관리</a></li>
			</c:if>
			</li>
		</ul>
	</div>

</body>
