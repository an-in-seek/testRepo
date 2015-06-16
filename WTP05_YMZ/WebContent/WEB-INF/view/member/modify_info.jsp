<%@page import="com.ymz.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
function openDaumPostcode(){
	new daum.Postcode({
		oncomplete:function(data){
			document.getElementById('postcode1').value=data.postcode1;
			document.getElementById('postcode2').value=data.postcode2;
			document.getElementById('address').value=data.address;
			document.getElementById('detailAddress').focus();
		}
	}).open();
}
$(document).ready(function(){
var check = false;
var nickChe = false;
var nameVal = true;
var nickVal = true;
var numVal = true;
var emailNameVal = true;
var emailAddressVal = true;	
	var emailNameEx = $("#email").val();
	var i =emailNameEx.indexOf("@");
	var e = emailNameEx.length;
	var emailName = emailNameEx.substring(0,i);
	var emailAddress = emailNameEx.substring(i+1,e);
	document.getElementById('emailName').value=emailName;
	document.getElementById('emailAddress').value=emailAddress;
	
	var phoneNo = $("#phoneNo").val();
	var phoneCp = phoneNo.substring(0,3);
	var num1 = phoneNo.substring(4,8);
	var num2 = phoneNo.substring(9,13);
	$("#phoneCP").val(phoneCp).attr("selected", "selected");
	document.getElementById('num1').value = num1;
	document.getElementById('num2').value = num2;
	
	//유효성검사
	$("#nickname").on("change",function(){
		check = false;
		var nickname = $("#nickname").val();
		nickChe = false;
		var nickSize = nickname.length;
		if(nickSize<2){
			$("#nicksMessage").text("");
			$("#nickMessage").text("닉네임은 두자리이상 입력하세요.");
			nickVal = false;
			return false;
		}
		if(!/^[가-힣a-zA-Z0-9]{2,8}$/.test(nickname)){
			$("#nicksMessage").text("");
			$("#nickMessage").text("닉네임은 영문과 한글로 입력해 주세요.");
			nickVal = false;
			return false;
		}
		
		$("#nicksMessage").text("");
		$("#nickMessage").text("중복검사 버튼을 눌러주세요."); 
		nickVal = true;
	
	});
	
	//이메일 유효성 검사
	$("#emailName").on("change",function(){
		
		var emailName = $("#emailName").val();
		var emailSize = emailName.length;
		if(emailSize<2||!/^[a-zA-Z0-9]{1,11}$/.test(emailName)){
			$("#emailsMessage").text("");
			$("#emailMessage").text("올바른 이메일 이름이 아닙니다");
			emailNameVal = false;
		}else{
		$("#emailMessage").text("");	
		emailNameVal = true;
		}
	});
	
	$("#selectEmail").on("change",function(){
		var selectEmail = document.getElementById('selectEmail').value;
		document.getElementById('emailAddress').value = selectEmail;
		var emailAddress = document.getElementById("#emailAddress");
		if(selectEmail=="naver.com"){
			$("input[name=emailAddress]").attr("readOnly",true);
			$("#emailMessage").text("");	
			emailAddressVal = true;
		}	
		if(selectEmail=="daum.net"){
			$("input[name=emailAddress]").attr("readOnly",true);
			$("#emailMessage").text("");	
			emailAddressVal = true;	
		}
		if(selectEmail=="google.com"){
			$("input[name=emailAddress]").attr("readOnly",true);
			$("#emailMessage").text("");	
			emailAddressVal = true;
		}
		if(selectEmail=="nate.com"){
			$("input[name=emailAddress]").attr("readOnly",true);
			$("#emailMessage").text("");	
			emailAddressVal = true;
		}
		if(selectEmail=="yahoo.com"){
			$("input[name=emailAddress]").attr("readOnly",true);
			$("#emailMessage").text("");	
			emailAddressVal = true;
		}
		
		if(selectEmail=="직접입력"){
			document.getElementById('emailAddress').value = "";
			$("input[name=emailAddress]").attr("readOnly",false);
			emailAddressVal = false;
		}
	});
	
	$("#emailAddress").on("change",function(){
		var selectEmail = document.getElementById('selectEmail').value;
		var emailAddress = $("#emailAddress").val();
		var addressSize = emailAddress.length;
		if(addressSize<1||!/^([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/.test(emailAddress)){
			$("#emailsMessage").text("");
			$("#emailMessage").text("올바른 이메일 이름이 아닙니다");
			emailAddressVal = false;
		}else{
			$("#emailMessage").text("");
			emailAddressVal = true;
		}
		
	})
	
	$("#num1").on("change",function(){
		var num1 = $("#num1").val();
		var num1Size = num1.length;
		if(!/^[0-9]{3,4}$/.test(num1)){
			$("#numsMessage").text("");
			$("#numMessage").text("잘못된 전화번호입니다");
			numVal = false;
			return false;
		}
		$('#numMessage').text("");	
		$("#numsMessage").text("");
		numVal = true;
	});
	
	$("#num2").on("change",function(){
		var num2 = $("#num2").val();
		var num2Size = num2.length;
		if(!/^[0-9]{3,4}$/.test(num2)){
			$("#numsMessage").text("");
			$("#numMessage").text("잘못된 전화번호입니다");
			numVal = false;
			return false;
		}
		$('#numMessage').text("");	
		$("#numsMessage").text("");
		numVal = true;
	});
	
	/*
	 * 닉네임 중복확인
	 */
	$("#exNick").on("click",function(){
		check = true;
		var nickname = $("#nickname").val();
		var niSize = $("#nickname").val().length;
		$.ajax({
			url:"${initParam.rootPath}/member/nickDuplicateCheck.do",
			data:{"nickname":nickname},
			dataType:"text",
			beforeSend:function(){
				if(!nickname){//id에 입력된 값이 없으면 전송하지 않는다.
					alert("닉네임을 입력해주세요")
					return false;
				}
				if(niSize<2){
					$("#nickMessage").text("닉네임은 두자리이상 입력하세요.");
					return false;
				}
				if(!/^[가-힣a-zA-Z0-9]{2,8}$/.test(nickname)){
					$("#nickMessage").text("닉네임 양식이 맞지 않습니다.");
					return false;
				}
			},
			success:function(ret){
				if(ret=="false"){
					alert("중복된 닉네임입니다.")
					document.getElementById('nickname').value= "";
					$("#nicksMessage").text("");
					$("#nickMessage").text("중복된 닉네임입니다");
					check = false;
					nickChe = false;
				}else{
					$("#nickMessage").text("");
					$("#nicksMessage").text("사용할 수 있는 닉네임입니다.");
					nickChe = true;
				}
			}
			
		})
	
	});
	
	$("#modifyForm").on("submit", function(){
		var flag = confirm("수정하시겠습니까?");
		if(!flag){
			alert("취소되었습니다");
			return false;
		}else{
			
		if(!emailNameVal){
			alert("이메일의 양식이 맞지 않습니다.이름");
			return false;
		}
			
		if(!emailAddressVal){
			alert("이메일의 양식이 맞지 않습니다.주소");
			return false;
		}	
		
		if(!nickVal){
			alert("닉네임 양식이 맞지 않습니다");
			$("#nickname").focus();
			return false;
		}
		
		if(!numVal){
			alert("전화번호가 올바르지 않습니다");
			document.getElementById('num1').value="";
			document.getElementById('num2').value="";
			return false;
		}
		
		if(!check){
			alert("중복체크를 해주십시오");
			return false
		}
		if($("#nickname").val()==""){
			alert("닉네임을 입력하세요");
			$("#nickname").focus();
			return false;
		}
		
		if(!$("#nickname").val()){
			alert("닉네임을 입력하세요");
			$("#nickname").focus();
			return false;
		}
		if(!$("#detailAddress").val()){
			alert("상세주소를 입력하세요");
			$("#detailAddress").focus();
			return false;
		}
		
		if(!$("#emailName").val()){
			alert("이메일을 입력하세요");
			$("#emailName").focus();
			return false;
		}
		if(!$("#emailAddress").val()){
			alert("이메일을 입력하세요");
			$("#emailAddress").focus();
			return false;
		}
		
		if(!$("#num1").val()){
			alert("전화번호를 입력하세요");
			$("#phoneNo").focus();
			return false;
		}
		if(!$("#num2").val()){
			alert("전화번호를 입력하세요");
			$("#phoneNo").focus();
			return false;
		}
		}
		alert("회원정보가 수정되었습니다.");
	});
})

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
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:65px;
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
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:65px;
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
	font-size:12px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:100px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}
</style>



<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>

<form method="post" action="${initParam.rootPath }/member/modifyMemberInfo.do" id="modifyForm"  enctype="multipart/form-data">
	<h2 align="center">회원정보 수정</h2>
	<hr noshade="noshade" width="100%" align="center">
	<input type="hidden" name="id" value="${sessionScope.login_info.id }">
	<table style="width:700px; border: 1px solid lightgray;">
		<tr>
			<td id="col" align="center">ID</td>
			<td id="col2"></td>
			<td>${sessionScope.login_info.id }</td>
			<td></td>
		</tr>
		<tr>
			<td id="col" align="center">닉네임</td>
			<td id="col2"></td>
			<td>
				<input type="text" id="nickname" name="nickname" maxlength='8' value="${sessionScope.login_info.nickname }">
				<input type="button" class="nick_btn" id="exNick" name="exNick" value="중복체크">
				<font color="red" size="1"><span id="nickMessage"></span></font><span class="errorMessage"></span>
				<font color="blue" size="1"><span  id="nicksMessage"></span></font>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="col" align="center">우편번호</td>
			<td id="col2"></td>
			<td>
				<input type="text" id="postcode1" name="postcode1" value="${sessionScope.login_info.zipcode.substring(0,3) }" style="width:50px;" readonly>
				<input type="text" id="postcode2" name="postcode2" value="${sessionScope.login_info.zipcode.substring(4,7) }" style="width:50px;" readonly>
				<input type="button" class="zip_btn" onclick="openDaumPostcode()" value="우편번호 찾기">
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="col" align="center">주소</td>
			<td id="col2"></td>
			<td><input type="text" id="address" name="address" style="width:400px;" value="${sessionScope.login_info.address }" readonly><span class="errorMessage"><form:errors path="member.address"></form:errors></span>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="col" align="center">상세주소</td>
			<td id="col2"></td>
			<td><input type="text" id="detailAddress" maxlength='20' name="detailAddress" style="width:400px;" value="${sessionScope.login_info.detailAddress }"><span class="errorMessage"><form:errors path="member.detailAddress"></form:errors></span>
			</td>
			<td></td>
		</tr>	
		<tr>
			<td id="col" align="center">이메일</td>
			<td id="col2"></td>
			<td>
				<input type="hidden" id="email" value="${sessionScope.login_info.email }">
				<input type="text" id="emailName" name="emailName" maxlength='11'>@<input type="text" id="emailAddress" name="emailAddress" maxlength='11'>
				<select name="selectEmail"  style="vertical-align:middle" id="selectEmail">
				<option>직접입력</option><option value="naver.com" >네이버</option><option value="daum.net" >다음</option><option value="nate.com" >네이트</option><option value="google.com" >구글</option><option value="yahoo.com" >야후</option></select>
				<font color="red" size="1"><span id="emailMessage"></span></font>
				<font color="blue" size="1"><span id="emailsMessage"></span></font>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="col" align="center">전화번호</td>
			<td id="col2"></td>
			<td>
				<input type="hidden" id="phoneNo" value="${sessionScope.login_info.phoneNo }">
				<select name="phoneCP" id="phoneCP" class="input_text w60" style="vertical-align:middle">
			<option value="010" >010</option><option value="011" >011</option><option value="017" >017</option><option value="018" >018</option><option value="019" >019</option></select>
			&nbsp;-&nbsp;<input type="text" id="num1" name="num1" maxlength='4' size="2" style="vertical-align:middle">&nbsp;&nbsp;<input type="text" id="num2" name="num2" size="2" maxlength='4'class="input_text w60" style="vertical-align:middle"> 
			<font color="red" size="1"><span id="numMessage"></span></font>
			<font color="blue" size="1"><span id="numsMessage"></span></font>
			</td>
			<td></td>
		</tr>
	</table>
	<table style="width:700px;">
		<tr> 
			<td align="center">
				<input type="submit" class="nick_btn" value="수정">
				<input type="reset" class="nick_btn" value="다시작성">
			</td>
		</tr>
	</table>
</form>
