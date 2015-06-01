<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#uspace2").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/uspace2.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	$("#uspace1").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/uspace1.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	$("#hsquare-n").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/hsquare-n.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	$("#hsquare-s").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/hsquare-s.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
});
</script>
</head>
<body>
<p>restaurant_location.jsp</p>
<table id="pangyo-map" style="width:369px;height:299px;background-image:url('${initParam.rootPath }/uploadPhoto/pangyo-map.png');">
<tr style="height:15px;">
<td style="width:10px;"></td>
<td style="width:40px;"></td>
<td style="width:100px;"></td>
<td style="width:20px;"></td>
<td style="width:120px;"></td>
<td></td>
</tr>
<tr style="height:60px;">
<td></td>
<td colspan="2" id="uspace2"></td>
<td></td>
<td id="hsquare-n"></td>
<td></td>
</tr>
<tr style="height:30px;">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr style="height:30px;">
<td></td>
<td></td>
<td></td>
<td></td>
<td rowspan="2" id="hsquare-s"></td>
<td></td>
</tr>
<tr style="height:15px;">
<td></td>
<td></td>
<td rowspan="2" id="uspace1"></td>
<td></td>
<td></td>
</tr>
<tr style="height:130px;">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</table>
</body>
</html>