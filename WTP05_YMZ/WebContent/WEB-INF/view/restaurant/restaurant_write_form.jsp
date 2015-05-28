<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var pic_count = 1;
var menu_count = 1;
$(document).ready(function(){	
	$("#picture_table").on("click","#picture_add",function(){
		if(pic_count<5){
			$("#picture_table").append("<tr><td><input type='file' name='pictureName'></td><td><button id='picture_add'>＋</button><button id='picture_del'>－</button></td></tr>");
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
		}
	});
	
	$("#menu_table").on("click","#menu_add",function(){
		if(menu_count<10){
			$("#menu_table").append("<tr><td><input type='text' name='foodName' maxlength='10'></td><td><input type='text' name='foodPrice' maxlength='10'>원</td><td><input type='text' name='discription' style='width:300px'></td><td><button id='menu_add'>＋</button> <button id='menu_del'>－</button></td></tr>");
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
		}
	});
	
	$("#btn_cancel").on("click",function(){
		history.back();
	});
});
</script>
</head>
<body>
<form action="" method="post">
<p><font size="5"><b>기본정보</b></font></p>
<table>
<tr>
	<td>업체명</td>
	<td>
		<input type="text" name="restaurantName" maxlength="10">
	</td>
</tr>
<tr>
	<td>업종</td>
	<td>
		<select>
			<option value="default">업종을 선택하세요</option>
			<option>한식</option>
			<option>양식</option>
			<option>중식</option>
			<option>일식</option>
		</select>
	</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>
		<input type="text" name="phoneNo1" maxlength="3" style="width: 50px"> -
		<input type="text" name="phoneNo2" maxlength="4" style="width: 50px"> -
		<input type="text" name="phoneNo3" maxlength="4" style="width: 50px">
	</td>
</tr>
<tr>
	<td>주소</td>
	<td>
		<input type="text" name="address" style="width:500px">
	</td>
</tr>
<tr>
	<td>소개</td>
	<td>
		<textarea name="description" style="width:500px;height:100px"></textarea>
	</td>
</tr>
</table>

<hr>

<p><font size="5"><b>사진첨부</b></font>&nbsp;&nbsp;(최대 5장 첨부 가능)</p>
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
<tr>
<td>메뉴</td>
<td>가격</td>
<td>설명</td>
<td></td>
</tr>
</thead>
<tbody id="menu_table">
<tr>
	<td><input type="text" name="foodName" maxlength="10"></td>
	<td><input type="text" name="foodPrice" maxlength="10">원</td>
	<td><input type="text" name="discription" style="width:300px"></td>
	<td>
		<button id="menu_add">＋</button>
		<button id="menu_del">－</button>
	</td>
</tr>
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