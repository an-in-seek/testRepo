<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${initParam.rootPath}/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath}/script/jquery-latest.js"></script> 
<script type="text/javascript" src="${initParam.rootPath}/script/faq.js"></script>
<script type="text/javascript">

function removeFaq(number){
	$("#number").val(number);
	document.getElementById("removeForm").submit();
} 

$(document).ready(function(){
	var idx;
	$.ajax({
		url:"${initParam.rootPath}/faq/findLoginMember.do", //요청 url 설정
		type:"post", //HTTP 요청 방식(method)
		dataType:"json", //javascript객체로 변환해서 응답데이터를 전달.
		beforeSend:function(){
			//$("#writeBtn").hide();
			for(idx=1 ; idx<="${fn:length(requestScope.faq_list)}" ; idx++){
				$("#modifyBtn"+idx).hide();
			}
			$("#listTB2").hide();
		},
		success:function(member){
			if(member.grade == 'master'){
				$("#writeBtn").show();
				for(idx=1 ; idx<="${fn:length(requestScope.faq_list)}" ; idx++){
					$("#modifyBtn"+idx).show();
				}
				$("#listTB2").show();
			}
		}
	});
});
</script>

<link type="text/css" href="${initParam.rootPath}/css/faq.css" rel="stylesheet"/>

<div align="center">
<%-- <c:if test="${fn:length(requestScope.faq_list) != 0 }"> --%>
<form id="removeForm" method=post action="${initParam.rootPath }/faq/login/admin/removeFaq.do">
	<input type="hidden" id="number" name="number">
	<table id="table1">
		<tr align="center">
			<td>
				<div class="faq" id="listTB1" style="width: 680px" align="center">
					<div class="faqHeader">
						<h1>고객센터(FAQ)</h1>
						<button type="button" class="showAll"><font color="blue"><b>답변 모두 여닫기</b></font></button>
					</div>
					<c:forEach items="${requestScope.faq_list }" var="faq">
						<ul class="faqBody">
							<li class="article" id="a${faq.number}" align="center" height="40px">
								<p class="q"><a href="#a${faq.number}">Q${faq.number} : ${faq.title}</a></p>
								<p class="a">
									A : ${faq.content}
									<input id="modifyBtn${faq.number}" type="button" value="수정하기" onclick="window.location='${initParam.rootPath }/faq/login/admin/modifyForm.do?number=${faq.number}'">
								</p>
							</li>
						</ul>
						</c:forEach>
					<table align="center">
						<tr>
							<td align="center"><input id="writeBtn" type="button" value="글쓰기" onclick="window.location='${initParam.rootPath }/faq/login/admin/writeForm.do'"></td>
						</tr>
					</table>
				</div>
			</td>
			
			<td>
				<table id="listTB2" style="width: 120px" border="1" align="center">
						<tr  align="center" height="40px">
						</tr>
					<tbody>
						<c:forEach items="${requestScope.faq_list }" var="qna">
							<tr align="center" height="40px">
								<td>Q${qna.number}</td>
								<td><input id="deleteBtn${qna.number}" type="button" value="삭제" onclick="removeFaq(${qna.number});"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</td>
		</tr>
	</table>

</form>
</div>
<%-- </c:if> --%>

