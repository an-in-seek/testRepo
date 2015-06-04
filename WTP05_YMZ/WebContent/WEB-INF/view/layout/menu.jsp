<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	.seek ul{ padding:0; list-style: none;}
    .seek ul li{ width:140px; display: inline-block; position: relative; text-align: center; line-height: 20px; }
    .seek ul li a{ width:100px; display: block; padding:5px 10px; color:#ffffff; border:1px solid #ffffff; background:skyblue; text-decoration:none; nowrap;}
    .seek ul li a:hover{color: #fff; background: #939393;}
    .seek ul li ul{display: none; position: absolute; z-index: 999; left: 0;}
    .seek ul li:hover ul{display: block; /* display the dropdown */} 
</style>    

<body>

<div class="seek">
	<ul >
		<li><a href='${initParam.rootPath }/index.do' class="menu">메인페이지</a></li>
		<li>
			<a href="${initParam.rootPath }/restaurant/showListByType.do" class="menu">맛집정보</a>
			<ul>
				<li><a href="${initParam.rootPath }/restaurant/showListByType.do">유형별</a></li>
				<li><a href="${initParam.rootPath }/restaurant/showListByTheme.do">테마별</a></li>
				<li><a href="${initParam.rootPath }/restaurant/selectLocation.do">위치별</a></li>
			</ul>
		</li>
		<li><a href="${initParam.rootPath }/review/reviewList.do" class="menu">맛집리뷰</a></li>
		<li>
			<a href="${initParam.rootPath }/faq/faqList.do" class="menu">고객센터&#9662;</a>
			<ul>
				<li><a href="${initParam.rootPath }/faq/faqList.do">FAQ</a></li>
				<li><a href="${initParam.rootPath }/qna/qnaList.do">QNA</a></li>
			</ul>
		</li>
	</ul>
</div>

</body>
