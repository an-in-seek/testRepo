<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#hansik").hover(function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/hansik.png");
	},function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/hansik-1.jpg");
	});
	
	$("#yangsik").hover(function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/yangsik.png");
	},function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/yangsik-1.jpg");
	});
	
	$("#jungsik").hover(function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/jungsik.png");
	},function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/jungsik-1.jpg");
	});
	
	$("#ilsik").hover(function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/ilsik.png");
	},function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/ilsik-1.jpg");
	});
	
	$("#all").hover(function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/all-view.png");
	},function(){
		$(this).prop("src","${initParam.rootPath }/uploadPhoto/all-view-1.jpg");
	});
});
</script>
</head>
<body><div align="center">
<table>
<tr>
<td colspan="2"><a href="${initParam.rootPath }/restaurant/showListByType.do"><img style="width:610px;" id="all" src="${initParam.rootPath }/uploadPhoto/all-view-1.jpg"></a></td>
</tr>
<tr>
<td><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-4"><img id="hansik" src="${initParam.rootPath }/uploadPhoto/hansik-1.jpg"></a></td>
<td><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-5"><img id="yangsik" src="${initParam.rootPath }/uploadPhoto/yangsik-1.jpg"></a></td>
</tr>
<tr>
<td><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-6"><img id="jungsik" src="${initParam.rootPath }/uploadPhoto/jungsik-1.jpg"></a></td>
<td><a href="${initParam.rootPath }/restaurant/showListByType.do?category=S-7"><img id="ilsik" src="${initParam.rootPath }/uploadPhoto/ilsik-1.jpg"></a></td>
</tr>
</table>
</div></body>
</html>