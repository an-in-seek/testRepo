<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	a.menu:link {text-decoration:none; color: white;}/*방문하지 않은 페이지*/
	a.menu:hover	{text-decoration:underline; color: white;}/*링크에 마우스 올라갔을 때*/
	a.menu:active	{text-decoration:none; color: white;}/*링크 클릭시*/
	a.menu:visited {text-decoration:none; color: white;}/*방문한 링크 표시*/
</style>    

<a href='${initParam.rootPath }/index.do' class="menu">메인페이지</a>&nbsp;&nbsp;
<a href="${initParam.rootPath }/restaurant/showListByType.do" class="menu">맛집정보</a>&nbsp;&nbsp;
<a href="${initParam.rootPath }/review/reviewList.do" class="menu">맛집리뷰</a>&nbsp;&nbsp;
<a href="${initParam.rootPath }/faq/faqList.do" class="menu">고객센터</a>&nbsp;&nbsp;
