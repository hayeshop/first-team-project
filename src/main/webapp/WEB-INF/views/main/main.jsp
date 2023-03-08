<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1000px;
		height:500px;
		margin:auto;
		margin-top:50px;
	}
	#mimage {
		width:1500px;
		height:600px;
		margin:auto;
		overflow:hidden;
	}
	#msub {
		width:7000px;
		height:600px;
		margin-left:0px;
	}
	section article {
		width:1000px;
		height:200px;
		margin:auto;
		text-align:center;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function()
	{
		move();
		$("#mimage").mouseover(function()
		{
			clearInterval(ss);
		});
		$("#mimage").mouseout(function()
		{
			move();
		});
	});
	function move()
	{
		ss=setInterval(function()
		{
			$("#msub").animate(
			{
				marginLeft:"-1500px"
			},2000,function()
				{
					$("#msub > img").eq(0).insertAfter($("#msub > img").eq(3));
					$("#msub").css("margin-left","0px");
				});
		},6000);
	}
</script>
</head>
<body>
	<!-- 슬라이드 사진 -->
	<div id="mimage">
	<div id="msub">
		<img src="../resources/img/main1.png" width="1500" height="600"><img src="../resources/img/main2.png" width="1500" height="600"><img src="../resources/img/main3.png" width="1500" height="600"><img src="../resources/img/main4.png" width="1500" height="600">
	</div>
	</div>
	<section>
		<article id="ar1">NEW</article>
		<article id="ar2">BEST</article>
		<article id="ar3">초특가 아이템</article>
	</section>
</body>
</html>