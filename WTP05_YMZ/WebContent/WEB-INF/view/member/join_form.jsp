<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">

/*
 * 이메일주소 select 값 선택
 */


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
var idDup = false;//ID 중복여부 체크 - true : 사용할 수 있다(중복아님), false : 사용할 수 없다(중복아님)
var idExi = true;
var pwChe = false;
var idVal = false;	
var check = false;
var nickChe = false;
var idChe = false;
var pwVal = true;
var nameVal = true;
var nickVal = true;
var numVal = true;
var emailNameVal = true;
var emailAddressVal = true;
	
	

	//ID 유효성 체크
	
	$("#id").on("change",function(){
		idChe = false;
		var id = $("#id").val();
		var idSize = id.length;
		idDup = false;
		 // 아이디 검사
		if(idSize<5){
			$("#idsMessage").text("");
			$("#idMessage").text("ID는 5자리이상 입력하세요.");
			idVal = false;
			return false;
		}
		if(!/^[a-zA-Z0-9]{5,12}$/.test(id)){
			$("#idsMessage").text("");
			$("#idMessage").text("ID는 영문과 숫자로 입력해 주세요.");
			idVal = false;
			return false;
		}
		$('#idMessage').text("");	
		$("#idsMessage").text("사용가능한 ID입니다");
		idVal = true;
	});
	
	
	//password 유효성검사
	$("#password").on("change",function(){
		var password = $("#password").val();
		var pwSize = password.length;
		 // 아이디 검사
		if(pwSize<4){
			$("#pwsMessage").text("");
			$("#pwMessage").text("password는 4자리이상 입력하세요.");
			pwVal = false;
			return false;
		}
		if(!/^[a-zA-Z0-9]{4,24}$/.test(password)){
			$("#pwsMessage").text("");
			$("#pwMessage").text("password는 영문,숫자를 혼합하여 주세요.");
			pwVal = false;
			return false;
		}
		$('#pwMessage').text("");	
		$("#pwsMessage").text("사용가능한 password입니다");
		pwVal = true;
	});
	
	//이름 유효성 검사
	$("#name").on("change",function(){
		var name = $("#name").val();
		var nameSize = name.length;
		if(nameSize<2){
			$("#namesMessage").text("");
			$("#nameMessage").text("이름은 두자리이상 입력하세요.");
			nameVal = false;
			return false;
		}
		if(!/^[가-힣]{2,10}|^[a-zA-Z]{2,10}$/.test(name)){
			$("#namesMessage").text("");
			$("#nameMessage").text("이름은 영문또는 한글로 입력해 주세요.");
			nameVal = false;
			return false;
		}
		$('#nameMessage').text("");	
		$("#namesMessage").text("사용가능한 이름입니다");
		nameVal = true;
	});
	
	//닉네임 유효성 검사
	$("#nickname").on("change",function(){
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
		$("#nickMessage").text("");	
		$("#nicksMessage").text("사용가능한 닉네임입니다");
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
		alert(emailAddress);
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
	
	$("#idDup").on("click", function(){
		idDup = true;
		var id = $("#id").val();
		var idSize = $("#id").val().length;
		$.ajax({
			url:"${initParam.rootPath}/member/idDuplicateCheck.do",
			data:{"id":id},
			dataType:"text",
			beforeSend:function(){
				if(!id){//id에 입력된 값이 없으면 전송하지 않는다.
					return false;
				}
			},
			success:function(ret){
				if(ret=="false"){
					alert("중복된 아이디입니다.");
					document.getElementById('id').value= "";
					$("#idsMessage").text("");
					$("#idMessage").text("중복된 아이디입니다.");
					idChe = false;
				}else{
					alert("사용가능한 아이디입니다.");
					$("#idMessage").text("");
					$("#idsMessage").text("사용가능한 아이디입니다");
					idChe = true;
				}
			}
			
		})
	});
	
	/*
	 * 닉네임 중복확인
	 */
	$("#exNick").on("click",function(){
		check = true;
		var nickname = $("#nickname").val();
		$.ajax({
			url:"${initParam.rootPath}/member/nickExistCheck.do",
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
					alert("중복된 닉네임입니다.")
					document.getElementById('nickname').value= "";
					nickChe = false;
				}else{
					alert("사용가능한 닉네임입니다.")
					nickChe = true;
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
	
	//비밀번호 일치 확인
	$("#passwordCheck").on("change", function(){
		var passwordCh = $("#passwordCheck").val();
		var password = $("#password").val();
				if(passwordCh!=password){
					$("#pwMessageLayer").text("비밀번호가 일치하지 않습니다.");
					$("#pwMessageLayer").addClass("errorMessage");
					pwChe=false;
				}else{
					$("#pwMessageLayer").text("비밀번호가 일치합니다.");
					$("#pwMessageLayer").addClass("normalMessage");
					pwChe=true;
			}
	});
	
	//Validator 검사위해 주석처리
	$("#registerForm").on("submit", function(){
		var address = $("#address").val();
		//성별 체크
		var sexChe = $("input:radio[name='sex']:checked").val(); 
		//비밀번호 확인 체크
		var passwordCh = $("#passwordCheck").val();
		var password = $("#password").val();
		var pwSize = $("#password").val().length;
		if(passwordCh!=password){
			pwChe=false;
		}else{
			pwChe=true;
		}
	
		if(!pwVal){
			alert("비밀번호 양식이 맞지 않습니다");
			$("#password").focus();
			return false;
		}
		
		if(!nameVal){
			alert("이름 양식이 맞지 않습니다");
			$("#name").focus();
			return false;
		}
		
		if(!nickVal){
			alert("닉네임 양식이 맞지 않습니다");
			$("#nickname").focus();
			return false;
		}
		if(!numVal){
			alert("전화번호가 올바르지 않습니다");
			return false;
		}

		if(!$("#id").val()){
			alert("id를 입력하세요");
			$("#id").focus();
			return false;
		}
		
		if(!idVal){
			alert("아이디 양식이 맞지 않습니다");
			return false;
		}
		
		if(!idChe||!idDup){
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		
		if(!emailNameVal){
			alert("이메일의 양식이 맞지 않습니다.이");
			return false;
		}
		
		if(!emailAddressVal){
			alert("이메일의 양식이 맞지 않습니다.주소");
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
		
		if(!nickChe){
			alert("닉네임 중복체크를 해주십시오");
			$("#nickname").focus();
			return false;
		}
		
		if(!check){
			alert("닉네임 중복체크를 해주십시오");
			return false;
		}
		if(!$("#postcode1").val()){
			alert("우편번호를 입력하세요");
			return false;
		}
		if(!$("#postcode2").val()){
			alert("우편번호를 입력하세요");
			return false;
		}
		if(!$("#address").val()){
			alert("주소를 입력하세요");
			return false;
		}
		
		if(!$("#detailAddress").val()){
			alert("상세주소를 입력하세요");
			$("#detailAddress").focus();
			return false;
		}
		
		if(!$("#num1").val()){
			alert("전화번호를 입력하세요");
			$("#num1").focus();
			return false;
		}
		
		if(!$("#num2").val()){
			alert("전화번호를 입력하세요");
			$("#num2").focus();
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
		
		if(!sexChe){
			alert("성별은 필수입력사항입니다");
			return false;
		}
		
		if(!idExi){
			alert("잘못된 추천인입니다.")
			$("#recommend").focus();
			return false;
		}
		if(!pwChe){
			alert("비밀번호가 일치하지 않습니다")
			$("#passwordCheck").focus();
			return false;
		}
		
	})

})
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
div#table{
	padding: 20px;
	font-weight:bold;
	text-align:left;
	float:center;   /*왼쪽으로 띄움 */
}	
table{
	margin-left: auto;
	margin-right: auto;
}
#col{
	font-family:'Malgun Gothic', dotum;	
	font-size : 15px;
	width:150px;
	background:#f0f0f0;
}
#col2{
	width:10px;
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
	font-family:'Malgun Gothic', dotum;
	font-size:9px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:55px;
	text-decoration:none;
	text-align:center;
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
	font-family:'Malgun Gothic', dotum;
	font-size:9px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:55px;
	text-decoration:none;
	text-align:center;
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
	font-family:'Malgun Gothic', dotum;
	font-size:9px;
	font-weight:bold;
	font-style:normal;
	height:20px;
	width:100px;
	text-decoration:none;
	text-align:center;
}
</style>

<img src="${initParam.rootPath }/memberImage/header.png" id="header">

<div id="table" align="center">
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>
<form method="post" action="${initParam.rootPath }/member/join.do"  id="registerForm" enctype="multipart/form-data" >
	<table>
		<tr>
			<td id="col" align="center">ID</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="text" name="id" id='id' maxlength='11'> <span id="dupMessageLayer"> </span><span class="errorMessage"><form:errors path="member.id"/></span>
				<input type="button" class="id_btn" name="idDup" id="idDup" value="중복체크"><font color="red" size="1"><span  id="idMessage"> </span></font>
				<font color="blue" size="1"><span  id="idsMessage"></span></font>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">비밀번호</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="password" id="password" name="password" maxlength='24'><font color="red" size="1"><span id="pwMessage"> </span></font>
				<font color="blue" size="1"><span  id="pwsMessage"></span></font>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">비밀번호확인</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="password" id="passwordCheck" name="passwordCheck" maxlength='24'><font color="red" size="1"><span id="pwMessageLayer"> </span></font><span class="errorMessage"><form:errors path="member.password"/></span>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">이름</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="text" id="name" name="name" maxlength='10'><font color="red" size="1"><span id="nameMessage"></span></font>
				<font color="blue" size="1"><span  id="namesMessage"></span></font>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">닉네임</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="text" id="nickname" name="nickname"  maxlength='8'>
				<input type="button" class="nick_btn" id="exNick" name="exNick" value="중복체크">
				<font color="red" size="1"><span id="nickMessage"></span></font><span class="errorMessage"></span>
				<font color="blue" size="1"><span  id="nicksMessage"></span></font>
			</td>	
		</tr>
			<tr>
			<td id="col" align="center">생년월일</td>
			<td id="col2"></td>
			<td id="col3">
				<select name="year" id="year" class="input_text w76" style="vertical-align:middle">
			<option value="1930" >1930</option><option value="1931" >1931</option><option value="1932" >1932</option><option value=1933 >1933</option><option value=1934 >1934</option><option value=1935 >1935</option><option value=1936 >1936</option><option value=1937 >1937</option><option value=1938 >1938</option><option value=1939 >1939</option><option value=1940 >1940</option><option value=1941 >1941</option><option value=1942 >1942</option><option value=1943 >1943</option><option value=1944 >1944</option><option value=1945 >1945</option><option value=1946 >1946</option><option value=1947 >1947</option><option value=1948 >1948</option><option value=1949 >1949</option><option value=1950 >1950</option><option value=1951 >1951</option><option value=1952 >1952</option><option value=1953 >1953</option><option value=1954 >1954</option><option value=1955 >1955</option><option value=1956 >1956</option><option value=1957 >1957</option><option value=1958 >1958</option><option value=1959 >1959</option><option value=1960 >1960</option><option value=1961 >1961</option><option value=1962 >1962</option><option value=1963 >1963</option><option value=1964 >1964</option><option value=1965 >1965</option><option value=1966 >1966</option><option value=1967 >1967</option><option value=1968 >1968</option><option value=1969 >1969</option><option value=1970 >1970</option><option value=1971 >1971</option><option value=1972 >1972</option><option value=1973 >1973</option><option value=1974 >1974</option><option value=1975 >1975</option><option value=1976 >1976</option><option value=1977 >1977</option><option value=1978 >1978</option><option value=1979 >1979</option><option value=1980 selected>1980</option><option value=1981 >1981</option><option value=1982 >1982</option><option value=1983 >1983</option><option value=1984 >1984</option><option value=1985 >1985</option><option value=1986 >1986</option><option value=1987 >1987</option><option value=1988 >1988</option><option value=1989 >1989</option><option value=1990 >1990</option><option value=1991 >1991</option><option value=1992 >1992</option><option value=1993 >1993</option><option value=1994 >1994</option><option value=1995 >1995</option><option value=1996 >1996</option><option value=1997 >1997</option><option value=1998 >1998</option><option value=1999 >1999</option><option value=2000 >2000</option><option value=2001 >2001</option><option value=2002 >2002</option><option value=2003 >2003</option><option value=2004 >2004</option><option value=2005 >2005</option><option value=2006 >2006</option><option value=2007 >2007</option><option value=2008 >2008</option><option value=2009 >2009</option><option value=2010 >2010</option><option value=2011 >2011</option><option value=2012 >2012</option><option value=2013 >2013</option><option value=2014 >2014</option></select>
			년 
			<select name="month" id="month" class="input_text w60" style="vertical-align:middle">
			<option value="01" >01</option><option value=02 >02</option><option value=03 >03</option><option value=04 >04</option><option value=05 >05</option><option value=06 >06</option><option value=07 >07</option><option value=08 >08</option><option value=09 >09</option><option value=10 >10</option><option value=11 >11</option><option value=12 >12</option>			</select>
			월 
			<select name="day" id="day" class="input_text w60" style="vertical-align:middle">
			<option value="01" >01</option><option value=02 >02</option><option value=03 >03</option><option value=04 >04</option><option value=05 >05</option><option value=06 >06</option><option value=07 >07</option><option value=08 >08</option><option value=09 >09</option><option value=10 >10</option><option value=11 >11</option><option value=12 >12</option><option value=13 >13</option><option value=14 >14</option><option value=15 >15</option><option value=16 >16</option><option value=17 >17</option><option value=18 >18</option><option value=19 >19</option><option value=20 >20</option><option value=21 >21</option><option value=22 >22</option><option value=23 >23</option><option value=24 >24</option><option value=25 >25</option><option value=26 >26</option><option value=27 >27</option><option value=28 >28</option><option value=29 >29</option><option value=30 >30</option><option value=31 >31</option>			</select>
			일
			</td>	
		</tr>
			<tr>
			<td id="col" align="center">성별</td>
			<td id="col2"></td>
			<td id="col3">
			
	<!-- for='m':id가 m인 입력 태그에 대한 라벨, id속성-태그의 식별값을 지정 체크박스는 선택하지 않으면 전송하지 않는다. -->
				<label for="m"> 남성</label> <input type="radio" name="sex" value="b" id="m"><span class="errorMessage"><form:errors path="member.sex"></form:errors></span>	
				<label for="f"> 여성</label> <input type="radio" name="sex" value="g" id="f"><span class="errorMessage"><form:errors path="member.sex"></form:errors></span>
			</td>	
		</tr>
		<tr>
			<td id="col" align="center">우편번호</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="text" id="postcode1" name="postcode1"  style="width:50px;"  readonly>
				<input type="text" id="postcode2" name="postcode2"  style="width:50px;"  readonly>
				<input type="button" class="zip_btn" onclick="openDaumPostcode()" value="우편번호 찾기">
			</td>
		</tr>
		<tr>
			<td id="col" align="center">주소</td>
			<td id="col2"></td>
			<td id="col3"><input type="text" id="address" name="address"  style="width:400px;" readonly><span class="errorMessage"><form:errors path="member.address"></form:errors></span>
			</td>
		</tr>		
		<tr>
			<td id="col" align="center">상세주소</td>
			<td id="col2"></td>
			<td id="col3"><input type="text" id="detailAddress" name="detailAddress" maxlength='20' value="${requestScope.detailAddress }" style="width:400px;"><span class="errorMessage"><form:errors path="member.detailAddress"></form:errors></span>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">이메일</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="text" id="emailName" name="emailName" maxlength='11'>@<input type="text" id="emailAddress" name="emailAddress"  maxlength="11">
				<select name="selectEmail"  style="vertical-align:middle" id="selectEmail">
				<option>직접입력</option><option value="naver.com" >네이버</option><option value="daum.net" >다음</option><option value="nate.com" >네이트</option><option value="google.com" >구글</option><option value="yahoo.com" >야후</option></select>
				<font color="red" size="1"><span id="emailMessage"></span></font>
				<font color="blue" size="1"><span id="emailsMessage"></span></font>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">전화번호</td>
			<td id="col2"></td>
			<td id="col3">
				<select name="phoneCP" id="phoneCP" class="input_text w60" style="vertical-align:middle">
			<option value="010" >010</option><option value="011" >011</option><option value="017" >017</option><option value="018" >018</option><option value="019" >019</option></select>
			&nbsp;-&nbsp;<input type="text" id="num1" name="num1" maxlength='4' size="2" style="vertical-align:middle">&nbsp;&nbsp;<input type="text" id="num2" name="num2" size="2" maxlength='4'class="input_text w60" style="vertical-align:middle"> 
			<font color="red" size="1"><span id="numMessage"></span></font>
			<font color="blue" size="1"><span id="numsMessage"></span></font>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">좋아하는음식</td>
			<td id="col2"></td>
			<td id="col3">
				<c:forEach var="category" items="${map}"> 
					<label><input type="checkbox" name="favoriteFood" value="${category.key}">${category.value}</label>
				</c:forEach>

			</td>
		</tr>
		<tr>
			<td id="col" align="center">추천인</td>
			<td id="col2"></td>
			<td id="col3">
				<input type="text" name="recommend" id="recommend" maxlength='20' value="${requestScope.recommend }">
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="submit" class="nick_btn" value="가입">
				<input type="reset" class="nick_btn" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</div>
