<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#listTB tbody tr").on("mouseover", function(){
		$("table#listTB tbody tr").css("background-color", "white");
		$(this).css("background-color", "lightgray");
	});
	$("#listTB tbody tr").on("click", function(){
		var id = $(this).find(":nth-child(2)").text();
		$.ajax({
			url:"${initParam.rootPath}/member/findMemberById.do",
			data:{"id":id},
			type:"post",
			dataType:"json",
			success:function(ret){
				$("#pic").html("<img src='${initParam.rootPath }/uploadPhoto/no-photo.png'>");
				$("#memberId").text("아이디 : "+ret.id);
				$("#password").text("패스워드 : "+ret.password);
				$("#name").text("이름 : "+ret.name);
				$("#nickname").text("닉네임 : "+ret.nickname);
				$("#birth").text("생일 : "+ret.birth);
				$("#sex").text("성별 : "+ret.sex);
				$("#address").text("주소 : "+ret.address);
				$("#email").text("이메일 : "+ret.email);
				$("#joinDate").text("가입일 : "+ret.joinDate);
				$("#mileage").text("마일리지 : "+ret.mileage);
				$("#grade").text("등급 : "+ret.grade);
				//Dialog 띄우기 
				$("#dialog").dialog({modal:true,width:500});
			},
			error:function(xhr, dd, ddd){
				alert(xhr.status + dd + ddd);
			}
		});
	});
	
	$("#categorySelect").on("change", function(){
		var txt = $(this).val();
		$("#command").val(txt)
	}); 
	
	$("#searchBtn").on("click", function(){
		var state = $("#categorySelect").val()
		if(state == '검색방식'){
			alert("검색방식을 선택하세요.");
			return false;
		}
	}); 
});
</script>

<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<style type="text/css">
div#table{
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	padding: 20px;
	width:800px;
	text-align:center;
	float:center;   /*왼쪽으로 띄움 */
}
#listTB {
	margin-left: 20px;
}
#listTB thead tr {
	font-weight: bold;
	background: silver;
}
#listTB tbody tr{
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

<h2 align="center">회원 목록</h2> 
<div align="center" id="table">	
<c:if test="${fn:length(requestScope.member_list) != 0 }">
	<table align="center" id="listTB" style="width:800px" border="1">
		<thead>
			<tr align="center">
				<td>번호</td>
				<td>ID</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>Email</td>
				<td>전화번호</td>
				<td>등급</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.member_list }" var="member" varStatus="cnt">
				<tr align="center">
					<td>${cnt.count }</td>
					<td>${member.id }</td>
					<td>${member.name}</td>
					<td>${member.nickname }</td>
					<td>${member.email}</td>
					<td>${member.phoneNo}</td>
					<td>${member.grade}</td>
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
		<a href="${initParam.rootPath }/member/login/findMemberByInfo.do?page=${pagingBean.startPageOfPageGroup-1}">◀&nbsp;</a>
	</c:when>
	<c:otherwise>◀&nbsp;</c:otherwise>
</c:choose>	
<!-- 페이지 번호 -->
<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
	<c:choose>
		<c:when test="${pageNum == pagingBean.currentPage }">
			&nbsp;<font color="blue" style="font-weight: bold; text-decoration: underline">${pageNum}</font>&nbsp;
		</c:when>
		<c:otherwise>
			<a href="${initParam.rootPath }/member/login/findMemberByInfo.do?page=${pageNum}">&nbsp;${pageNum}&nbsp;</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<!-- 다음 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="${initParam.rootPath }/member/login/findMemberByInfo.do?page=${pagingBean.endPageOfPageGroup+1}">&nbsp;▶</a>
	</c:when>
	<c:otherwise>&nbsp;▶</c:otherwise>
</c:choose>	
</p>

<table align="center">
				<tr>
					<td>
						<select id="categorySelect" name="category">
							<option value="검색방식">검색방식</option> 
							<option value="member_id">아이디</option>
							<option value="member_name">이름</option>
							<option value="member_nickname">닉네임</option>
							<option value="grade">등급</option>
						</select>
					</td>
					<td colspan="2">
						<form id="searchForm" name="searchForm" action="${initParam.rootPath }/member/login/findMemberByInfo.do" method="post">
							<input type="text" id="info" name="info" placeholder="검색하기">			
							<input type="hidden" id="command" name="command">
							<input type="submit" id="searchBtn" value="검색">
						</form>
					</td>
					<td>
						<form action="${initParam.rootPath }/member/joinForm.do" method="post">
							<input id="writeBtn" type="submit" value="회원등록">
						</form>
					</td>
				</tr>
			</table>
</div>

<div id="dialog" title="선택 회원 정보">
	<figure id="pic" align="center"></figure>
	<section>
		<header style="text-align: center;font-weight: bolder;font-size: 1.3em;border-bottom: 2px solid black;padding: 5px"> 정보 </header>
		<article id="memberId"></article>
		<article id="password"></article>
		<article id="name"></article>
		<article id="nickname"></article>
		<article id="birth"></article>
		<article id="sex"></article>
		<article id="address"></article>
		<article id="email"></article>
		<article id="joinDate"></article>
		<article id="mileage"></article>
		<article id="grade"></article>
	</section>
</div>