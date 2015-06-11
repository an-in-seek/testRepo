<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${initParam.rootPath }/css/themeMenu.css" rel="stylesheet" />	
<link type="text/css" href="${initParam.rootPath }/css/common.css" rel="stylesheet" />	
<script type="text/javascript">
 
</script>
</head>
<body>
<div align="center">
<ul class="ch-grid">
	<li>
		<div class="ch-item ch-img-1">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByTheme.do">
				<font size="7"><br>전체</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-2">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=S-8">
				<font size="7"><br>가족</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-3">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=S-9">
				<font size="7"><br>연인</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-4">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=S-10">
				<font size="7"><br>친구</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-5">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByTheme.do?theme=S-11">
				<font size="7"><br>회식</font></a></p>
			</div>
		</div>
	</li>
</ul>
</div>
</body>
</html>