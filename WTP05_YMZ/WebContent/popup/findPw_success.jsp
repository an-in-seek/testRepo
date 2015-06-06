<%@page import="com.ymz.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
/*
 * 이메일주소 select 값 선택
 */
function mailCheck(selectObj){ 
	document.getElementById('emailAddress').value=selectObj.value;
	if(selectObj.value==""){
		$("#emailAddress").focus();	
	}
}
</script>
<table  align="center">
  <tr>
    <td>
    	<br>
    	<br>
    	고객님의 이메일로 임시비밀번호가 발급되었습니다.<br>
		<br>
		<br>
	</td>
    

  </tr>
  <tr>
    <td align="center"><a href="javascript:window.close();">닫기</a></td>

  </tr>
</table>






