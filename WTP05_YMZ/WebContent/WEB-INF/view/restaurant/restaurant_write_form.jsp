<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var pic_count = 1;
var menu_count = 1;

var nameMessage = "상호명을 입력하세요";
var nameCheck = false;
var categoryCheck = false;
var phoneCheck1 = false;
var phoneCheck2 = false;
var phoneCheck3 = false;
var addressCheck = false;
var themeCheck = false;
var locationCheck = false;
var infoCheck = false;
var pictureCheck = false;

$(document).ready(function(){
	$("#restaurantName").on("blur",function(){
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/checkName.do",
			type:"post",
			data:"name="+$("#restaurantName").val(),
			dataType:"text",
			beforeSend:function(){
				if($("#restaurantName").val().trim()==""){
					nameMessage = "상호명을 입력하세요";
					nameCheck = false;
					return false;
				}
			},
			success:function(check){
				if(eval(check)){
					$("#nameMessage").text("");
					nameCheck = true;
				}else{
					nameMessage = "이미 존재하는 상호명입니다";
					$("#nameMessage").text(nameMessage);
					nameCheck = false;
				}
			}
		});
	});
	
	$("#category").on("change",function(){
		if($(this).val()!="default"){
			categoryCheck = true;
			$("#categoryMessage").text("");
		}else{
			categoryCheck = false;
		}
	});
	
	$("#phoneNo1").on("blur",function(){
		if($(this).val().trim()!=""){
			phoneCheck1 = true;
			if(phoneCheck1&&phoneCheck2&&phoneCheck3){
				$("#phoneMessage").text("");
			}
		}else{
			phoneCheck1 = false;
		}
	});
	$("#phoneNo2").on("blur",function(){
		if($(this).val().trim()!=""){
			phoneCheck2 = true;
			if(phoneCheck1&&phoneCheck2&&phoneCheck3){
				$("#phoneMessage").text("");
			}
		}else{
			phoneCheck2 = false;
		}
	});
	$("#phoneNo3").on("blur",function(){
		if($(this).val().trim()!=""){
			phoneCheck3 = true;
			if(phoneCheck1&&phoneCheck2&&phoneCheck3){
				$("#phoneMessage").text("");
			}
		}else{
			phoneCheck3 = false;
		}
	});
	
	$("#address").on("blur",function(){
		if($(this).val().trim()!=""){
			addressCheck = true;
			$("#addressMessage").text("");
		}else{
			addressCheck = false;
		}
	});
	
	$("input[type=checkbox]").on("click",function(){
		if($("input[type=checkbox]:checked").length>0){
			themeCheck = true;
			$("#themeMessage").text("");
		}else{
			themeCheck = false;
		}
	});
	
	$("#building").on("change",function(){
		locationCheck = false;
	});
	$("#floor").on("change",function(){
		if($(this).val()!="default"){
			locationCheck = true;
			$("#locationMessage").text("");
		}else{
			locationCheck = false;
		}
	});
	
	$("#description").on("blur",function(){
		if($(this).val().trim()!=""){
			infoCheck = true;
			$("#infoMessage").text("");
		}else{
			infoCheck = false;
		}
	});
	
	$("#picture_table").on("change","[name=pictureName]",function(){
		pictureCheck = false;
		for(var i=1; i<$("#picture_table input[name=pictureName]").length+1; i++){
			if($("#picture_table tr:nth-child("+i+") input[name=pictureName]").val()!=""){
				pictureCheck = true;
				$("#pictureMessage").text("");
				break;
			}
		}
	});
	////////////////////////////////////////
	$("#regForm").on("submit",function(){
		if(!nameCheck){
			$("#nameMessage").text(nameMessage);
		}
		if(!categoryCheck){
			$("#categoryMessage").text("업종을 선택하세요");
		}
		if(!(phoneCheck1&&phoneCheck2&&phoneCheck3)){
			$("#phoneMessage").text("전화번호를 입력하세요");
		}
		if(!addressCheck){
			$("#addressMessage").text("주소를 입력하세요");
		}
		if(!themeCheck){
			$("#themeMessage").text("테마를 1개 이상 선택하세요");
		}
		if(!locationCheck){
			$("#locationMessage").text("위치를 선택하세요");
		}
		if(!infoCheck){
			$("#infoMessage").text("소개를 입력하세요");
		}
		if(!pictureCheck){
			$("#pictureMessage").text("사진을 한장 이상 등록하세요");
		}
		
		if(!nameCheck||!categoryCheck||!phoneCheck1||!phoneCheck2||!phoneCheck3||!addressCheck||!themeCheck||!locationCheck||!infoCheck||!pictureCheck){
			return false;
		}
		
		// 메뉴가 있으면 반드시 가격이 있고, 가격이 있으면 반드시 메뉴가 있게하라
		for(var i=1;i<$("#menu_table tr").length+1;i++){
			if($("#menu_table tr:nth-child("+i+") input[name=foodName]").val()!=""){
				if($("#menu_table tr:nth-child("+i+") input[name=foodPrice]").val()==""){
					$("#menu_table tr:nth-child("+i+") input[name=foodPrice]").focus();
					return false;
				}
			}
			if($("#menu_table tr:nth-child("+i+") input[name=foodPrice]").val()!=""){
				if($("#menu_table tr:nth-child("+i+") input[name=foodName]").val()==""){
					$("#menu_table tr:nth-child("+i+") input[name=foodName]").focus();
					return false;
				}
			}
		}
	});
	////////////////////////////////////////
	
	$("#picture_table").on("click","#picture_add",function(){
		if(pic_count<5){
			$("#picture_table").append("<tr><td><input type='file' name='pictureName'></td><td><button id='picture_add'>＋</button> <button id='picture_del'>－</button></td></tr>");
			$("#picture_table tr:nth-child("+pic_count+") td:last-child").html("");
			pic_count++;
		}else{
			alert("사진은 최대 5장까지 첨부할 수 있습니다");
			return false;
		}
	});
	
	$("#picture_table").on("click","#picture_del",function(){
		if(pic_count>1){
			$("#picture_table tr:last-child").remove();
			$("#picture_table tr:nth-child("+(pic_count-1)+") td:last-child").html("<button id='picture_add'>＋</button> <button id='picture_del'>－</button>");
			pic_count--;
		}else{
			return false;
		}
		
		var count = 0;
		for(var i=1; i<$("#picture_table input[name=pictureName]").length+1; i++){
			if($("#picture_table tr:nth-child("+i+") input[name=pictureName]").val()!=""){
				count++;
				break;
			}
		}
		if(count==0){
			pictureCheck = false;
		}
	});
	
	$("#menu_table").on("click","#menu_add",function(){
		if(menu_count<10){
			$("#menu_table").append("<tr><td><input type='text' name='foodName' maxlength='10'></td><td><input type='text' name='foodPrice' maxlength='10'>원</td><td><input type='text' name='foodDescription' style='width:300px'></td><td><button id='menu_add'>＋</button> <button id='menu_del'>－</button></td></tr>");
			$("#menu_table tr:nth-child("+menu_count+") td:last-child").html("");
			menu_count++;
		}else{
			alert("메뉴는 최대 10개까지 추가할 수 있습니다");
			return false;
		}
	});
	
	$("#menu_table").on("click","#menu_del",function(){
		if(menu_count>1){
			$("#menu_table tr:last-child").remove();
			$("#menu_table tr:nth-child("+(menu_count-1)+") td:last-child").html("<button id='menu_add'>＋</button> <button id='menu_del'>－</button>");
			menu_count--;
		}else{
			return false;
		}
	});
	
	$("#btn_cancel").on("click",function(){
		history.back();
	});
	/////////////////////////////////////////////////////////////
	$("#building").on("change",function(){
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/getFloorsByBuildingName.do",
			type:"post",
			data:"buildingName="+$("#building").val(),
			dataType:"json",
			beforeSend:function(){
				if($("#building").val()=="default"){
					$("#floor").html("<option value='default'>층을 선택하세요</option>");
					return false;
				}
			},
			success:function(floors){
				var temp = "<option value='default'>층을 선택하세요</option>";
				for(var i=0; i<floors.length; i++) {
					temp = temp+"<option>"+floors[i]+"</option>";
				}
				$("#floor").html(temp);
			}
		});
	});
});
</script>
</head>
<body>
<form id="regForm" action="${initParam.rootPath }/restaurant/addNewRestaurant.do" method="post" enctype="multipart/form-data">
<p><font size="5"><b>기본정보</b></font></p>
<table>
<tr>
	<td>상호명</td>
	<td>
		<input type="text" id="restaurantName" name="restaurantName" maxlength="10">
		<font color="red"><span id="nameMessage"></span></font>
	</td>
</tr>
<tr>
	<td>업종</td>
	<td>
		<select id="category" name="category">
			<option value="default">업종을 선택하세요</option>
			<option>한식</option>
			<option>양식</option>
			<option>중식</option>
			<option>일식</option>
		</select>
		<font color="red"><span id="categoryMessage"></span></font>
	</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>
		<input type="text" id="phoneNo1" name="phoneNo1" maxlength="3" style="width: 50px"> -
		<input type="text" id="phoneNo2" name="phoneNo2" maxlength="4" style="width: 50px"> -
		<input type="text" id="phoneNo3" name="phoneNo3" maxlength="4" style="width: 50px">
		<font color="red"><span id="phoneMessage"></span></font>
	</td>
</tr>
<tr>
	<td>주소</td>
	<td>
		<input type="text" id="address" name="address" style="width:500px">
		<font color="red"><span id="addressMessage"></span></font>
	</td>
</tr>
<tr>
	<td>테마</td>
	<td>
		<label><input type="checkbox" name="theme" value="가족">가족</label>
		<label><input type="checkbox" name="theme" value="연인">연인</label>
		<label><input type="checkbox" name="theme" value="친구">친구</label>
		<label><input type="checkbox" name="theme" value="회식">회식</label>
		<font color="red"><span id="themeMessage"></span></font>
	</td>
</tr>
<tr>
	<td>위치</td>
	<td>
		<select id="building" name="building">
			<option value="default">건물을 선택하세요</option>
			<c:forEach items="${requestScope.buildingNames }" var="buildingName">
				<option>${buildingName }</option>
			</c:forEach>
		</select>
		<select id="floor" name="floor">
			<option value="default">층을 선택하세요</option>
		</select>
		<font color="red"><span id="locationMessage"></span></font>
	</td>
</tr>
<tr>
	<td>소개</td>
	<td>
		<textarea id="description" name="description" style="width:500px;height:100px"></textarea>
		<font color="red"><span id="infoMessage"></span></font>
	</td>
</tr>
</table>

<hr>

<p><font size="5"><b>사진첨부</b></font>&nbsp;&nbsp;(최대 5장 첨부 가능)
<font color="red"><span id="pictureMessage"></span></font></p>
<table id="picture_table">
<tr>
	<td><input type="file" name="pictureName"></td>
	<td>
		<button id="picture_add">＋</button>
		<button id="picture_del">－</button>
	</td>
</tr>
</table>

<hr>

<p><font size="5"><b>메뉴</b></font>&nbsp;&nbsp;(최대 10개 등록 가능)</p>
<table>
<thead>
<tr align="center">
<td>메뉴명</td>
<td>가격</td>
<td>설명</td>
<td></td>
</tr>
</thead>
<tbody id="menu_table">
<c:forEach begin="1" end="10">
<tr>
	<td><input type="text" name="foodName" maxlength="10"></td>
	<td><input type="number" name="foodPrice" min="0" max="99999999">원</td>
	<td><input type="text" name="foodDescription" maxlength="30" style="width:300px"></td>
</tr>
</c:forEach>
</tbody>
</table>
<hr>
<p align="center">
<input type="submit" value="등록" style="width:100px;height:50px;">
<button id="btn_cancel" style="width:100px;height:50px;">취소</button>
</p>
</form>
</body>
</html>