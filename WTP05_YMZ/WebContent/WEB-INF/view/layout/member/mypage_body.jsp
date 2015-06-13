<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath }/script/modernizr.custom.04022.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#myMain a").css("color","black")
		.hover(function(){
			$(this).css("text-decoration","underline");
		},function(){
			$(this).css("text-decoration","none");
		});
	
	if("${requestScope.state}" == 'bbs'){
		$("#tab-1").prop('checked', 'checked');
	}else if("${requestScope.state}"=='reply'){
		$("#tab-2").prop('checked', 'checked');
	}else if("${requestScope.state}"=='report'){
		$("#tab-3").prop('checked', 'checked');
	}
	
	$(".listTB tbody tr").on("mouseover", function() {
		$(".listTB tbody tr").css("background-color", "white");
		$(this).css("background-color", "lightcyan");
	});
	
	$(".listTB tbody tr").on("click", function(){
		var reviewNo = $(this).find(":nth-child(1)").text();
		document.location.href="${initParam.rootPath }/review/reviewView.do?reviewNo="+reviewNo;
	});
});
</script>

<link rel="stylesheet" type="text/css" href="${initParam.rootPath }/css/demo.css" />
<link rel="stylesheet" type="text/css" href="${initParam.rootPath }/css/style.css" />
<style>
#main-title {color:#f8f8f8;font-size:70pt;margin-top:20%;}
.se {font-family: serif;}
.sa {font-family: sans-serif;}
.cu {font-family: cursive;}
.fa {font-family: fantasy;}
#myMain{										/* 메인화면 오른쪽 로그인창 */
	width:780px;
	height:auto;
	font-family: 'Hanna', sans-serif;
	font-weight:normal;
	background-color: #f8f8f8;
	border: solid 1px #b70000;  
	line-height:18px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
	margin-left: auto;
	margin-right: auto;
}
#memberTable{
	margin:10px;
	margin-left: auto;
	margin-right: auto;
}
.tableHead tr{
	background-color: #f8f8f8;
}
.listTB tbody tr{
	cursor: pointer;
}
.titleTd{
	width: 85px;
	text-align: right;
	border: 1px solid lightgray;
} 
.contentTd{
	width: 270px;
	border: 1px solid lightgray;
}
</style>

<div id="myMain">
	<table id="memberTable" align="center" >
		<thead style="background-color: #ffe08c">
			<tr>
				<td class="titleTd" colspan="4"><p align="center"><font size="4">나의 정보</font></p></td>
			</tr>
		</thead>
		<tr>
			<td class="titleTd">아이디(ID) : </td>
			<td class="contentTd">${requestScope.member.id}</td>
			<td class="titleTd">이름 : </td>
			<td class="contentTd">${requestScope.member.name}</td>
		<tr>
			<td class="titleTd">닉네임 : </td>
			<td class="contentTd">${requestScope.member.nickname}</td>
			<td class="titleTd">생일 : </td>
			<td class="contentTd">${requestScope.member.birth}</td>
		</tr>
		<tr>
			<td class="titleTd">성별 : </td>
			<td class="contentTd">${requestScope.member.sex}</td>
			<td class="titleTd">주소 : </td>
			<td class="contentTd">${requestScope.member.address} ${requestScope.member.detailAddress}</td>
		</tr>
		<tr>
			<td class="titleTd">Email : </td>
			<td class="contentTd">${requestScope.member.email}</td>
			<td class="titleTd">핸드폰 : </td>
			<td class="contentTd">${requestScope.member.phoneNo}</td>
		</tr>
		<tr>
			<td class="titleTd">선호음식 : </td>
			<td class="contentTd">${requestScope.member.favoriteFood}</td>
			<td class="titleTd">마일리지 : </td>
			<td class="contentTd">${requestScope.member.mileage}원</td>
		</tr>
		<tr>
			<td class="titleTd">등급 : </td>
			<td class="contentTd">${requestScope.member.grade}</td>
			<td class="titleTd">가입날짜 : </td>
			<td class="contentTd">${requestScope.member.joinDate}</td>
		</tr>
	</table>
	
	<p>

	<div class="container">
		<section class="tabs">
	        <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1"/>
	        <label for="tab-1" class="tab-label-1">My게시물</label>
	
	        <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2" />
	        <label for="tab-2" class="tab-label-2">My댓글</label>
	
	        <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3" />
	        <label for="tab-3" class="tab-label-3">My신고 </label>
	
		    <div class="clear-shadow"></div>
			
	        <div class="content">
		        <div class="content-1">
					<h2>내가 작성한 리뷰 게시물</h2>
					<p><%@include file="mypage_my_bbs.jsp" %></p>
				</div>	
		        <div class="content-2">
					<h2>내가 작성한 리뷰 댓글</h2>
	                <p><%@include file="mypage_my_reply.jsp" %></p>
			    </div>
		        <div class="content-3">
					<h2>내가 신고한 리뷰 게시물</h2>
	                <p><%@include file="mypage_my_report.jsp" %></p>
			    </div>
	        </div>
		</section>
	</div>

	
</div>
