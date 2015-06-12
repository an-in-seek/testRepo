<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	color: black;
}

/* 추가 */
ul, li {
	margin: 0px;
	padding: 0px;
	list-style: none;
}
</style>
<script type="text/javascript">
	var selectedBuildingName;

	function restaurantsTableSetting(txt) {
		var floor_gaesu = 0;
		var a_count = 0;
		var code = "<tr><td id='all' style='background-color:#FFE08C;height:50px;border-style:hidden;' align='center' colspan='5'><b>"
				+ selectedBuildingName
				+ " 맛집 전체보기</b></td></tr><tr><td colspan='5' style='border-left-style:hidden;border-right-style:hidden;'></td></tr>";
		for (var i = 0; i < txt.length; i++) {
			if (i % 2 == 0) {
				code = code
						+ "<tr style='height:40px;'><td id='row"
						+ (++floor_gaesu)
						+ "' style='border-left-style:hidden;border-right-style:hidden;width:100px;' align='center' rowspan='"
						+ Math.ceil((txt[i + 1].split(',').length - 1) / 4)
						+ "'><b>" + txt[i] + "</b></td>";
			} else {
				if (txt[i].length == 0) {
					code = code
							+ "<td colspan='4' align='center' style='border-right-style:hidden;'><font color='gray'>등록된 맛집이 없습니다</font></td>";
					continue;
				}
				var temp = txt[i].split(',');
				for (var j = 0, k = 0; j < temp.length - 1; j++, k++) {
					if (k > 3) {
						code = code + "</tr><tr style='height:40px;'>"
						k = 0;
					}
					code = code
							+ "<td style='border-right-style:hidden;'><a id='count"
							+ (++a_count)
							+ "' href='${initParam.rootPath}/restaurant/restaurantViewByRestaurantName.do?restaurantName="
							+ temp[j]
							+ "&backURL=${initParam.rootPath}/restaurant/selectLocation.do?selectedBuildingName="
							+ selectedBuildingName + "'>" + temp[j]
							+ "</a></td>";
					if (j == temp.length - 2 && k < 4) {
						for (var l = k; l < 3; l++) {
							code = code
									+ "<td style='border-right-style:hidden;'></td>";
						}
					}
				}
			}
		}
		code = code + "</tr>";
		$("#restaurantsTable").html(code);

		$("#all").hover(function() {
			$(this).css("text-decoration", "underline");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("text-decoration", "none");
		});
		$("#all")
				.on(
						"click",
						function() {
							$("#tableForm")
									.append(
											"<input type='hidden' name='buildingName' value='"+selectedBuildingName+"'>");
							$("#tableForm")
									.append(
											"<input type='hidden' name='floor' value='전체'>");
							$("#tableForm").submit();
						});

		for (var i = 0; i < floor_gaesu; i++) {
			$("#row" + (i + 1)).hover(function() {
				$(this).css("text-decoration", "underline");
				$(this).css("cursor", "pointer");
			}, function() {
				$(this).css("text-decoration", "none");
				$(this).css("background", "none");
			});

			$("#row" + (i + 1))
					.on(
							"click",
							function() {
								$("#tableForm")
										.append(
												"<input type='hidden' name='buildingName' value='"+selectedBuildingName+"'>");
								$("#tableForm").append(
										"<input type='hidden' name='floor' value='"
												+ $(this).text() + "'>");
								$("#tableForm").submit();
							});
		}

		for (var i = 1; i < a_count + 1; i++) {
			$("#count" + i).hover(function() {
				$(this).css("text-decoration", "underline");
			}, function() {
				$(this).css("text-decoration", "none");
			});
		}
	};

	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : "${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
									type : "post",
									data : {
										'buildingName' : '${requestScope.selectedBuildingName}'
									},
									dataType : "json",
									beforeSend : function() {
										if (eval("${empty requestScope.selectedBuildingName}")) {
											return false;
										} else {
											selectedBuildingName = "${requestScope.selectedBuildingName}";
										}
									},
									success : restaurantsTableSetting
								});

						$("#uspace2")
								.hover(
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/U-space-2.png')");
										},
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
										});
						$("#uspace2")
								.on(
										"click",
										function() {
											selectedBuildingName = '유스페이스 2동';
											$
													.ajax({
														url : "${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
														type : "post",
														data : {
															'buildingName' : '유스페이스 2동'
														},
														dataType : "json",
														success : restaurantsTableSetting
													});
										});

						$("#uspace1")
								.hover(
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/U-space-1.png')");
										},
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
										});
						$("#uspace1")
								.on(
										"click",
										function() {
											selectedBuildingName = '유스페이스 1동';
											$
													.ajax({
														url : "${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
														type : "post",
														data : {
															'buildingName' : '유스페이스 1동'
														},
														dataType : "json",
														success : restaurantsTableSetting
													});
										});

						$("#hsquare-n")
								.hover(
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/H-square-N.png')");
										},
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
										});
						$("#hsquare-n")
								.on(
										"click",
										function() {
											selectedBuildingName = 'H스퀘어 N동';
											$
													.ajax({
														url : "${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
														type : "post",
														data : {
															'buildingName' : 'H스퀘어 N동'
														},
														dataType : "json",
														success : restaurantsTableSetting
													});
										});

						$("#hsquare-s")
								.hover(
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/H-square-S.png')");
										},
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
										});
						$("#hsquare-s")
								.on(
										"click",
										function() {
											selectedBuildingName = 'H스퀘어 S동';
											$
													.ajax({
														url : "${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
														type : "post",
														data : {
															'buildingName' : 'H스퀘어 S동'
														},
														dataType : "json",
														success : restaurantsTableSetting
													});
										});

						$("#hipex-a")
								.hover(
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/Samhwan-A.png')");
										},
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
										});
						$("#hipex-a")
								.on(
										"click",
										function() {
											selectedBuildingName = '삼환하이펙스 A동';
											$
													.ajax({
														url : "${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
														type : "post",
														data : {
															'buildingName' : '삼환하이펙스 A동'
														},
														dataType : "json",
														success : restaurantsTableSetting
													});
										});

						$("#hipex-b")
								.hover(
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/Samhwan-B.png')");
										},
										function() {
											$("#pangyo-map")
													.css("background-image",
															"url('${initParam.rootPath }/uploadPhoto/pangyo-map.png')");
										});
						$("#hipex-b")
								.on(
										"click",
										function() {
											selectedBuildingName = '삼환하이펙스 B동';
											$
													.ajax({
														url : "${initParam.rootPath}/restaurant/ajax/getRestaurantsByBuildingName.do",
														type : "post",
														data : {
															'buildingName' : '삼환하이펙스 B동'
														},
														dataType : "json",
														success : restaurantsTableSetting
													});
										});
					});
</script>
</head>
<body>
	<div align="center">
		<div id="pangyo-map" style="margin-bottom: 33px; border-color: white; width: 642px; height: 426px; background-image: url(http://127.0.0.1:8088/WTP05_YMZ/uploadPhoto/pangyo-map.png);">
		
			<!-- u-space2동 -->
			<div id="uspace2">
				<ul style="margin-left: 128px; margin-top: 68px; width: 59px; height: 95px; float:left">
				<ul style="margin-left: 60px; margin-top: 47px; width: 82px; height: 75px; float:left">
				<ul style="margin-left: 83px; margin-top: 0px; width:20px; height: 60px; float:left">
				</ul>	</ul>	</ul>
			</div>
			
			<!-- u-space1동 -->
			<div id="uspace1">
				<ul style="margin-left: -97px; margin-top: 197px; width: 61px; height: 86px; float:left">
				<ul style="margin-left: 61px; margin-top: -10px; width: 70px; height: 60px; float:left">
				</ul></ul>
			</div>
			
			<!-- h-squareN동 -->
			<div id="hsquare-n">
				<ul style="margin-left: 95px; margin-top: 176px; width: 58px; height: 47px; float:left">
				<ul style="margin-left: 60px; margin-top: 24px; width: 58px; height: 38px; float:left">
				</ul></ul>
			</div>
			
			<!-- h-squareS동 -->
			<div id="hsquare-s">
				<ul style="margin-left: -105px; margin-top: 220px; width: 58px; height: 27px; float:left">
				<ul style="margin-left: 24px; margin-top: 27px; width: 90px; height: 34px; float:left">
				</ul></ul>
			</div>
			
			<!-- 삼환A동 -->			
			<div id="hipex-a">
				<ul style="margin-left: 106px; margin-top: 235px; width: 93px; height: 45px; float:left">
				</ul>
			</div>
			
			<!-- 삼환B동 -->
			<div id="hipex-b">
				<ul style="margin-left: 248px; margin-top: 0px; width: 93px; height: 47px; float:left">
				</ul>
			</div>
			</div>
			</div>
		
		<form id="tableForm"
			action="${initParam.rootPath }/restaurant/boardByLocation.do">
			<table border="1" style="width: 100%;" id="restaurantsTable">
				<tr>
					<td align="center" style="border-style: hidden;"><font
						size="5">지도에서 건물을 선택하세요</font></td>
				</tr>
			</table>
		</form>

	

</body>
</html>
