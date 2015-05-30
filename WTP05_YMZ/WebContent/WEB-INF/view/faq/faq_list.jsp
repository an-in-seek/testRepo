<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath}/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath}/css/jquery-ui.css" rel="stylesheet"></link>	
<script type="text/javascript">

function removeFaq(number){
	alert(number+"번 게시물이 삭제되었습니다.");
	$("#number").val(number);
	document.getElementById("removeForm").submit();
} 

$(document).ready(function(){
	$("table#listTB tbody tr").on("click", function(){
		$("table#listTB tbody tr").css("background-color", "white");
		$(this).css("background-color", "lightgray");
		var number = $(this).find(":first-child").text();
		$.ajax({
			url:"${initParam.rootPath}/faq/findFaqByNo.do", //요청 url 설정
			data:{"number":number},
			type:"post", //HTTP 요청 방식(method)
			dataType:"json", //javascript객체로 변환해서 응답데이터를 전달.
			beforeSend:function(){
				//$("#product_info_layer").hide();
				//alert("확인");
				//return false;
			},
			success:function(obj){
				var content = obj.content;
				var txt = content;
				$("#table_info_layer").show();
				$("#product_info_layer").text(txt).show();
				//$("#product_info_layer").text("아이디 : "+obj.content);
			}
		});
	});
		
	$("#xButton").on("click", function(){
		$("#table_info_layer").hide();
		$("#product_info_layer").text(txt).hide();
	});
});
</script>

<style type="text/css">
table#listTB thead tr{
	font-weight: bold;
	background: silver;
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
#product_info_layer{
	display: none;/*최초로딩시에는 안보이도록 처리*/
}
#table_info_layer{
	display: none;/*최초로딩시에는 안보이도록 처리*/
}
</style>

<h2 align="center">고객센터(FAQ)</h2> 	

<%-- <c:if test="${fn:length(requestScope.faq_list) != 0 }"> --%>
<form id="removeForm" method=post action="removeFaq.do">
	<input type="hidden" id="number" name="number">
	<table id="listTB" style="width:700px" border="1" align="center">
		<thead>
			<tr align="center">
				<td>NO</td>
				<td>제목</td>
				<td width="100px">삭제(관리자)</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.faq_list }" var="qna">
				<tr align="center">
					<td id="td1">${qna.number}</td>
					<td id="td2" align="left">${qna.title}</td>
					<td align='center'>
					<input type="button"  value="삭제" onclick="removeFaq(${qna.number});">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>

<table>
		<tr height="10" align="center"></tr>
	</table>

	<table id="table_info_layer" style="width:700px" border="1" align="center">
		<tr>
			<td align='center' bgcolor='silver'><b>내용</b><button id="xButton">X</button></td>
		</tr>
		<tr height='10' align='center'>
			<td><div id="product_info_layer" align="center"></div></td>
		</tr>
	</table>
	
	<table>
		<tr height="10" align="center"></tr>
	</table>

	<form action="${initParam.rootPath }/faq/writeForm.do" method="post">
		<table style="width:700px" align="center">
			<tr>
				<td align="center"><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
<%-- </c:if> --%>

