<%@page import="com.ymz.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
/*
 * 이메일주소 select 값 선택
 */
function mailCheck(selectObj){ 
	document.getElementById('emailAddress').value=selectObj.value;
	if(selectObj.value==""){
		$("#emailAddress").focus();	
	}
}

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
	var emailNameEx = $("#email").val();
	var i =emailNameEx.indexOf("@");
	var e = emailNameEx.length;
	var emailName = emailNameEx.substring(0,i);
	var emailAddress = emailNameEx.substring(i+1,e);
	document.getElementById('emailName').value=emailName;
	document.getElementById('emailAddress').value=emailAddress;
	
	/*
	 * 닉네임 중복확인
	 */
	$("#exNick").on("click",function(){
		check = true;
		var nickname = $("#nickname").val();
		$.ajax({
			url:"${initParam.rootPath}/member/nickDuplicateCheck.do",
			data:{"nickname":nickname},
			dataType:"text",
			beforeSend:function(){
				if(!nickname){//id에 입력된 값이 없으면 전송하지 않는다.
					alert("닉네임을 입력해주세요")
					return false;
				}
			},
			success:function(ret){
				if(ret=="false"){
					$("#dupMessageLayer").text("중복된 닉네임입니다.");
					$("#dupMessageLayer").addClass("errorMessage");
					nickChe = false;
				}else{
					$("#dupMessageLayer").text("사용할 수 있는 닉네임입니다.");
					$("#dupMessageLayer").addClass("normalMessage");
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
			alert("전화번호를 입력하세요");
			$("#emailAddress").focus();
			return false;
		}
		
		if(!$("#phoneNo").val()){
			alert("이메일을 입력하세요");
			$("#phoneNo").focus();
			return false;
		}
		}
		alert("회원정보가 수정되었습니다.");
	});
})

</script>

<h2>회원정보 수정 폼</h2>
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>
<form method="post" action="${initParam.rootPath }/member/modifyMemberInfo.do" id="modifyForm" 
	      enctype="multipart/form-data">
	<input type="hidden" name="id" value="${sessionScope.login_info.id }">
	<table style="width:700px">
		<tr>
			<td>ID</td>
			<td>${sessionScope.login_info.id }</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" id="nickname" name="nickname" value="${sessionScope.login_info.nickname }">
				<input type="button" id="exNick" name="exNick" value="중복체크">
				<span id="dupMessageLayer"> </span><span class="errorMessage"></span>
			</td>
		</tr>
		<tr>
			<td align="center">우편번호</td>
			<td>
				<input type="text" id="postcode1" name="postcode1" value="${sessionScope.login_info.zipcode.substring(0,3) }" style="width:50px;" readonly>
				<input type="text" id="postcode2" name="postcode2" value="${sessionScope.login_info.zipcode.substring(4,7) }" style="width:50px;" readonly>
				<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기">
			</td>
		</tr>
		<tr>
			<td align="center">주소</td>
			<td><input type="text" id="address" name="address" style="width:400px;" value="${sessionScope.login_info.address }" readonly><span class="errorMessage"><form:errors path="member.address"></form:errors></span>
			</td>
		</tr>
		<tr>
			<td align="center">상세주소</td>
			<td><input type="text" id="detailAddress" name="detailAddress" style="width:400px;" value="${sessionScope.login_info.detailAddress }"><span class="errorMessage"><form:errors path="member.detailAddress"></form:errors></span>
			</td>
		</tr>	
		<tr>
			<td>이메일</td>
			<td>
				<input type="hidden" id="email" value="${sessionScope.login_info.email }">
				<input type="text" id="emailName" name="emailName" value="">@<input type="text" id="emailAddress" name="emailAddress">
				<select name="selectEmail"  style="vertical-align:middle" onChange="javascript:mailCheck(this)">
				<option value="">직접입력</option><option value="naver.com" >네이버</option><option value="daum.net" >다음</option><option value="nate.com" >네이트</option><option value="google.com" >구글</option><option value="yahoo.com" >야후</option></select>
				
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" id="phoneNo" name="phoneNo" value="${sessionScope.login_info.phoneNo }"><span class="errorMessage"><form:errors path="member.phoneNo"/></span> 
			</td>
		</tr>
		<tr> 
			<td colspan="2" >
				<input type="submit" value="수정">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
