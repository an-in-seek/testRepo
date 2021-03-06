<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${initParam.rootPath}/script/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${requestScope.isAdmin}"){
		$("#modifyAndDelete").append("<form method='post' action='${initParam.rootPath}/restaurant/login/admin/modifyRestaurantForm.do?restaurantNo=${requestScope.restaurant.restaurantNo}'><input type='submit' value='수정' style='width:60px;height:40px;background-color:#FF5E00;border-color:#FF5E00;color:white;font-weight:bold;'> <button id='btn_delete' style='width:60px;height:40px;background-color:#FF5E00;border-color:#FF5E00;color:white;'><b>삭제</b></button></form>");
		
		$("#btn_delete").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				$("body").append("<form id='deleteForm' action='${initParam.rootPath}/restaurant/login/admin/removeRestaurant.do' method='post'></form>")
				$("#deleteForm").append("<input type='hidden' name='restaurantNo' value='${requestScope.restaurant.restaurantNo}'>")
				$("#deleteForm").submit();
				return false;
			}else{
				return false;
			}
		});
	}
	
	var calcListCount=0;
	
	$("#selectedPicture").prop("src",$("#selectPicture img:first").prop("src"));
	$("#selectPicture img:first").css("border-color","red");
	
	$(".isUpload").on("mouseover",function(){
		$("#selectedPicture").prop("src",$(this).prop("src"));
		$(".isUpload").css("border-color","white");
		$(this).css("border-color","red");
	});
	
	//메뉴판 체크박스 클릭이벤트
	$("input[type=checkbox]").on("click",function(){
		if($(this).is(":checked")){ // 체크될때
			if(calcListCount==0){ // 체크할때 메뉴가하나도없었을때
				$("#calcList").html("<tr class='"+$(this).prop("id")+"'><td align='left' style='padding-left:20px;border-left-style:hidden;border-right-style:hidden;'></td><td style='border-right-style:hidden;'></td><td style='border-right-style:hidden;'></td><td style='border-right-style:hidden;'></td></tr>");
				$("#calcList tr td:first-child").html($("#menus ."+$(this).prop("id")+" td:first-child").html());
				$("#calcList tr td:nth-child(2)").html("<span class='foodPrice'>"+$("#menus ."+$(this).prop("id")+" td:nth-child(2) .foodPrice").html()+"</span>원");
				$("#calcList tr td:nth-child(3)").html($("#menus ."+$(this).prop("id")+" td:nth-child(4) input").val());
				$("#calcList tr td:nth-child(4)").html("<span class='subTotal'>"+$("#calcList tr td:nth-child(2) .foodPrice").text()*$("#calcList tr td:nth-child(3)").text()+"</span>원");
				calcListCount++;
			}else{ // 체크할때 예산에 추가된 메뉴가 이미 하나이상 있을때
				$("#calcList").append("<tr class='"+$(this).prop("id")+"'><td align='left' style='padding-left:20px;border-left-style:hidden;border-right-style:hidden;'></td><td style='border-right-style:hidden;'></td><td style='border-right-style:hidden;'></td><td style='border-right-style:hidden;'></td></tr>");
				$("#calcList tr:last-child td:first-child").html($("#menus ."+$(this).prop("id")+" td:first-child").html());
				$("#calcList tr:last-child td:nth-child(2)").html("<span class='foodPrice'>"+$("#menus ."+$(this).prop("id")+" td:nth-child(2) .foodPrice").html()+"</span>원");
				$("#calcList tr:last-child td:nth-child(3)").html($("#menus ."+$(this).prop("id")+" td:nth-child(4) input").val());
				$("#calcList tr:last-child td:nth-child(4)").html("<span class='subTotal'>"+$("#calcList tr:last-child td:nth-child(2) .foodPrice").text()*$("#calcList tr:last-child td:nth-child(3)").text()+"</span>원");
				calcListCount++;
			}
		}else{ // 체크가 해제될때
			if(calcListCount==1){ // 하나만 있었을경우 메시지를 뿌려줌
				$("#calcList").html("<tr><td colspan='4' height='50px' style='border-left-style:hidden;border-right-style:hidden;'>위 메뉴판에서 메뉴와 수량을 선택하면 편리하게 예산을 짜실 수 있습니다</td></tr>");
				calcListCount--;
			}else{
				$("#calcList tr."+$(this).prop("id")).remove();
				calcListCount--;
			}
		}
		
		var total=0;
		for(var i=1;i<calcListCount+1;i++){
			total=total+eval($("#calcList tr:nth-child("+i+") td:last-child .subTotal").text());
		}
		$("#totalPrint").html("총합계 : <span id='total'>"+total+"</span>원");
		$("#totalDiv").text(Math.ceil(total/$("#calcTotal input").val()));
	});

	$("#menus img").on("mouseover",function(){
		$(this).css("cursor","pointer");
	});
	
	//수량증가버튼클릭이벤트
	$("#menus img:even").on("click",function(){
		if($("#menus tr."+$(this).prop("class")+" td:last-child input").val()<10){
			$("#menus tr."+$(this).prop("class")+" td:last-child input").val(eval($("#menus tr."+$(this).prop("class")+" td:last-child input").val())+1);
			if($("#menus tr."+$(this).prop("class")+" input:checked").val()=="on"){
				$("#calcList tr."+$(this).prop("class")+" td:nth-child(3)").html($("#menus ."+$(this).prop("class")+" td:nth-child(4) input").val());
				$("#calcList tr."+$(this).prop("class")+" td:nth-child(4)").html("<span class='subTotal'>"+$("#calcList tr."+$(this).prop("class")+" td:nth-child(2) .foodPrice").text()*$("#calcList tr."+$(this).prop("class")+" td:nth-child(3)").text()+"</span>원");
				
				var total=0;
				for(var i=1;i<calcListCount+1;i++){
					total=total+eval($("#calcList tr:nth-child("+i+") td:last-child .subTotal").text());
				}
				$("#totalPrint").html("총합계 : <span id='total'>"+total+"</span>원");
				$("#totalDiv").text(Math.ceil(total/$("#calcTotal input").val()));
			}
		}
	});
	
	//수량감소버튼클릭이벤트
	$("#menus img:odd").on("click",function(){
		if($("#menus tr."+$(this).prop("class")+" td:last-child input").val()>1){
			$("#menus tr."+$(this).prop("class")+" td:last-child input").val(eval($("#menus tr."+$(this).prop("class")+" td:last-child input").val())-1);
			if($("#menus tr."+$(this).prop("class")+" input:checked").val()=="on"){
				$("#calcList tr."+$(this).prop("class")+" td:nth-child(3)").html($("#menus ."+$(this).prop("class")+" td:nth-child(4) input").val());
				$("#calcList tr."+$(this).prop("class")+" td:nth-child(4)").html("<span class='subTotal'>"+$("#calcList tr."+$(this).prop("class")+" td:nth-child(2) .foodPrice").text()*$("#calcList tr."+$(this).prop("class")+" td:nth-child(3)").text()+"</span>원");
				
				var total=0;
				for(var i=1;i<calcListCount+1;i++){
					total=total+eval($("#calcList tr:nth-child("+i+") td:last-child .subTotal").text());
				}
				$("#totalPrint").html("총합계 : <span id='total'>"+total+"</span>원");
				$("#totalDiv").text(Math.ceil(total/$("#calcTotal input").val()));
			}
		}
	});
	
	$("#numofpeopleUp").on("click",function(){
		if($("#calcTotal input").val()<50){
			$("#calcTotal input").val(eval($("#calcTotal input").val())+1);
			$("#totalDiv").text(Math.ceil($("#total").text()/$("#calcTotal input").val()));
		}
	});
	$("#numofpeopleUp").on("mouseover",function(){
		$(this).css("cursor","pointer");
	});
	
	$("#numofpeopleDown").on("click",function(){
		if($("#calcTotal input").val()>1){
			$("#calcTotal input").val(eval($("#calcTotal input").val())-1);
			$("#totalDiv").text(Math.ceil($("#total").text()/$("#calcTotal input").val()));
		}
	});
	$("#numofpeopleDown").on("mouseover",function(){
		$(this).css("cursor","pointer");
	});
//송이꺼-----------------------------------------------------------

	//내용 공백일때 경고창
	 $("#registerBtn").click( function() {
		var idDup;
		var id = "${sessionScope.login_info.id}"; 
		var restaurantNo ="${requestScope.restaurant.restaurantNo}";
		$.ajax({
			url:"${initParam.rootPath}/restaurant/idDuplicateCheck.do",
			data:{"id":id,"restaurantNo":restaurantNo},
			dataType:"text",
			beforeSend:function(){
				if(!id){//id에 입력된 값이 없으면 전송하지 않는다.
					return false;
				}
				if (!$("#content").val()) {
					$("#content").focus();
					alert("내용을 입력하세요");
					return false;
				}
				//평점 선택 안했을 때 경고창
				if($("input[type=radio][name=score]:checked").length<1){
					alert("평점을 선택하세요");
					return false;
				}
			},
			success:function(ret){
				if(ret=="false"){
					alert("댓글은 1계정당 1개씩만 등록 할 수 있습니다.");
					return false;
				}else{
					document.registerReplyForm.submit();
				}
			}
		});
	});  

		$("#replyModifyBtn").click(function(){
			if (!$("#ModifyContent").val()) {
				$("#ModifyContent").focus();
				alert("내용을 써주세욤");
				return false;
				//평점 선택 안했을 때 경고창
			}else if(!$("input[type=radio][name=score]:checked").val()){
				alert("평점을 선택해");
				return false;
			}
		}); 

		$("#reply_reportButton").on("click", function() {
			alert("로그인을 해야합니다.미구현");
		});
	});
	 	
//댓글 기본 안내문

	function focusReply(){
	$("#content").html("");
}

	function modifyReply(number, restaurantNo){
		var isUp=confirm("수정하시겠습니까?")
		if(isUp){
				var con = $("#replyContent"+number).text();
					$("#updateReplyForm").append("<input type='hidden'  name='number' value='"+number+"'>");
					$("#updateReplyForm").append("<input type='hidden'  name='restaurantNo' value='"+restaurantNo+"'>");
					$("#ModifyContent").val(con);	
					$("#dialog").dialog({modal:true, width:650});
			}else{
					return false;
			}
	}


	//송이꺼 삭제팝업창
	function removeReply(number,score, restaurantNo){
		var isDel=confirm("삭제할까요?");
		if(isDel){
			document.location.href="${initParam.rootPath}/restaurant/login/removeReply.do?number=" +number+"&score="+score+"&restaurantNo="+restaurantNo;
		}else{
			return;
		}
	}
</script>

<link type="text/css" href="${initParam.rootPath }/css/jquery-ui.css" rel="stylesheet"/>
<style type="text/css">

#dialog{
width:400px;
display:none;
}

/* UI Object  빨간별*/
.star_rating,
.star_rating span{display:inline-block;overflow:hidden;height:14px;background:transparent url(${initParam.rootPath }/css/images/ico_star.gif) no-repeat}
.star_rating{width:79px;vertical-align:-1px;}
.star_rating span{background-position:0 -14px;font-size:0;line-height:0;text-indent:-100px;*text-indent:0;vertical-align:top}

#replyTable tr {
	border-right: 1px solid pink;
	border-left: 1px solid pink;
}
table#replyTable tbody tr:nth-child(2n){
background-color: #ffffff;
}
table#replyTable tbody tr:nth-child(odd) {
  	background-color:#ffe4c4;
}
table#replyTable thead tr{
	font-family: 'Hanna', sans-serif;
	color: #545c72;
	background: #eaeaea;
	text-align: center;
}
table#replyTable tbody tr{
	font-family: 'Hanna', sans-serif;
	font-size: 20px;
	height:10px;
}

#replyTable tr td{
	border-top: 1px solid pink;
	border-bottom: 1px solid pink;
}
.blankTd{
	border-right: 1px solid white;
	border-left: 1px solid white;
	background-color: white;
	height:0px;
}

.nicknameTd:nth-child(odd){
}
.ReplyTb{
background:#ffe4c4;
}
</style>

</head>



<body>
<table style="width:100%;">

<tr>
<td style="width:50%">
<table style="width:100%;">
<tr align="center">
<td colspan="7" style="padding:0px;"><img id="selectedPicture" style="width:490px;height:350px;border-style:solid;border-width:5px;border-color:lightgray;"></td>
</tr>

<tr id="selectPicture" align="center">
<td style="width:5%;padding:0px;">
<button disabled="disabled" style="color:white;background-color:lightgray;border-width:0px;width:20px;height:60px;padding:0px;">◀</button>
</td>
<c:forEach items="${requestScope.pictures }" var="picture">
	<td style="width:18%;padding:0px;padding-top:3px;">
		<img style="width:84px;height:60px;border-style:solid;border-color:white;" class="isUpload" src="${initParam.rootPath }/uploadPhoto/${picture}">
	</td>
</c:forEach>
<c:forEach begin="${fn:length(requestScope.pictures)+1 }" end="5">
	<td style="width:18%;padding:0px;padding-top:3px;">
		<img style="width:84px;height:60px;border-style:solid;border-color:white;" src="${initParam.rootPath }/uploadPhoto/noimage.jpg">
	</td>
</c:forEach>
<td style="width:5%;padding:0px;">
<button disabled="disabled" style="color:white;background-color:lightgray;border-width:0px;width:20px;height:60px;padding:0px;">▶</button>
</td>
</tr>

</table>
</td>

<td valign="top" style="width:50%;padding-top:20px;">
<table>
<tr>
	<td style="width:100px;" align="center"><b>상호명</b></td>
	<td>${requestScope.restaurant.restaurantName }</td>
</tr>
<tr>
	<td align="center"><b>업종</b></td>
	<td>${requestScope.restaurant.category }</td>
</tr>
<tr>
	<td align="center"><b>전화번호</b></td>
	<td>${requestScope.restaurant.phoneNo }</td>
</tr>
<tr>
	<td align="center"><b>위치</b></td>
	<td>${requestScope.restaurant_location }</td>
</tr>
<tr>
	<td align="center"><b>평점</b></td>
	<td>
		<c:choose>
			<c:when test="${fn:startsWith(requestScope.restaurant.score,'0')}"><span class="star_rating"><span style="width:0%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.restaurant.score,'1')}"><span class="star_rating"><span style="width:20%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.restaurant.score,'2')}"><span class="star_rating"><span style="width:40%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.restaurant.score,'3')}"><span class="star_rating"><span style="width:60%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.restaurant.score,'4')}"><span class="star_rating"><span style="width:80%"></span></span></c:when>
			<c:when test="${fn:startsWith(requestScope.restaurant.score,'5')}"><span class="star_rating"><span style="width:100%"></span></span></c:when>
		</c:choose>
		&nbsp;${requestScope.restaurant.score }
	</td>
</tr>
<tr>
	<td align="center"><b>테마</b></td>
	<td>${requestScope.restaurant.theme }</td>
</tr>
<tr>
	<td align="center"><b>소개</b></td>
	<td>${requestScope.restaurant.description }</td>
</tr>
</table><p>
<hr>
<p id="modifyAndDelete" align="right"></p>
</td>
</tr>
</table>

<!-- 여기부터 메뉴판 코드 -->
<p><font size="5"><b>메뉴판</b></font></p>
<table border="1" style="width:100%">
<thead>
<tr align="center" style="background-color:#FFE08C;">
<td rowspan="2"><b>메뉴</b></td>
<td rowspan="2" style="width:15%;"><b>가격</b></td>
<td colspan="2"><b>예산짜기</b></td>
</tr>
<tr align="center" style="background-color:#FFE08C;">
<td style="width:6%;">선택</td>
<td style="width:15%;">수량</td>
</tr>
</thead>
<tbody id="menus">
<c:choose>
<c:when test="${empty requestScope.foods }">
<tr>
<td colspan="4" align="center" height="50px" style="border-left-style:hidden;border-right-style:hidden;">등록된 메뉴가 없습니다</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach items="${requestScope.foods }" var="food">
	<tr class="${food.foodNo }">
		<td style="padding-left:20px;border-left-style:hidden;border-right-style:hidden;">${food.foodName }&nbsp;&nbsp;<font color="gray" size="2">${food.foodDescription }</font></td>
		<td style="border-right-style:hidden;" align="center"><span class="foodPrice">${food.foodPrice }</span>원</td>
		<td style="border-right-style:hidden;" align="center"><input type="checkbox" id="${food.foodNo }"></td>
		<td style="border-right-style:hidden;" align="center">
			<table>
			<tr>
			<td style="padding:0px;padding-right:3px;"><input type="number" min="1" max="10" value="1" readonly="readonly" style="width:80px;height:20px;"></td>
			<td style="padding:0px;line-height:13px;">
			<img class="${food.foodNo }" src="${initParam.rootPath }/uploadPhoto/up.png"><br>
			<img class="${food.foodNo }" src="${initParam.rootPath }/uploadPhoto/down.png"></td>
			</tr>
			</table>
		</td>
	</tr>
</c:forEach>
</c:otherwise>
</c:choose>
</tbody>
</table>
<!-- ---------------------------------------------------------------------------------------------------- -->

<!-- 여기부터 예산 코드 -->
<p><font size="5"><b>예산짜기</b></font></p>
<table border="1" style="width:100%">
<thead>
<tr align="center" height="50px" style="background-color:#FFE08C;">
<td><b>메뉴</b></td>
<td style="width:15%;"><b>가격</b></td>
<td style="width:6%;"><b>수량</b></td>
<td style="width:15%;"><b>계</b></td>
</tr>
</thead>
<tbody id="calcList" align="center">
<tr>
<td style="border-left-style:hidden;border-right-style:hidden;" colspan="4" height="50px">위 메뉴판에서 메뉴와 수량을 선택하면 편리하게 예산을 짜실 수 있습니다</td>
</tr>
</tbody>
<tfoot id="calcTotal">
<tr style="background-color:#FFE08C;">
<td colspan="2" style="padding-left:20px;border:0px;">
	<table>
	<tr>
	<td style="padding:0px;">인원수 별 금액 : <input style="height:20px;" type="number" min="1" max="10" value="1" readonly="readonly"></td>
	<td style="padding:0px;padding-left:3px;padding-right:5px;line-height:13px;">
		<img id="numofpeopleUp" src="${initParam.rootPath }/uploadPhoto/up.png"><br>
		<img id="numofpeopleDown" src="${initParam.rootPath }/uploadPhoto/down.png">
	</td>
	<td style="padding:0px;">명 일 때 약 <span id="totalDiv">0</span>원 씩 지불</td>
	</tr>
	</table>
</td>
<td id="totalPrint" colspan="2" align="right" style="padding-right:20px;border:0px;">총합계 : <span id="total">0</span>원</td>
</tr>
</tfoot>
</table>
<!-- -----------------------------------------------------송이----------------------------------------------- -->
<hr>
	<p>
		<font size="5"><b>댓글</b></font>
	</p>
<hr>
	<table id="replyTable" style=" text-align:'center';width:100%;">
	<thead>
	<tr>
		<td colspan="4"><font size="5" color="blue">${requestScope.restaurant.replyCount}</font>개의 댓글이 달렸습니다.</td>
	</tr>
	</thead>
		<c:forEach items="${requestScope.replyList}" var="reply">
			<tr>	
				<td class="nicknameTd" style="width:10%">${reply.nickname}</td>
				<td id="replyContent${reply.number}" style="width: 800px;">${reply.content }</td>
				<td  align="left" style="width:15%">${reply.regDate }<br>
						 평점 : ${reply.score }점<br>
					<c:choose>
						<c:when test="${reply.score==1}"><span class="star_rating"><span style="width:20%">1점</span></span></c:when>
						<c:when test="${reply.score==2}"><span class="star_rating"><span style="width:40%">2점</span></span></c:when>
						<c:when test="${reply.score==3}"><span class="star_rating"><span style="width:60%">3점</span></span></c:when>
						<c:when test="${reply.score==4}"><span class="star_rating"><span style="width:80%">4점</span></span></c:when>
						<c:when test="${reply.score==5}"><span class="star_rating"><span style="width:100%">5점</span></span></c:when>
					</c:choose>
					<p>
					<c:choose>
					<c:when test="${sessionScope.login_info.id == reply.memberId}">
					<!-- 본인 아이디일 때만 수정 삭제 버튼 보이기 -->
					<input type="button" id="replyModifyButton${reply.number}" onclick="modifyReply(${reply.number},${requestScope.restaurant.restaurantNo})" value="수정">
					<input type="button" id="replyRemoveButton${reply.number }" onclick="removeReply(${reply.number},${reply.score },${requestScope.restaurant.restaurantNo})" value="삭제">
					</c:when>
					<c:when test="${sessionScope.login_info.grade =='master'}">
					<!--관리자일 때 삭제 버튼 보이기  -->
					<input type="button" id="replyRemoveButton${reply.number }" onclick="removeReply(${reply.number},${reply.score },${requestScope.restaurant.restaurantNo})" value="삭제">					
					</c:when>
									
					</c:choose>
				</td>
			</tr>
		
			
		</c:forEach>
	</table>
	<p>
		<font size="5"><b> 댓글쓰기</b></font>
	</p>
	<form method="post" action="${initParam.rootPath}/restaurant/login/registerReply.do" id="registerReplyForm" name="registerReplyForm">
		<table class="ReplyTb" style="border='1' width:800px;">
		<c:choose>
			<c:when test="${not empty sessionScope.login_info}">
				<td>
				<textarea name="content" id="content" maxlength="80"  onfocus="focusReply()" style="width: 900px; height: 80px" >맛있어요~♥</textarea>
					<input type="hidden"	id="restaurantNo" name="restaurantNo" value="${requestScope.restaurant.restaurantNo }">
				<p>평점주기
				 	<label for="1"></label><input type="radio" name="score" value="1" id="1"><span class="star_rating"><span style="width:20%"></span></span>
					<label for="2"></label><input type="radio" name="score" value="2" id="2"><span class="star_rating"><span style="width:40%"></span></span>
					<label for="3"></label><input type="radio" name="score" value="3" id="3"><span class="star_rating"><span style="width:60%"></span></span>
					<label for="4"></label><input type="radio" name="score" value="4" id="4"><span class="star_rating"><span style="width:80%"></span></span>
					<label for="5"></label><input type="radio" name="score" value="5" id="5"><span class="star_rating"><span style="width:100%"></span></span>
					</p>
				</td>
				<td>
					<input type="button" src="${initParam.rootPath}/css/images/btn_registry.gif" id="registerBtn" value="등록"  >
				</td>
		</c:when>
			<c:otherwise>
			<tr>
			<!-- 비회원일때 댓글창 비활성화 -->
				<td disabled="disabled">	
					<textarea name="content" id="content" name="content" disabled="disabled" onfocus="focusReply(this)" style="width: 900px; height: 80px">로그인을 하시오
					</textarea>
						<input type="hidden"	id="restaurantNo" name="restaurantNo" value="${requestScope.restaurant.restaurantNo }">
				<p>평점주기
				 	<label for="1"></label><input type="radio" name="score"  value="1" id="1"><span class="star_rating"><span style="width:20%"></span></span>
					<label for="2"></label><input type="radio" name="score" value="2" id="2"><span class="star_rating"><span style="width:40%"></span></span>
					<label for="3"></label><input type="radio" name="score" value="3" id="3"><span class="star_rating"><span style="width:60%"></span></span>
					<label for="4"></label><input type="radio" name="score" value="4" id="4"><span class="star_rating"><span style="width:80%"></span></span>
					<label for="5"></label><input type="radio" name="score" value="5" id="5"><span class="star_rating"><span style="width:100%"></span></span></p>
				</td>
				<td>
					<input type="image" src="${initParam.rootPath}/css/images/btn_registry.gif" id="registerBtn" disabled="disabled" value="등록" >
				</td>
			</tr>
			</c:otherwise>
		</c:choose>
		</table>
	</form>
<div id="dialog" title="댓글 수정">
		<section>
			<header style="text-align: center; font-weight: bolder; font-size: 1.3em; border-bottom: 2px solid black; padding: 5px">댓글을 수정하세요</header>
				<form id="updateReplyForm" method="post" action="${initParam.rootPath}/restaurant/login/updateReply.do"  >
					<p>
						<article>내용</article>
					</p>
						<input type="text" id="ModifyContent" name="content" style="width: 600px; height: 40px" autofocus="autofocus">
					<p>
						평점주기
						<label for="1"></label><input type="radio" name="score" value="1" id="1"><span class="star_rating"><span style="width:20%"></span></span>
						<label for="2"></label><input type="radio" name="score" value="2" id="2"><span class="star_rating"><span style="width:40%"></span></span>
						<label for="3"></label><input type="radio" name="score" value="3" id="3"><span class="star_rating"><span style="width:60%"></span></span>
						<label for="4"></label><input type="radio" name="score" value="4" id="4"><span class="star_rating"><span style="width:80%"></span></span>
						<label for="5"></label><input type="radio" name="score" value="5" id="5"><span class="star_rating"><span style="width:100%"></span></span>
					</p>
				<input id="replyModifyBtn" type="submit" value="등록">
			</form>
		</section>
	</div>
	<p/>
	
<hr>
<p align="center"><a href="${sessionScope.backURL }"><button style="width:200px;height:50px;background-color:#FF5E00;border-color:#FF5E00;color:white;"><b>목록으로 돌아가기</b></button></a></p>
</body>
</html>
