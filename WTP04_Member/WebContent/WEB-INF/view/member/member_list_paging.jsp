<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>

<script type="text/javascript" src="/WTP04_Member/script/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#tbody tr").on("click", function(){
		$("#tbody tr").css("background-color", "white");
		$(this).css("background-color", "silver");
	});
});
</script>

<style type="text/css">
table {
	width:700px;
    border-collapse: collapse;
}
table, td{
    border: 1px solid black;
}
td{
	padding: 5px;
}
thead{
	background-color: gray;
	color:white;
}
#paging a{
	cursor: pointer;
	text-decoration: none;
	color: black;
}
#paging{
	font-size: 19px;
}
#tbody{
	cursor: pointer;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/view/menu.jsp"/>

<h2>회원목록</h2> 	
<c:if test="${fn:length(requestScope.member_list) != 0 }"><!-- 회원정보가 있으면 -->
	<table width="700" border='1'>
		<thead id="thead">
			<tr>
				<td>ID</td>
				<td>Password</td>
				<td>이름</td>
				<td>이메일</td>
				<td>가입일자</td>
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach items="${requestScope.member_list }" var="member">
				<tr>
					<td>${member.id }</td>
					<td>${member.password}</td>
					<td>${member.name}</td>
					<td>${member.email}</td>
					<td>${member.joinDate}</td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
	
	<p id="paging">
		<!-- paging처리 -->
		<c:choose>
			<c:when test="${requestScope.bean.previousPageGroup}">
				<a href="/WTP04_Member/controller?command=memberListPaging&page=${requestScope.bean.startPageOfPageGroup-1}">◁</a>
			</c:when>
			<c:otherwise>◁</c:otherwise>
		</c:choose>
		
		<c:forEach var="page" begin="${requestScope.bean.startPageOfPageGroup}" end="${requestScope.bean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${page!=requestScope.bean.currentPage}">
					<a href="/WTP04_Member/controller?command=memberListPaging&page=${page}">&nbsp;${page} &nbsp;</a>
				</c:when>
				<c:otherwise>
					<font color="red">&nbsp;${page} &nbsp;</font>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${requestScope.bean.nextPageGroup}">
				<a href="/WTP04_Member/controller?command=memberListPaging&page=${requestScope.bean.endPageOfPageGroup+1}">▷</a>
			</c:when>
			<c:otherwise>▷</c:otherwise>
		</c:choose>
	</p>
</c:if>
</body>
</html>