<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야먹자~!~!</title>

<!-- jQuery Library import -->
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>
<script type="text/javascript">


</script>
<style type="text/css">
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
/*링크에 밑줄 제거*/
a{
	text-decoration: none;
}
/*테이블 기본 스타일*/
table, td, th{
	border-collapse: collapse;
}
td, th{
	padding: 5px;
}
div.mypage_template{
	margin-top:10px;
	margin-right:auto;/*margin을 auto로 주면 좌우마진이 같게 되어 가운데 정렬 효과가 있다.*/
	margin-left:auto;
	width:1024px;
}
header.mypage_template{
	background-color:white;
	color:white;
	text-align:center;
	padding: 5px;
}

#body{
	padding: 20px;
	height:580px; overflow:auto;/*hight를 500px에 내용이 늘어나면 늘어나도록 처리*/
	width:800px;
	font-weight:bold;
	text-align:left;
	float:left;   /*왼쪽으로 띄움 */
}
#left{
	line-height:50px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	padding:10px;
	height:600px;
	width:150px;
	font-weight:bold;
	text-align:center;
	float:left;  /*왼쪽으로 띄움 */
}
footer.mypage_template{
	background-color:#2b2f3a;
	color:white;
	padding-top: 4px;
	padding-bottom: 12px;
	text-align:center;
	height:50px;
	clear:both;   /*위에 float한 애들을 무시한다. */
}
</style>
</head>
<body>
	<div class="mypage_template">
		<header class="mypage_template">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="menu" />
		</header>
		<aside id="left" class="mypage_template">
			<tiles:insertAttribute name="aside_menu" /><!-- 서브메뉴로 -->
		</aside>
		<section id="body" class="mypage_template">
			<tiles:insertAttribute name="body" />
		</section>
		<footer class="mypage_template">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>