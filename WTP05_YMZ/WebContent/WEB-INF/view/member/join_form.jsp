<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
var idDup = false;//ID 중복여부 체크 - true : 사용할 수 있다(중복아님), false : 사용할 수 없다(중복아님)
var idExi = true;
/*
 * 다음api 주소찾기
 */ 
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
	
	//ID 중복 체크
	$("#id").on("keyup", function(){
		var id = this.value;
		$.ajax({
			url:"${initParam.rootPath}/member/idDuplicateCheck.do",
			data:{"id":id},
			dataType:"JSON",
			beforeSend:function(){
				if(!id){//id에 입력된 값이 없으면 전송하지 않는다.
					return false;
				}
			},
			success:function(ret){
				idDup = ret.result;
				if(!idDup){
					$("#dupMessageLayer").text("중복된 아이디 입니다.");
					$("#dupMessageLayer").addClass("errorMessage");
				}else{
					$("#dupMessageLayer").text("사용할 수 있는 아이디 입니다.");
					$("#dupMessageLayer").addClass("normalMessage");
				}
			}
			
		})
	});
	
	//ID 존재 유무 체크
	$("#recommend").on("keyup", function(){
		var recommend2 = this.value;
		
	
		$.ajax({
			url:"${initParam.rootPath}/member/idExistCheck.do",
			data:{"recommend2":recommend2},
			dataType:"text",
			success:function(ret2){
				if(ret2=="false"){
					idExi=false;
				}else{
					idExi=true;
				}
			}
		})
		
	});
	
	//Validator 검사위해 주석처리
	$("#registerForm").on("submit", function(){
		
		if(!$("#id").val()){
			alert("id를 입력하세요");
			$("#id").focus();
			return false;
		}
		
		if(!$("#password").val()){
			alert("password를 입력하세요");
			$("#password").focus();
			return false;
		}
		
		if(!$("#name").val()){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}

		if(!$("#nickname").val()){
			alert("닉네임을 입력하세요");
			$("#nickname").focus();
			return false;
		}
		
		if(!$("#birth").val()){
			alert("생일을 입력하세요");
			$("#birth").focus();
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
	
		if(!idDup){
			alert("중복된 아이디 입니다.");
			$("#id").focus();
			return false;
		}
		
		if(!idExi){
			alert("잘못된 추천인입니다.")
			$("#recommend").focus();
			return false;
		}
		
	})

})


</script>

<h2>회원가입</h2>

<form method="post" action="${initParam.rootPath }/member/join.do"  id="registerForm" enctype="multipart/form-data">
	<table style="width:500px">
		<tr>
			<td>ID</td>
			<td>
				<input type="text" name="id" id='id'> <span id="dupMessageLayer"> </span><span class="errorMessage"><form:errors path="member.id"/></span>
				
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" id="password" name="password"> <span class="errorMessage"><form:errors path="member.password"/></span>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" id="name" name="name"> <span class="errorMessage"><form:errors path="member.name"/></span>
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" id="nickname" name="nickname"><span class="errorMessage"><form:errors path="member.nickname"/></span>
			</td>	
		</tr>
			<tr>
			<td>생년월일</td>
			<td>
				<input type="text" id="birth" name="birth"><span class="errorMessage"><form:errors path="member.birth"></form:errors></span>
			</td>	
		</tr>
			<tr>
			<td>성별</td>
			<td>
	<!-- for='m':id가 m인 입력 태그에 대한 라벨, id속성-태그의 식별값을 지정 체크박스는 선택하지 않으면 전송하지 않는다. -->
				<label for="m"> 남성</label> <input type="radio" name="sex" value="b" id="m"><span class="errorMessage"><form:errors path="member.sex"></form:errors></span>	
				<label for="f"> 여성</label> <input type="radio" name="sex" value="g" id="f"><span class="errorMessage"><form:errors path="member.sex"></form:errors></span>
			</td>	
		</tr>
		<tr>
			<td align="center">우편번호</td>
			<td>
				<input type="text" id="postcode1" name="postcode1" value="" style="width:50px;" readonly>
				<input type="text" id="postcode2" name="postcode2" value="" style="width:50px;" readonly>
				<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기">
			</td>
		</tr>
		<tr>
			<td align="center">주소</td>
			<td><input type="text" id="address" name="address" style="width:400px;" readonly><span class="errorMessage"><form:errors path="member.address"></form:errors></span>
			</td>
		</tr>		
		<tr>
			<td align="center">상세주소</td>
			<td><input type="text" id="detailAddress" name="detailAddress" style="width:400px;"><span class="errorMessage"><form:errors path="member.detailAddress"></form:errors></span>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" id="email" name="email"> <span class="errorMessage"><form:errors path="member.email"/></span>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" id="phoneNo" name="phoneNo"> 
			</td>
		</tr>
		<tr>
			<td>좋아하는음식</td>
			<td>
				<label>한식<input type="checkbox" name="favoriteFood" value="korean"></label>
				<label>중식<input type="checkbox" name="favoriteFood" value="chinese"></label>
				<label>양식<input type="checkbox" name="favoriteFood" value="western"></label>
				<label>일식<input type="checkbox" name="favoriteFood" value="japanese"></label>
			</td>
		</tr>
		<tr>
			<td>추천인</td>
			<td>
				<input type="text" name="recommend" id="recommend">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="가입">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
