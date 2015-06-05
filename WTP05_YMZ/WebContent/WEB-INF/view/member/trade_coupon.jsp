<%@page import="com.ymz.member.vo.Member"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
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


/**
 * 버튼 클릭시 쿠폰장수1개를 더하고 금액도 1000씩 더한다.
 * 현재마일리지와 쿠폰금액을 차감한 나머지 마일리지를 보여준다.
 */

$(document).ready(function(){
	var cnt = 0;
	var num1 = 0;
	var num2 = 0;
	var check = false;
	$("#reset").on("click",function(){
		if(cnt!=0){
			return cnt=0;
		}
	})
	$("#exBtn").on("click",function(){
		alert("마일리지가 부족합니다");
	})

	$("#plus").on("click",function(){
		var result = Number($("#result").val());
			check = true;
		var num = null;
			num = document.getElementById("price").value;
		$.ajax({
			url:"${initParam.rootPath}/member/moneyCheck.do",
			data:{"num":num},
			dataType:"text",
			beforeSend:function(){
			if(result<1000){
				return false;
			}	
			},
			success:function(ret){
			
				document.getElementById("price").value = ret;
				var dif = document.getElementById("difference");
				dif.innerText=$("#currentMileage").val()+" - "+$("#price").val();
				cnt++;
				document.getElementById("count").value = cnt;
				var num1 = Number($("#price").val());
				var num2 = Number($("#currentMileage").val());
				num3 = num2-num1;
				if(num3<0){
					alert("마일리지가 부족합니다");
					return false;
				}
				var result = document.getElementById("result");
				result.value = num3;
			}
		})
	});
	$("#modifyMileage").on("submit",function(){
		var flag = confirm("확인을 누르시면 마일리지가 차감되고 쿠폰이 발급됩니다");
		if(!flag){
			alert("취소 되었습니다");
			return false;
		}else{
			if(!check){
				alert("금액을 입력해주십시오");
				return false;
			}
		}
			alert("고객님의 메일로 쿠폰이 전송되었습니다");
	})

});

</script>
</head>
<body>

<h2 align="center">쿠폰교환</h2>
<form method="post" action="${initParam.rootPath }/member/updateMileage.do" id="modifyMileage"> 
	<table width="800" align="center">
		<tr>
			<td  width="center">
				현재마일리지 
			</td>
			<td>
				<input type="text" value="${requestScope.mileage }" id="currentMileage" readonly>
			</td>
		</tr>
		<tr>
			<td>
				쿠폰금액 :
			</td>
			<td>
				<input type="text" name="price" id="price" value="0" readonly>
			</td>
			<c:if test="${requestScope.mileage>=1000 }">
					<td><input type="button" value="+" id="plus"></td>
					
			</c:if>
			<c:if test="${requestScope.mileage<1000 }">
					<td><input type="button" value="+" id="exBtn"></td>
			</c:if>
			<td width="100">
				<input type="text" name="count" id="count" value="0" readonly>
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
			<td id="ex">
				<input type="text" id="result" name="result" value="${requestScope.mileage }" readonly>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" onclick="javascript:issueConfirm();" id ="submit" value="발급">
			</td>
			<td>
				<input type="reset" id="reset" value="초기화">			
			</td>
		</tr>
	</table>
</form>
</body>
</html>