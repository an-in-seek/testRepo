<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">
window.onload = function() {  
	  document.body.style.overflow='hidden';  
	  resizer();  
	}  
function resizer(){  
	  //원하는 크기  
	  var contentW = 500;  
	  var contentH = 450;  
	  //모니터 해상도  
	  var maxW = screen.availWidth;  
	  var maxH = screen.availHeight;  
	  //창을 화면 중앙에 위치 시키기 위한 좌표  
	  var windowX = (maxW/2)-(contentW/2);  
	  var windowY = (maxH/2)-(contentH/2);  
	  //최초 최소값으로 피팅  
	  window.moveTo(windowX,windowY);  
	  window.resizeTo(contentW, contentH);  
	  //현재 크기가져오기  
	  if (window.innerWidth)  
	  {  
    	var innerW = window.innerWidth;  
	    var innerH = window.innerHeight;  
	  }  
	  else  
	  {  
	    var innerW = document.body.clientWidth;  
	    var innerH = document.body.clientHeight;  
	  }  

}  



$(document).ready(function(){

		$("#findId").on("submit",function(){
			
			if(!$("#nickname").val()){
				alert("이름을 입력하세요");
				return false;
			}
			if(!$("#num1").val()){
				alert("전화번호를 입력하세요");
				return false;
			}
			if(!$("#num2").val()){
				alert("전화번호를 입력하세요");
				return false;
			}
			
		});
	
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
	font-weight:bold;
	margin-left: auto;
	margin-right: auto;
	font-family:'Malgun Gothic', dotum;	
	font-size : 20px;
	width:120px;
	/*background:#f0f0f0;*/
	float:center;
	color:#696969; 
	
}
#col2{
	width:20px;
}

#col3{
	height:30px;
	float:center;
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
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:30px;
	width:70px;
	text-decoration:none;
	text-align:center;
	cursor: pointer;
}
#h2{
	background:#B70000;
	color:white;
	height:50px;
	padding: 10px;
}
</style>
<title>아이디찾기 팝업창</title>
<body>
<h2 id="h2">&nbsp;아이디찾기</h2>
<form method="post" id="findId" action="${initParam.rootPath }/member/loginIdFind.do" enctype="multipart/form-data">
<c:if test="${requestScope.error_message != null}">
	<font color="red" size="2">${requestScope.error_message}</font>
</c:if>
<div>
	<table align="center">
		<tr>
			<td id="col" align="center">
				닉네임
			</td>
			<td id="col2"></td>
			<td id="col3" colspan="2">
				<input type="text" id="nickname" name="nickname" maxlength='10'>
			</td>
		</tr>
		<tr>
			<td id="col" align="center">
				전화번호
			</td>
			<td id="col2"></td>
			<td id="col3">
				<select name="phoneCP" id="phoneCP" class="input_text w60" style="vertical-align:middle">
			<option value="010" >010</option><option value="011" >011</option><option value="017" >017</option><option value="018" >018</option><option value="019" >019</option></select>
			&nbsp;-&nbsp;<input type="text" id="num1" name="num1" size="2" maxlength='4' style="vertical-align:middle">&nbsp;&nbsp;<input type="text" id="num2" name="num2" size="2" maxlength='4' class="input_text w60" style="vertical-align:middle">
			</td>
		</tr>
		<tr height="20"></tr>
		<tr>
			<td  align="center" colspan="3"  id="col3">
				<input class="id_btn" type="submit" value="확인">&nbsp;&nbsp;&nbsp;
				<input class="id_btn" type="button" onclick="window.close();" value="취소">
			</td>	
		</tr>
	</table>
</div>
</form>
</body>