<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function restaurantsTableSetting(txt){
	var floor_gaesu=0;
	var code="<tr><td id='all' style='background-color:lightgray;height:50px;border-style:hidden;' align='center' colspan='5'><b>전체보기</b></td></tr><tr><td colspan='5' style='border-left-style:hidden;border-right-style:hidden;'></td></tr>";
	for(var i=0;i<txt.length;i++){
		if(i%2==0){
			code=code+"<tr style='height:40px;'><td id='row"+(++floor_gaesu)+"' style='border-left-style:hidden;border-right-style:hidden;width:100px;' align='center' rowspan='"+Math.ceil((txt[i+1].split(',').length-1)/4)+"'><b>"+txt[i]+"</b></td>";
		}else{
			if(txt[i].length==0){
				code=code+"<td colspan='4' align='center' style='border-right-style:hidden;'><font color='gray'>등록된 맛집이 없습니다</font></td>";
				continue;
			}
			var temp = txt[i].split(',');
			for(var j=0,k=0;j<temp.length-1;j++,k++){
				if(k>3){
					code=code+"</tr><tr style='height:40px;'>"
					k=0;
				}
				code=code+"<td style='border-right-style:hidden;'>"+temp[j]+"</td>";
				if(j==temp.length-2 && k<4){
					for(var l=k;l<3;l++){
						code=code+"<td style='border-right-style:hidden;'></td>";
					}
				}
			}
		}
	}
	code=code+"</tr>";
	$("#restaurantsTable").html(code);
	
	$("#all").hover(function(){
		$(this).css("text-decoration","underline");
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("text-decoration","none");
	});
	
	for(var i=0;i<floor_gaesu;i++){
		$("#row"+(i+1)).hover(function(){
			$(this).css("text-decoration","underline");
			$(this).css("background-color","lightgray");
			$(this).css("cursor","pointer");
		},function(){
			$(this).css("text-decoration","none");
			$(this).css("background","none");
		});
		
		$("#row"+(i+1)).on("click",function(){
			
		});
	}
};

$(document).ready(function(){
	$("#uspace2").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/uspace2.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	$("#uspace2").on("click",function(){
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
			type:"post",
			data:{'buildingName':'유스페이스 2동'},
			dataType:"json",
			success:restaurantsTableSetting
		});
	});
	
	$("#uspace1").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/uspace1.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	$("#uspace1").on("click",function(){
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
			type:"post",
			data:{'buildingName':'유스페이스 1동'},
			dataType:"json",
			success:restaurantsTableSetting
		});
	});
	
	$("#hsquare-n").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/hsquare-n.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	$("#hsquare-n").on("click",function(){
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
			type:"post",
			data:{'buildingName':'H스퀘어 N동'},
			dataType:"json",
			success:restaurantsTableSetting
		});
	});
	
	$("#hsquare-s").hover(function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/hsquare-s.png')");
	},function(){
		$("#pangyo-map").css("background-image","url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
	});
	$("#hsquare-s").on("click",function(){
		$.ajax({
			url:"${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
			type:"post",
			data:{'buildingName':'H스퀘어 S동'},
			dataType:"json",
			success:restaurantsTableSetting
		});
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
<p></p>
<table border="1" style="width:100%;" id="restaurantsTable">
</table>
</div>
</body>
</html>