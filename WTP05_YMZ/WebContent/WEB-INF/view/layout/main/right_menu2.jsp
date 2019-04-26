<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#right_menu2 a").css("color","black")
		.hover(function(){
			$(this).css("text-decoration","underline");
		},function(){
			$(this).css("text-decoration","none");
		});
});
</script>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/hanna.css);
#right_menu2{				/* 로그인 입력 폼 */
	width: auto; 
	height: auto;
	font-family: 'Hanna', sans-serif;
	border: solid 1px #bfbfbf; 
	line-height:20px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	text-align: center;
	color: black;
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
	margin-top: 8%;
	margin-left: auto;
	margin-right: auto;
}
.btn input {			/* 버튼 */
  width: 90px;
  height: 30px;
  border: 0;
  border-radius: 0;
  background: #808080;
  font-size: 12px;
  line-height: 55px\9;
  color:white; 
  -webkit-appearance: none;
  cursor: pointer;
  font-family: 'Hanna', sans-serif;
}

.star_rating,
.star_rating span{display:inline-block;overflow:hidden;height:14px;background:transparent url(${initParam.rootPath }/css/images/ico_star.gif) no-repeat}
.star_rating{width:79px;vertical-align:-1px;}
.star_rating span{background-position:0 -14px;font-size:0;line-height:0;text-indent:-100px;*text-indent:0;vertical-align:top}

</style> 

<div id="right_menu2">
	<table border="1" style="width:100%;">
	<tr>
	<td style="padding-bottom:20px;">
		<p align="left" style="color:red;">&nbsp;!! 무작위 맛집 추천</p>
		<a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.randomRestaurant.restaurantNo }&backURL=${initParam.rootPath}/index.do"><img style="width:200px;height:150px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.randomRestaurant.pictureName,',')[0] }"></a><br>
		<a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.randomRestaurant.restaurantNo }&backURL=${initParam.rootPath}/index.do">${requestScope.randomRestaurant.restaurantName }</a><br>
		<font color="gray">${requestScope.randomRestaurant.category } | ${requestScope.randomLocation }<br>
		<div align="left" style="margin-left:64px;"><c:choose>
			<c:when test="${fn:startsWith(requestScope.randomRestaurant.score,'0')}"><span class="star_rating"><span style="width:0%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.randomRestaurant.score,'1')}"><span class="star_rating"><span style="width:20%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.randomRestaurant.score,'2')}"><span class="star_rating"><span style="width:40%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.randomRestaurant.score,'3')}"><span class="star_rating"><span style="width:60%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.randomRestaurant.score,'4')}"><span class="star_rating"><span style="width:80%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.randomRestaurant.score,'5')}"><span class="star_rating"><span style="width:100%"></span></span></c:when>
		</c:choose></div>
		${requestScope.randomRestaurant.score } | ${requestScope.randomRestaurant.replyCount }명 참여</font>
	</td>
	</tr>
	</table>
</div>
