<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn").click(function() {
		$("#result").html("금액넣기");
	})
});


</script>
<body>

<h2>쿠폰교환</h2>
<form> 
	<table width="800" align="center">
		<tr>
			<td  width="center">
				현재마일리지 
			</td>
			<td>
				<fmt:formatNumber value="${sessionScope.login_info.mileage}" type="currency"></fmt:formatNumber>
			</td>
		</tr>
		<tr>
			<td>
				<div id="result"></div>
			</td>
			<td>
   				<input type="button" value="계산" id="btn">
				
			</td>
			<td>
				마일리지 :
			</td>
			<td>
				<input type="text" name="mileage" id="mileage">
			</td>
		</tr>
		<tr>
			<td>
				차액
			</td>
			<td>
				
			</td>
		</tr>
		<tr>
			<td>
				남은 마일리지
			</td>
			<td>
				
			</td>
		</tr>
		
	
	</table>

</form>