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
	
	$("#hipex-a").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/hipex-a.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	
	$("#hipex-b").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/hipex-b.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
});
</script>
</head>
<body>
<div align="center">
<table id="pangyo-map" style="border-color:white;width:561px;height:328px;background-image:url('${initParam.rootPath }/uploadPhoto/pangyo-map.png');">
<tr style="height:25px;">
<td style="width:20px;"></td>
<td style="width:50px;"></td>
<td style="width:110px;"></td>
<td style="width:20px;"></td>
<td style="width:120px;"></td>
<td style="width:35px;"></td>
<td style="width:110px;"></td>
<td></td>
</tr>
<tr style="height:20px;">
<td></td>
<td id="uspace2" colspan="2" rowspan="3"></td>
<td></td>
<td></td>
<td></td>
<td id="hipex-a" rowspan="3"></td>
<td></td>
</tr>
<tr style="height:30px;">
<td></td>
<td></td>
<td id="hsquare-n" rowspan="2"></td>
<td></td>
<td></td>
</tr>
<tr style="height:10px;">
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr style="height:40px;">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr style="height:15px;">
<td></td>
<td></td>
<td></td>
<td></td>
<td id="hsquare-s" rowspan="3"></td>
<td></td>
<td id="hipex-b" rowspan="4"></td>
<td></td>
</tr>
<tr style="height:15px;">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr style="height:20px;">
<td></td>
<td></td>
<td id="uspace1" rowspan="3"></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr style="height:15px;">
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr style="height:115px;">
<td></td>
<td></td>
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
<td></td>
<td></td>
</tr>
</table>
</div>
</body>
</html>