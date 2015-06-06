<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.ymz.member.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery-ui.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">

</script>
<table  align="center">
  <tr>
    <td>
    	<br>
    	<br>
    	당신의 ID는 ${requestScope.id }입니다.<br>
		<br>
		<br>
	</td>
    

  </tr>
  <tr>
    <td align="center"><a href="javascript:window.close();">닫기</a></td>

  </tr>
</table>

