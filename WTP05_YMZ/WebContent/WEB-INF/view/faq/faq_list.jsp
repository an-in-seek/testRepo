<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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

<h2 align="center">고객센터(FAQ)</h2> 	
<c:if test="${fn:length(requestScope.faq_list) != 0 }">
	<table align="center" id="listTB" style="width:700px">
		<thead>
			<tr align="center">
				<td>NO</td>
				<td>제목</td>
				<td>내용</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.faq_list }" var="faq">
				<tr align="center">
					<td>${faq.number }</td>
					<td>${faq.title}</td>
					<td>${faq.content}</td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
</c:if>


