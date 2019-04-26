<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#main1 a").css("color","black")
		.hover(function(){
			$(this).css("text-decoration","underline");
		},function(){
			$(this).css("text-decoration","none");
		});
});
</script>

<style>
@import url(https://fonts.googleapis.com/earlyaccess/hanna.css);
#main-title {color:#f8f8f8;font-size:70pt;margin-top:20%;}
.se {font-family: serif;}
.sa {font-family: sans-serif;}
.cu {font-family: cursive;}
.fa {font-family: fantasy;}
#main1{										/* 메인화면 오른쪽 로그인창 */
	width:700px;
	height:auto;
	font-family: 'Hanna', sans-serif;
	font-weight:normal;
	line-height:20px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	text-align:center;
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
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

<div id="main1">
<p align="left">&nbsp;▶ <font size="5">야! 먹자 맛집 TOP5</font></p>
<hr>
<table style="width:100%;margin-bottom:20px;">
	<tr id="top1" style="font-family:monospace;">
		<td align="left" valign="top" style="width:150px;padding:0px;"><img style="width:150px;height:219px;" src="${initParam.rootPath }/uploadPhoto/top1.png"></td>
		<td align="left" valign="top" style="width:270px;padding:0px;"><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[0].restaurantNo }&backURL=${initParam.rootPath}/index.do"><img style="width:270px;height:210px;border-style:solid;border-width:5px;border-color:lightgray;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[0].pictureName,',')[0] }"></a></td>
		<td align="left" style="padding-left:25px;">
			<p><font size="5" style="font-family:'Hanna',sans-serif;"><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[0].restaurantNo }&backURL=${initParam.rootPath}/index.do">${requestScope.top5[0].restaurantName }</a></font></p>
			<p><font color="gray">
				${requestScope.top5[0].category } | ${requestScope.locations[0] }<br>
				<c:choose>
					<c:when test="${fn:startsWith(requestScope.top5[0].score,'0')}"><span class="star_rating"><span style="width:0%"></span></span></c:when>
					<c:when test="${fn:startsWith(requestScope.top5[0].score,'1')}"><span class="star_rating"><span style="width:20%"></span></span></c:when>
					<c:when test="${fn:startsWith(requestScope.top5[0].score,'2')}"><span class="star_rating"><span style="width:40%"></span></span></c:when>
					<c:when test="${fn:startsWith(requestScope.top5[0].score,'3')}"><span class="star_rating"><span style="width:60%"></span></span></c:when>
					<c:when test="${fn:startsWith(requestScope.top5[0].score,'4')}"><span class="star_rating"><span style="width:80%"></span></span></c:when>
					<c:when test="${fn:startsWith(requestScope.top5[0].score,'5')}"><span class="star_rating"><span style="width:100%"></span></span></c:when>
				</c:choose>
				${requestScope.top5[0].score } | ${requestScope.top5[0].replyCount }명 참여
			</font></p>
			<p>${fn:replace(requestScope.top5[0].description,'<br>',' ') }</p>
		</td>
	</tr>
</table>
<table style="width:100%;margin-bottom:20px;">
	<tr align="left">
		<td id="top2" style="width:25%;">2.<br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[1].restaurantNo }&backURL=${initParam.rootPath}/index.do"><img style="width:160px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[1].pictureName,',')[0] }"></a><br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[1].restaurantNo }&backURL=${initParam.rootPath}/index.do">${requestScope.top5[1].restaurantName }</a><br><font size="2" color="gray">${requestScope.top5[1].category } | ${requestScope.locations[1] }</font></td>
		<td id="top3" style="width:25%;">3.<br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[2].restaurantNo }&backURL=${initParam.rootPath}/index.do"><img style="width:160px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[2].pictureName,',')[0] }"></a><br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[2].restaurantNo }&backURL=${initParam.rootPath}/index.do">${requestScope.top5[2].restaurantName }</a><br><font size="2" color="gray">${requestScope.top5[2].category } | ${requestScope.locations[2] }</font></td>
		<td id="top4" style="width:25%;">4.<br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[3].restaurantNo }&backURL=${initParam.rootPath}/index.do"><img style="width:160px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[3].pictureName,',')[0] }"></a><br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[3].restaurantNo }&backURL=${initParam.rootPath}/index.do">${requestScope.top5[3].restaurantName }</a><br><font size="2" color="gray">${requestScope.top5[3].category } | ${requestScope.locations[3] }</font></td>
		<td id="top5" style="width:25%;">5.<br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[4].restaurantNo }&backURL=${initParam.rootPath}/index.do"><img style="width:160px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[4].pictureName,',')[0] }"></a><br><a href="${initParam.rootPath }/restaurant/restaurantView.do?restaurantNo=${requestScope.top5[4].restaurantNo }&backURL=${initParam.rootPath}/index.do">${requestScope.top5[4].restaurantName }</a><br><font size="2" color="gray">${requestScope.top5[4].category } | ${requestScope.locations[4] }</font></td>
	</tr>
</table>
<hr>
</div>