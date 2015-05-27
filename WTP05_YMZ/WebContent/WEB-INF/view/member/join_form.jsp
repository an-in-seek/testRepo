<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
var idDup = false;//ID 중복여부 체크 - true : 사용할 수 있다(중복아님), false : 사용할 수 없다(중복아님) 
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
		
	});
});

</script>

<h2>가입양식</h2>

<form method="post" action="${initParam.rootPath }/member/join.do"  id="registerForm" enctype="multipart/form-data">
	<table style="width:600px">
		<tr>
			<td width="100">ID</td>
			<td>
				<input type="text" name="id" id='id'> <span id="dupMessageLayer"> </span><span class="errorMessage"><form:errors path="member.id"/></span>
				
			</td>
		</tr>
		<tr>
			<td>Password</td>
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
			<td>이메일</td>
			<td>
				<input type="text" id="email" name="email"> <span class="errorMessage"><form:errors path="member.email"/></span>
			</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>
				<input type="file" id="picture" name="picture">
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
