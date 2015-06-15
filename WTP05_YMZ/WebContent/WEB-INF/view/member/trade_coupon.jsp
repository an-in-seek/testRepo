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
$(document).load(function(){
	window.location.reload(true);
})
$(document).ready(function(){

var exMileage = $("#exMileage").val();	
document.getElementById('currentMileage').value=exMileage;
document.getElementById('count').value=0;
document.getElementById('result').value=exMileage
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
		if($("#count").val()==0){
			alert("금액을 입력해주십시오")
			return false
		}
			alert("고객님의 메일로 쿠폰이 전송되었습니다");
	})

});

</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
table{
	margin-left: auto;
	margin-right: auto;
}
#col{
	font-family: 'Hanna', sans-serif;	
	font-size : 15px;
	width:150px;
	background:#f0f0f0;
	font-color:#756C6C;
}
#col2{
	width:50px;
}
.id_btn{
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:9px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:55px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}

.nick_btn{
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:9px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:55px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}

.zip_btn{
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:9px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:100px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}
</style>

</head>
<body>

<h2 align="center">쿠폰교환</h2>
<form method="post" action="${initParam.rootPath }/member/updateMileage.do" id="modifyMileage"> 
	<table width="600" align="center" style="border: 1px solid lightgray">
		<tr>
			<td id="col" align="center">현재마일리지 </td>
			<td><input type="text" value="${requestScope.mileage }" id="currentMileage" readonly></td>
			<td><input type="hidden"  id="exMileage" value="${sessionScope.login_info.mileage }"></td>
		</tr>
		<tr>
			<td id="col" align="center">쿠폰금액 </td>
			<td><input type="text" name="price" id="price" value="0" readonly></td>
			<td>
				<c:if test="${requestScope.mileage>=1000 }">
					<input class="nick_btn" type="button" value="+" id="plus">		
				</c:if>
				<c:if test="${requestScope.mileage<1000 }">
					<input type="button" value="+" id="exBtn">
				</c:if>
				<input type="text" name="count" id="count" value="0" size="12">장
			</td>
		</tr>
		<tr>
			<td id="col" align="center">차액</td>
			<td><div id="difference"></div></td>
			<td></td>
		</tr>
		<tr>
			<td id="col" align="center">남은 마일리지</td>
			<td><input type="text" id="result" name="result"  readonly></td>
			<td></td>
		</tr>
	</table>
	<table width="600" align="center">
		<tr>
			<td align="center">
				<input type="submit" class="nick_btn" onclick="javascript:issueConfirm();" id ="submit" value="발급"> &nbsp;&nbsp;
				<input type="reset" class="nick_btn" id="reset" value="초기화">
			</td>
		</tr>
	</table>
</form>
</body>
</html>