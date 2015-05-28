<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath}/script/jquery-ui.js"></script>
<link type="text/css" href="${initParam.rootPath}/css/jquery-ui.css" rel="stylesheet"></link>	
<script type="text/javascript">
$(document).ready(function(){
	$("table#listTB tbody tr").on("mouseover", function(){
		$("table#listTB tbody tr").css("background-color", "white");
		$(this).css("background-color", "silver");
	});
	$("table#listTB tbody tr").on("click", function(){
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
				var before = "<table width='100%' border='1'><tr><td align='center' bgcolor='lightgray'><b>내용</b></td></tr><tr height='10' align='center'><td>";
				var after ="</td></tr></table>";
				var content = obj.content;
				var txt = before+content+after;
				$("#product_info_layer").html(txt).show(); 
				//$("#product_info_layer").text("아이디 : "+obj.content);
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
#product_info_layer{
	display: none;/*최초로딩시에는 안보이도록 처리*/
}
</style>

<h2 align="center">고객센터(FAQ)</h2> 	

<%-- <c:if test="${fn:length(requestScope.faq_list) != 0 }"> --%>
	<table align="center" id="listTB" style="width:700px" border="1">
		<thead>
			<tr align="center">
				<td>NO</td>
				<td>제목</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.faq_list }" var="qna">
				<tr align="center">
					<td>${qna.number }</td>
					<td>${qna.title}</td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
	
	<table width="100%" border="0">
		<tr height="10" align="center"></tr>
	</table>
	
	<div id="product_info_layer" align="center"></div>	
	
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
<%-- </c:if> --%>

