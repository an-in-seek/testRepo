<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	a.menu:link {text-decoration:none; color: white;}/*방문하지 않은 페이지*/
	a.menu:hover	{text-decoration:underline; color: white;}/*링크에 마우스 올라갔을 때*/
	a.menu:active	{text-decoration:none; color: white;}/*링크 클릭시*/
	a.menu:visited {text-decoration:none; color: white;}/*방문한 링크 표시*/
</style>    
<script type="text/javascript">
function removeConfirm(){
	var flag = confirm("정말 탈퇴하겠습니까?");
	if(flag){
		location.href = "${initParam.rootPath }/member/login/removeMember.do";
	}
}
</script>
<c:if test="${sessionScope.login_info != null }">
	${sessionScope.login_info.name } 님&nbsp;&nbsp; | &nbsp;&nbsp;
</c:if>
<a href='${initParam.rootPath }/index.do' class="menu">메인페이지</a>&nbsp;&nbsp;
<c:choose>
	<c:when test="${sessionScope.login_info == null }">
		<a href='${initParam.rootPath }/member/joinForm.do' class="menu">회원가입</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath }/member/loginForm.do" class="menu">로그인</a>&nbsp;&nbsp;
	</c:when>
	<c:otherwise>
		<a href='${initParam.rootPath }/member/login/logout.do' class="menu">로그아웃</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath }/member/login/getMemberInfo.do" class="menu">회원정보조회</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath }/member/login/modifyForm.do" class="menu">회원정보 수정</a>&nbsp;&nbsp;
		<a href="javascript:removeConfirm();" class="menu">회원 탈퇴</a>&nbsp;&nbsp;
	</c:otherwise>
</c:choose>
<a href="${initParam.rootPath }/member/memberList.do" class="menu">맛집정보</a>&nbsp;&nbsp;
<a href="${initParam.rootPath }/member/memberListPaging.do" class="menu">맛집리뷰</a>&nbsp;&nbsp;
<a href="${initParam.rootPath }/faq/faqList.do" class="menu">고객센터</a>&nbsp;&nbsp;
