<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#main-title {color:#f8f8f8;font-size:70pt;margin-top:20%;}
.se {font-family: serif;}
.sa {font-family: sans-serif;}
.cu {font-family: cursive;}
.fa {font-family: fantasy;}
#main1{										/* 메인화면 오른쪽 로그인창 */
	width:700px;
	height:auto;
	font-family: 'Hanna', sans-serif;
	border: solid 1px #b70000;   
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
</style>

<div id="main1">
맛집 TOP5
<table style="width:100%;margin-bottom:20px;">
	<tr>
		<td style="width:50px;font-size:50px;"><font color="red">1.</font></td>
		<td style="width:300px;"><img style="width:300px;height:250px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[0].pictureName,',')[0] }"></td>
		<td align="left">
			<p><font size="5">${requestScope.top5[0].restaurantName }</font></p>
			<p>${requestScope.top5[0].category } | ${requestScope.locations[0] }<br>${requestScope.top5[0].score } | ${requestScope.top5[0].replyCount }명 참여</p>
			<p>${requestScope.top5[0].description }</p>
		</td>
	</tr>
</table>
<table style="width:100%;margin-bottom:20px;">
	<tr align="left">
		<td style="width:25%;">2.<br><img style="width:150px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[1].pictureName,',')[0] }"><br>${requestScope.top5[1].restaurantName }<br><font size="2" color="gray">${requestScope.top5[1].category } | ${requestScope.locations[1] }</font></td>
		<td style="width:25%;">3.<br><img style="width:150px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[2].pictureName,',')[0] }"><br>${requestScope.top5[2].restaurantName }<br><font size="2" color="gray">${requestScope.top5[2].category } | ${requestScope.locations[2] }</font></td>
		<td style="width:25%;">4.<br><img style="width:150px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[3].pictureName,',')[0] }"><br>${requestScope.top5[3].restaurantName }<br><font size="2" color="gray">${requestScope.top5[3].category } | ${requestScope.locations[3] }</font></td>
		<td style="width:25%;">5.<br><img style="width:150px;height:120px;" src="${initParam.rootPath }/uploadPhoto/${fn:split(requestScope.top5[4].pictureName,',')[0] }"><br>${requestScope.top5[4].restaurantName }<br><font size="2" color="gray">${requestScope.top5[4].category } | ${requestScope.locations[4] }</font></td>
	</tr>
</table>
</div>