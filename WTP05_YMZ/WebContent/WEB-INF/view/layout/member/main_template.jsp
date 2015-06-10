<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야먹자~!~!</title>
<!-- jQuery Library import -->
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/*메세지 스타일*/
.errorMessage{
	font-size: 12px;
	color: red
}
.normalMessage{
	font-size:12px;
	color:blue;
}
img{
	/*이미지는 부모의 width에 리사이즈 처리*/
	max-width: 100%; 
	height: auto;
}
/*링크에 밑줄 제거 + 색 고정*/
a{
	text-decoration: none;
	color: #808080;
	
}
/*테이블 기본 스타일*/
table, td, th{
	border-collapse: collapse;
}
td, th{
	padding: 5px;
}
div.main_template{
	margin-top:10px;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	width:1024px;
}
header.main_template{
	width:1024px;
	padding-bottom: 5px;
	background-color:white;
	color:white;
	text-align:center;
}
#right{										/* 메인화면 오른쪽 로그인창 */
	font-family: 'Hanna', sans-serif;
	margin-top:5px;
	margin-right:5px;
	background-color: #f8f8f8;
	border: solid 1px #b70000;   
	line-height:20px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	padding:10px;
	height:160px;
	width:220px;
	text-align:center;
	-webkit-border-radius: 10px; /* 둥근 모서리 시작 */
	-moz-border-radius: 10px;
	border-radius: 10px;		 /* 둥근 모서리 끝 */
	float:right;  /*오른쪽으로 띄움 */
}
#body{
	padding: 20px;
	height:550px; overflow:auto;/*hight를 500px에 내용이 늘어나면 늘어나도록 처리*/
	width:auto;
	float:left;   /*왼쪽으로 띄움 */
}
#left{
	line-height:50px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	padding:10px;
	height:600px;
	width:100px;
	font-weight:bold;
	text-align:center;
	float:left;  /*왼쪽으로 띄움 */
}
footer.main_template{
	height:50px;
	width:1024px;
	background-color:#B70000;
	color:white;
	font-size: 16px;
	padding: 5px;
	text-align:center;
	clear:both;   /*위에 float한 애들을 무시한다. */
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div class="main_template">
	
		<header class="main_template">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="menu" />
		</header>
		
		<%-- <aside id="left" class="main_template">
			<tiles:insertAttribute name="aside_menu" /><!-- 서브메뉴로 -->
		</aside> --%>
		
		<section id="body" class="main_template">
			<tiles:insertAttribute name="body" />
		</section>
		
		<nav id="right" class="main_template">
			<tiles:insertAttribute name="right_menu" /><!-- 서브메뉴로 -->
			<%-- <tiles:insertAttribute name="right_menu2" /><!-- 서브메뉴로 --> --%>
		</nav>
		
		<footer class="main_template">
			<tiles:insertAttribute name="footer" />
		</footer>
		
	</div>
</body>
</html>
