<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="${initParam.rootPath }/css/imageMenu.css" rel="stylesheet" />	
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
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-4">
				<font size="7"><br>한식</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-2">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-5">
				<font size="7"><br>양식</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-3">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-7">
				<font size="7"><br>일식</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-4">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-6">
				<font size="7"><br>중식</font></a></p>
			</div>
		</div>
	</li>
	<li>
		<div class="ch-item ch-img-5">
			<div class="ch-info">
				<p id="type"><a href="${initParam.rootPath }/restaurant/showListByType.do">
				<font size="7">전체보기</font></a></p>
			</div>
		</div>
	</li>
</ul>
</div>
</body>
</html>