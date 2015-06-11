<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"${initParam.rootPath}/restaurant/ajax/getMainRestaurants.do",
		type:"post",
		success:function(restaurants){
			var hits = restaurants[0];
			var manyScore = restaurants[1];
			var highScore = restaurants[2];
			$("#first").html("<img src='${initParam.rootPath}/uploadPhoto/${fn:split('"+hits.pictureName+"',',')[0]}'>"+hits.restaurantName);
			$("#second").html("<img src='${initParam.rootPath}/uploadPhoto/${fn:split('"+manyScore.pictureName+"',',')[0]}'>"+manyScore.restaurantName);
			alert(manyScore.pictureName);
			$("#third").html("<img src='${initParam.rootPath}/uploadPhoto/${fn:split('"+highScore.pictureName+"',',')[0]}'>"+highScore.restaurantName);
		}
	});
});
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
	background-color: lightgray;
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
	<table border="1" align="center" style="width:95%;">
		<tr>
			<td id="first" style="width:33%"></td>
			<td id="second" style="width:33%"></td>
			<td id="third" style="width:33%"></td>
		</tr>
	</table>
</div>