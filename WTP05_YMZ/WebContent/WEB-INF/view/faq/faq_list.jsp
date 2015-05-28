<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />	
<script type="text/javascript">
var state = false;
$(document).ready(function(){
	$("table#listTB tbody tr").on("mouseover", function(){
		$("table#listTB tbody tr").css("background-color", "white");
		$(this).css("background-color", "silver");
	});
	
	$("table#listTB tbody tr").on("click", function(){
		var id = this.value;
		$.ajax({
			url:"${initParam.rootPath}/member/idDuplicateCheck.do",
			data:{"id":id},
			dataType:"JSON",
			beforeSend:function(){
				$("#tr1").hide();
			},
			success:function(obj){
				if(obj != null){
				var txt = obj.productInfo;
				$("#product_info_layer").html(txt).show();
				}
			}
		})
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
	<table align="center" id="listTB" style="width:700px" border="1">
		<thead>
			<tr align="center">
				<td>NO</td>
				<td>제목</td>
				<td>내용</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.faq_list }" var="qna">
				<tr align="center">
					<td>${qna.number }</td>
					<td>${qna.title}</td>
					<td>${qna.content}</td>
				</tr> 
				
<!-- 				<tr id="tr1">
					<td></td>
				</tr> -->
				
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" border="0">
		<tr height="10" align="center"></tr>
	</table>

	<form action="${initParam.rootPath }/faq/writeForm.do" method="post">
		<table width="100%" border="0">
			<tr>
				<td align="center"><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</c:if>

