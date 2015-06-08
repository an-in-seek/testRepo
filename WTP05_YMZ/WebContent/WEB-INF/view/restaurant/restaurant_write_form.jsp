<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var pictureCount = 0;

var nameMessage = "상호명을 입력하세요";
var nameCheck = false;
var categoryCheck = false;
var phoneCheck1 = false;
var phoneCheck2 = false;
var phoneCheck3 = false;
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
		
		if(!nameCheck||!categoryCheck||!phoneCheck1||!phoneCheck2||!phoneCheck3||!themeCheck||!locationCheck||!infoCheck||!pictureCheck){
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
		
		var phone = $("#phoneNo1").val()+"-"+$("#phoneNo2").val()+"-"+$("#phoneNo3").val();
		$("#regForm").append("<input type='hidden' name='phoneNo' value='"+phone+"'>");
		
		$("#description").val($("#description").val().replace(/\n/g, '<br>'));
	});
	////////////////////////////////////////
	
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
	
	// 사진첨부버튼 클릭 이벤트
	$("#addPicture").on("click",function(){
		if(pictureCount==5){
			alert("사진은 최대 5장까지 첨부 가능합니다");
			return false;
		}
	});
	
	// 사진이 추가될때 이벤트
	$("#addPicture").on("change",function(){
		var formData = new FormData();
		formData.append("picture",$(this)[0].files[0]);
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/addPictureTemp.do",
			processData:false,
			contentType:false,
			data:formData,
			type:"post",
			success:function(fileName){
				if(fileName){
					pictureCount++;
					if(pictureCount==1){
						pictureCheck=true;
						$("#pictureMessage").text("");
					}
					$("#pictureTemp td:nth-child("+pictureCount+")").html("<img style='width:160px;height:140px' src='${initParam.rootPath}/tempPhoto/"+fileName+"'><input type='hidden' name='addedPicture' value='"+fileName+"'>");
				}
			}
		});
	});
	
	// 그림 클릭시 이벤트(클릭시 삭제)
	$("#pictureTemp").on("click","img",function(){
		var src = $(this).prop("src");
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/removePictureTemp.do",
			type:"post",
			data:"fileName="+src
		});
		
		$(this).parent().remove();
		$("#pictureTemp").append("<td></td>");
		pictureCount--;
		if(pictureCount==0){
			pictureCheck=false;
		}
	});
});
</script>
</head>
<body>
<form id="regForm" action="${initParam.rootPath }/restaurant/login/admin/addNewRestaurant.do" method="post" enctype="multipart/form-data">
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
			<c:forEach items="${requestScope.categories }" var="category">
				<option value="${category.categoryId }">${category.categoryName }</option>
			</c:forEach>
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
	<td>테마</td>
	<td>
		<c:forEach items="${requestScope.themes }" var="theme">
			<label><input type="checkbox" name="theme" value="${theme.categoryId }">${theme.categoryName }</label>
		</c:forEach>
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
<span style="position:absolute;width:100px;height:30px;overflow:hidden;margin-left:15px;margin-top:3px;">
	<input type="button" value="사진 선택" style="width:100px;height:30px;position:absolute;top:0px;background-color:#33BB00;color:#FFFFFF;border-style:solid;"/>
	<input type="file" id="addPicture" name="addPicture" style="font-size:45px;position:absolute;right:0px;top:0px;cursor:pointer;"/>
</span>
<font color="red"><span id="pictureMessage"></span></font></p>
<table id="picture_table">
<tr id="pictureTemp">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
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