<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var id;
	
	$("#listTB tbody tr").on("mouseover", function(){
		$("table#listTB tbody tr").css("background-color", "white");
		$(this).css("background-color", "lightcyan");
	});
	
	$("#listTB tbody tr").on("click", function(){
		id = $(this).find(":nth-child(2)").text();
		$.ajax({
			url:"${initParam.rootPath}/member/login/admin/findMemberById.do",
			data:{"id":id},
			type:"post",
			dataType:"json",
			success:function(ret){
				/* $("#pic").html("<img src='${initParam.rootPath }/uploadPhoto/no-photo.png'>"); */
				$("#memberId").text("아이디 : "+ret.id);
				$("#password").text("패스워드 : "+ret.password);
				$("#name").text("이름 : "+ret.name);
				$("#nickname").text("닉네임 : "+ret.nickname);
				$("#birth").text("생일 : "+ret.birth);
				$("#sex").text("성별 : "+ret.sex);
				$("#address").text("주소 : "+ret.address);
				$("#email").text("이메일 : "+ret.email);
				$("#phoneNo").text("전화번호 : "+ret.phoneNo);
				$("#favoriteFood").text("선호음식 : "+ret.favoriteFood);
				$("#joinDate").text("가입일 : "+ret.joinDate);
				$("#mileage").text("마일리지 : "+ret.mileage);
				$("#grade").text("등급 : "+ret.grade);
				$("#state").text("탈퇴여부 : "+ret.state);
				//Dialog 띄우기 
				$("#dialog").dialog({modal:true,width:500});
			},
			error:function(xhr, dd, ddd){
				alert(xhr.status + dd + ddd);
			}
		});
	});
	
	if("${requestScope.command}" == 'sort'){
		if("${requestScope.info}" == 'sortLatest'){
			$("#dateCategory").val("${requestScope.info}");
		}else if("${requestScope.info}" == 'sortLate'){
			$("#dateCategory").val("${requestScope.info}");
		}else{
			$("#selectSort").val("${requestScope.info}");
		}
	}else if("${requestScope.command}" == 'grade'){
		$("#gradeCategory").val("${requestScope.info}");
	}else if("${requestScope.command}" == 'state'){
		$("#stateCategory").val("${requestScope.info}");
	}else if("${requestScope.command}" == 'member_id'){
		$("#selectSearchCategory").val("${requestScope.command}");
	}else if("${requestScope.command}" == 'member_name'){
		$("#selectSearchCategory").val("${requestScope.command}");
	}else if("${requestScope.command}" == 'member_nickname'){
		$("#selectSearchCategory").val("${requestScope.command}");
	}
	
	$("#searchBtn").on("click",function(){
		if($("#searchText").val().trim()==""){
			 alert("검색할 내용를 입력하세요.");
			return false;
		}
		if($("#selectSearchCategory").val()=="default"){
			 alert("검색기준을 선택하세요.");
			return false;
		} 
		var command = $("#selectSearchCategory").val()
		$("#command").val(command);
	});
	
	$("#selectSort").on("change",function(){
		 var sort = $("#selectSort").val();
		 if(sort != 'default'){
			 document.location.href="${initParam.rootPath }/member/login/admin/findMemberByInfo.do?info="+$("#selectSort").val()+"&command=sort";
		 }
	});
	
	$("#dateCategory").on("change",function(){
		var date = $("#dateCategory").val();
		if(date !="default"){
			document.location.href="${initParam.rootPath }/member/login/admin/findMemberByInfo.do?info="+$("#dateCategory").val()+"&command=sort";
		}
	});
	
	$("#gradeCategory").on("change",function(){
		var grade = $("#gradeCategory").val();
		if(grade !="default"){
			document.location.href="${initParam.rootPath }/member/login/admin/findMemberByInfo.do?info="+$("#gradeCategory").val()+"&command=grade";
		}
	});
	
	$("#stateCategory").on("change",function(){
		var state = $("#stateCategory").val();
		if(state !="default"){
		document.location.href="${initParam.rootPath }/member/login/admin/findMemberByInfo.do?info="+$("#stateCategory").val()+"&command=state";
		}
	});
	
	$("#deleteBtn").on("click",function(){
		var isDel = confirm("정말로 삭제하시겠습니까?");
		if (isDel) {
			document.location.href="${initParam.rootPath }/member/login/admin/removeMemberByMaster.do?id="+id;
		} else {
			return;
		}
	});
});
</script>

<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<style type="text/css">
#table{
	font-family:'Malgun Gothic', dotum;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	padding: 20px;
	text-align:center;
}
#listTB {
	width:900px;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	border: 1;
}
#listTB thead tr {
	font-weight: bold;
	background: lightgray;
	border: 2px solid #B70000;
}
#listTB tbody tr{
	cursor: pointer;
	border-bottom: 1px solid black;
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
<c:choose>
	<c:when test="${fn:length(requestScope.member_list) != 0 }">
	<table id="listTB"  >
		<thead>
			<tr align="center">
				<td>번호</td>
				<td>ID</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>Email</td>
				<td>전화번호</td>
				<td>
					<select id="dateCategory">
						<option value="default">가입일</option>
						<option id="sortLatest" value="sortLatest">최신순</option>
						<option id="sortLate" value="sortLate">늦은순</option>
					</select>
				</td>
				<td>
					<select id="gradeCategory">
						<option value="default">등급</option>
						<option id="master" value="master">관리자</option>
						<option id="user" value="user">사용자</option>
					</select>
				</td>
				<td>
					<select id="stateCategory">
						<option value="default">탈퇴여부</option>
						<option id="가입" value="가입">가입</option>
						<option id="탈퇴" value="탈퇴">탈퇴</option>
					</select>
				</td>
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
					<td>${member.joinDate}</td>
					<td>${member.grade}</td>
					<td>${member.state}</td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>

	<p align="center">
	<!-- 페이징 처리 -->
	<!-- 이전 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.previousPageGroup }">
			<a href="${initParam.rootPath }/member/login/admin/findMemberByInfo.do?page=${pagingBean.startPageOfPageGroup-1}&command=${requestScope.command}&info=${requestScope.info}">◀&nbsp;</a>
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
				<a href="${initParam.rootPath }/member/login/admin/findMemberByInfo.do?page=${pageNum}&command=${requestScope.command}&info=${requestScope.info}">&nbsp;${pageNum}&nbsp;</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<!-- 다음 페이지 그룹 -->
	<c:choose>
		<c:when test="${pagingBean.nextPageGroup }">
			<a href="${initParam.rootPath }/member/login/admin/findMemberByInfo.do?page=${pagingBean.endPageOfPageGroup+1}&command=${requestScope.command}&info=${requestScope.info}">&nbsp;▶</a>
		</c:when>
		<c:otherwise>&nbsp;▶</c:otherwise>
	</c:choose>	
	</p>
	</c:when>
	<c:otherwise>
	<table align="center" id="listTB" >
		<thead>
			<tr align="center">
				<td>번호</td>
				<td>ID</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>Email</td>
				<td>전화번호</td>
				<td>가입일</td>
				<td>등급</td>
				<td>탈퇴여부</td>
			</tr>
		</thead>
		<tbody>
				<tr align="center">
					<td colspan="9"><font color="red">등록된 회원이 없습니다.</font></td>
				</tr> 
		</tbody>
	</table>
	</c:otherwise>
</c:choose>

<table align="center">
				<tr>
					<td>
						<select id="selectSort" name="category">
							<option value="default">정렬기준</option>
							<option value="sortId">아이디</option>
							<option value="sortName">이름</option>
						</select>
					</td>
					<td>
						<select id="selectSearchCategory" name="category">
							<option value="default">검색기준</option>
							<option value="member_id">아이디</option>
							<option value="member_name">이름</option>
							<option value="member_nickname">닉네임</option>
						</select>
					</td>
					<td colspan="2">
						<form id="searchForm" name="searchForm" action="${initParam.rootPath }/member/login/admin/findMemberByInfo.do" method="post">
							<input type="text" id="searchText" name="info" placeholder="검색하기">			
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
	<!-- <figure id="pic" align="center"></figure> -->
	<section>
		<header style="text-align: center;font-weight: bolder;font-size: 1.3em;border-bottom: 2px solid black;padding: 5px"> 회원정보 </header>
		<article id="memberId"></article>
		<article id="password"></article>
		<article id="name"></article>
		<article id="nickname"></article>
		<article id="birth"></article>
		<article id="sex"></article>
		<article id="address"></article>
		<article id="email"></article>
		<article id="phoneNo"></article>
		<article id="favoriteFood"></article>
		<article id="joinDate"></article>
		<article id="mileage"></article>
		<article id="grade"></article>
		<article id="state"></article>
		<table align="center">
			<tr align="center">
				<td align="center"><input id="deleteBtn" type="button" value="탈퇴시키기"></td>
			</tr>
		</table>
	</section>
</div>