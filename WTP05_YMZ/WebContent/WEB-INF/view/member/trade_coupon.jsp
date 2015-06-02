<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript">
var cnt = 0;
var num1 = 0;
var num2 = 0;
/**
 * 버튼 클릭시 쿠폰장수1개를 더하고 금액도 1000씩 더한다.
 * 현재마일리지와 쿠폰금액을 차감한 나머지 마일리지를 보여준다.
 */

$(document).ready(function(){
	$("#btn").on("click",function(){
		var num = null;
		if($("#price").val()==""){
			num = "0"
		}else{
			num = document.getElementById("price").value;
		}
		
		$.ajax({
			url:"${initParam.rootPath}/member/moneyCheck.do",
			data:{"num":num},
			dataType:"text",
			success:function(ret){
				document.getElementById("price").value = ret;
				document.getElementById("price").innerHTML = ret;
				var dif = document.getElementById("difference");
				dif.innerText=$("#currentMileage").val()+" - "+$("#price").val();
				cnt++;
				document.getElementById("count").innerText=cnt;
				
				var num1 = Number($("#price").val());
				var num2 = Number($("#currentMileage").val());
				var num3 = num2-num1;
				
				var result = document.getElementById("result");
				result.innerText=num3;
				
			}
		})
	})
});
</script>
</head>
<body>
<h2>쿠폰교환</h2>
<form> 
	<table width="800" align="center">
		<tr>
			<td  width="center">
				현재마일리지 
			</td>
			<td>
				<input type="text" value="${sessionScope.login_info.mileage}" id="currentMileage" readonly>
			</td>
		</tr>
		<tr>
			<td>
				쿠폰금액 :
			</td>
			<td>
				<input type="text" name="price" id="price" readonly>
			</td>
			<td>
   				<input type="button" value="+" id="btn">
			</td>
			<td width="100">
				<input type="text" name="count" id="count" readonly>
			</td>
			<td width="100">
			장
			</td>
		</tr>
		<tr>
			<td>
				차액
			</td>
			<td colspan="4">
				<div id="difference"></div>
			</td>
		</tr>
		<tr>
			<td>
				남은 마일리지
			</td>
			<td>
				<input type="text" id="result" readonly>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="발급">
			</td>
			<td>
				<input type="reset" value="초기화">			
			</td>
		</tr>
	</table>
</form>
</body>
</html>