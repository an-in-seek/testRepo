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
	$("#modifyForm").on("submit", function(){
		var flag = confirm("수정하시겠습니까?");
		if(!flag){
			return false;
		}else{
			confirm("수정이 완료 되었습니다.")
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
		
		if(!$("#phoneNo").val()){
			alert("전화번호를 입력하세요");
			$("#phoneNo").focus();
			return false;
		}
		if(!$("#email").val()){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
	
	});
});

</script>

<h2>회원정보 수정 폼</h2>

<form method="post" action="${initParam.rootPath }/member/modifyMemberInfo.do" id="modifyForm" 
	      enctype="multipart/form-data">
	<input type="hidden" name="id" value="${sessionScope.login_info.id }">
	<table style="width:500px">
		<tr>
			<td>ID</td>
			<td>${sessionScope.login_info.id }</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" id="nickname" name="nickname" value="${sessionScope.login_info.nickname }" id="nickname"><span class="errorMessage"><form:errors path="member.nickname"/></span>
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
				<input type="text" name="email"  value="${sessionScope.login_info.email }" id="email">  <span class="errorMessage"><form:errors path="member.email"/></span>
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
