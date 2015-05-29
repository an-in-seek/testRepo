<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>스마트에디터 연습 페이지</h2>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
%>

제목 : <%=title %><br>
내용 : <%=content %>
</body>
</html>