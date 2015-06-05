<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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