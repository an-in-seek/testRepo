<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript">
$(document).ready(function(){
	$("table#listTB tbody tr").on("mouseover", function(){
		$("table#listTB tbody tr").css("background-color", "white");
		$(this).css("background-color", "silver");
	});
	$("table#listTB tbody tr").on("click", function(){
		var id = $(this).find(":first-child").text();
		$.ajax({
			url:"${initParam.rootPath}/member/findMemberById.do",
			data:{"id":id},
			type:"post",
			dataType:"json",
			success:function(ret){
				if(ret.pictureName){
					$("#pic").html("<img style='max' src='${initParam.rootPath }/uploadPhoto/"+ret.pictureName+"'>");
				}else{
					$("#pic").html("<img src='${initParam.rootPath }/uploadPhoto/no-photo.png'>");
				}
				$("#id").text("아이디 : "+ret.id);
				$("#password").text("패스워드 : "+ret.password);
				$("#name").text("이름 : "+ret.name);
				$("#email").text("이메일 : "+ret.email);
				$("#joinDate").text("가입일 : "+ret.joinDate);
				//Dialog 띄우기 
				$("#dialog").dialog({modal:true,width:400});
			}
		});
	});
});
</script>
<style type="text/css">
table#listTB thead tr{
	font-weight: bold;
	background: lightgray;
}
table#listTB tbody tr{
	cursor: pointer;
}
div#dialog{
	width:400px;
	display: none;
}
article{
	border-bottom: 1px solid black;
	padding: 5px;
	padding-left: 10px;
}
</style>

<h2 align="center">맛집 리뷰</h2> 	
<c:if test="${fn:length(requestScope.member_list) != 0 }">
	<table align="center" id="listTB" style="width:700px">
		<thead>
			<tr align="center">
				<td>ID</td>
				<td>이름</td>
				<td>Email</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.member_list }" var="member">
				<tr align="center">
					<td>${member.id }</td>
					<td>${member.name}</td>
					<td align="left">${member.email}</td>
					<td>${member.joinDate}</td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
</c:if>

<p align="center">
<!-- 페이징 처리 -->
<!-- 이전 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.previousPageGroup }">
		<a href="${initParam.rootPath }/member/memberListPaging.do?page=${pagingBean.startPageOfPageGroup-1}">◀</a>
	</c:when>
	<c:otherwise>◀</c:otherwise>
</c:choose>	
<!-- 페이지 번호 -->
<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
	<c:choose>
		<c:when test="${pageNum == pagingBean.currentPage }">
			<b>[${pageNum}]</b>
		</c:when>
		<c:otherwise>
			<a href="${initParam.rootPath }/member/memberListPaging.do?page=${pageNum}">
				${pageNum}
			</a>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;
</c:forEach>
<!-- 다음 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="${initParam.rootPath }/member/memberListPaging.do?page=${pagingBean.endPageOfPageGroup+1}">▶</a>
	</c:when>
	<c:otherwise>▶</c:otherwise>
</c:choose>	
</p>

<div id="dialog" title="선택 회원 정보">
	<figure id="pic"></figure>
	<section>
		<header style="text-align: center;font-weight: bolder;font-size: 1.3em;border-bottom: 2px solid black;padding: 5px"> 정보 </header>
		<article id="id"></article>
		<article id="password"></article>
		<article id="name"></article>
		<article id="email"></article>
		<article id="joinDate"></article>
	</section>
</div>