<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript"src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#listTB tbody tr").on("mouseover", function() {
			$("#listTB tbody tr").css("background-color", "white");
			$(this).css("background-color", "lightcyan");
		});
		
		$("#listTB tbody tr").on("click", function(){
			var reviewNo = $(this).find(":nth-child(3)").text();
			document.location.href="${initParam.rootPath }/review/reviewView.do?reviewNo="+reviewNo;
		});
		
	});
</script>

<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet" />
<style type="text/css">
#mainTable{
	font-family:'Malgun Gothic', dotum;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	padding: 20px;
	text-align:center;
	float:center;   /*왼쪽으로 띄움 */
}
.table{
	font-family:'Malgun Gothic', dotum;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	padding: 5px;
	text-align:center;
	float:center;   /*왼쪽으로 띄움 */
}
.listTB{
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	align:center;
	width:800px;
	border: 1;
}
.listTB thead tr {
	font-weight: bold;
	background: lightgray;
	border: 2px solid #B70000;
}
.listTB tbody tr{
	cursor: pointer;
	border-bottom: 1px solid black;
}
</style>

<table id="mainTable">
	<tr>
		<td>
			<%@include file="reported_bbs.jsp"%> 
		</td>
	</tr>
	<tr>
		<td>
			 <%@include file="reported_reply.jsp"%> 
		</td>
	</tr>
</table>
