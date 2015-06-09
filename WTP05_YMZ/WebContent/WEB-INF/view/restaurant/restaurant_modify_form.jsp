<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var pictureCount = 0;

var nameMessage = "상호명을 입력하세요";
var nameCheck = true;
var categoryCheck = true;
var phoneCheck1 = true;
var phoneCheck2 = true;
var phoneCheck3 = true;
var themeCheck = true;
var locationCheck = true;
var infoCheck = true;
var pictureCheck = true;

$(document).ready(function(){
	// 건물 바뀌면 해당건물의 층수만큼 층 select를 바꾼다
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
	
	// 소개 textarea 줄바꿈 변환
	$("#description").html("${requestScope.restaurant.description }".replace('<br>', '\n'));
	
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
					$("#pictureTemp td:nth-child("+pictureCount+")").html("<img class='uploaded' style='width:160px;height:140px' src='${initParam.rootPath}/tempPhoto/"+fileName+"'><input type='hidden' name='addedPicture' value='"+fileName+"'>");
				}
			}
		});
	});
	
	// 기존에 들어있는 사진갯수를 pictureCount에 저장한다
	pictureCount = ${fn:length(fn:split(requestScope.restaurant.pictureName,',')) };
	
	// 그림 클릭시 이벤트(클릭시 삭제)
	$("#pictureTemp").on("click","img.uploaded",function(){
		var src = $(this).prop("src");
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/removePictureTemp.do",
			type:"post",
			data:"fileName="+src
		});
		
		$(this).parent().remove();
		$("#pictureTemp").append("<td><img style='width:160px;height:140px' src='${initParam.rootPath}/uploadPhoto/noimage.jpg'></td>");
		pictureCount--;
		if(pictureCount==0){
			pictureCheck=false;
		}
	});
	
	///////////////////////////////////////////////////////////////////////
	
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
				}else if($("#restaurantName").val()=='${requestScope.restaurant.restaurantName}'){
					$("#nameMessage").text("");
					nameCheck = true;
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
	
	///////////////////////////////////////////////////////////////////////
	
	$("#modifyForm").on("submit",function(){
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
		$("#modifyForm").append("<input type='hidden' name='phoneNo' value='"+phone+"'>");
		$("#modifyForm").append("<input type='hidden' name='restaurantNo' value='${requestScope.restaurant.restaurantNo}'>");
		$("#description").val($("#description").val().replace(/\n/g, '<br>'));
	});
	
	$("#btn_cancel").on("click",function(){
		history.back();
	});
});

</script>
</head>
<body>
<form id="modifyForm" action="${initParam.rootPath }/restaurant/login/admin/modifyRestaurant.do" method="post" enctype="multipart/form-data">
<p><font size="5"><b>기본정보</b></font></p>
<table>
<tr>
	<td>상호명</td>
	<td>
		<input type="text" id="restaurantName" name="restaurantName" maxlength="10" value="${requestScope.restaurant.restaurantName }">
		<font color="red"><span id="nameMessage"></span></font>
	</td>
</tr>
<tr>
	<td>업종</td>
	<td>
		<select id="category" name="category">
			<option value="default">업종을 선택하세요</option>
			<c:forEach items="${requestScope.categories }" var="category">
				<c:choose>
					<c:when test="${category.categoryName==requestScope.restaurant.category }">
						<option value="${category.categoryId }" selected="selected">${category.categoryName }</option>
					</c:when>
					<c:otherwise>
						<option value="${category.categoryId }">${category.categoryName }</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
		<font color="red"><span id="categoryMessage"></span></font>
	</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>
		<input type="text" id="phoneNo1" name="phoneNo1" maxlength="3" style="width: 50px" value="${fn:split(requestScope.restaurant.phoneNo,'-')[0] }"> -
		<input type="text" id="phoneNo2" name="phoneNo2" maxlength="4" style="width: 50px" value="${fn:split(requestScope.restaurant.phoneNo,'-')[1] }"> -
		<input type="text" id="phoneNo3" name="phoneNo3" maxlength="4" style="width: 50px" value="${fn:split(requestScope.restaurant.phoneNo,'-')[2] }">
		<font color="red"><span id="phoneMessage"></span></font>
	</td>
</tr>
<tr>
	<td>테마</td>
	<td>
		<c:forEach items="${requestScope.themes }" var="theme">
			<c:choose>
				<c:when test="${fn:contains(requestScope.restaurant.theme, theme.categoryName) }">
					<label><input type="checkbox" name="theme" value="${theme.categoryId }" checked="checked">${theme.categoryName }</label>
				</c:when>
				<c:otherwise>
					<label><input type="checkbox" name="theme" value="${theme.categoryId }">${theme.categoryName }</label>
				</c:otherwise>
			</c:choose>
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
				<c:choose>
					<c:when test="${requestScope.currentBuildingName==buildingName }">
						<option selected="selected">${buildingName }</option>
					</c:when>
					<c:otherwise>
						<option>${buildingName }</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
		<select id="floor" name="floor">
			<option value="default">층을 선택하세요</option>
			<c:forEach items="${requestScope.floors }" var="floor">
				<c:choose>
					<c:when test="${requestScope.currentFloor==floor }">
						<option selected="selected">${floor }</option>
					</c:when>
					<c:otherwise>
						<option>${floor }</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
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

<p><font size="5"><b>사진첨부</b></font>&nbsp;&nbsp;(최대 5장 첨부 가능, 첨부된 사진 클릭시 첨부 취소)
<span style="position:absolute;width:100px;height:30px;overflow:hidden;margin-left:270px;margin-top:4px;">
	<input type="button" value="사진 선택" style="width:100px;height:30px;position:absolute;top:0px;background-color:gray;border-color:gray;color:white;font-weight:bold;"/>
	<input type="file" id="addPicture" name="addPicture" style="font-size:45px;position:absolute;right:0px;top:0px;cursor:pointer;"/>
</span>
<font color="red"><span id="pictureMessage"></span></font></p>
<table id="picture_table">
<tr id="pictureTemp">
<c:forEach items="${fn:split(requestScope.restaurant.pictureName,',') }" var="picture">
	<td><img class="uploaded" style="width:160px;height:140px;" src="${initParam.rootPath }/uploadPhoto/${picture}"><input type="hidden" name="addedPicture" value="${picture }"></td>
</c:forEach>
<c:forEach begin="${fn:length(fn:split(requestScope.restaurant.pictureName,','))+1 }" end="5">
<td><img style='width:160px;height:140px' src='${initParam.rootPath}/uploadPhoto/noimage.jpg'></td>
</c:forEach>
</tr>
</table>

<hr>

<p><font size="5"><b>메뉴</b></font>&nbsp;&nbsp;(최대 10개 등록 가능)</p>
<table style="width:100%;">
<thead>
<tr align="center">
<td>메뉴명</td>
<td>가격</td>
<td>설명</td>
<td></td>
</tr>
</thead>
<tbody id="menu_table">
<c:forEach items="${requestScope.menus }" var="menu">
<tr>
	<td><input type="text" name="foodName" maxlength="10" value="${menu.foodName }"></td>
	<td><input type="number" name="foodPrice" min="0" max="99999999" value="${menu.foodPrice }">원</td>
	<td><input type="text" name="foodDescription" maxlength="30" style="width:300px" value="${menu.foodDescription }"></td>
</tr>
</c:forEach>
<c:forEach begin="${fn:length(requestScope.menus)+1 }" end="10">
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