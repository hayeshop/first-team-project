<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1000px;
		height:800px;
		margin:auto;
		margin-top:50px;
	}
	#mimage {
		width:1000px;
		height:400px;
		margin:auto;
		overflow:hidden;
	}
	#msub {
		width:7000px;
		height:400px;
		margin-left:0px;
	}
	section article {
		width:1000px;
		height:400px;
		margin:auto;
		text-align:center;
	}
	section table td {
		width:246px;
		vertical-align:top;
		height:250px;
		border:1px solid white;
		padding:3px;
	}
	section table td div {
		width:188px;
	}
	section table td:hover {
		border:1px solid #a8bfc8;
		cursor:pointer;
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
				marginLeft:"-1000px"
			},3000,function()
				{
					$("#msub > img").eq(0).insertAfter($("#msub > img").eq(3));
					$("#msub").css("margin-left","0px");
				});
		},4500);
	}
</script>
</head>
<body>
	<!-- 슬라이드 사진 -->
	<div id="mimage">
	<div id="msub">
		<img src="../resources/img/main1.png" width="1000" height="400"><img src="../resources/img/main2.png" width="1000" height="400"><img src="../resources/img/main3.png" width="1000" height="400"><img src="../resources/img/main4.png" width="1000" height="400">
	</div>
	</div>
	<section>
		<article id="ar1">NEW
		<table align="center" width="850">
	  <tr>
	  <c:forEach items="${plist}" var="pvo" varStatus="sts">	
	    <td onclick="location='../product/pcontent?pcode=${pvo.pcode}'">
	      <div align="center" width="140px"><img src="../resources/product/${pvo.img1}" width="180" height="140"></div>
	      <div><b>${pvo.title}</b></div>
	      <div>${pvo.halin}% <s><fmt:formatNumber value="${pvo.price}" type="number"/>원</s></div>
	      <div style="color:red;font-weight:bold;"><fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin)/100)}" type="number" pattern="#,###"/>원</div>
	    </td>
	    <c:if test="${sts.count%5==0 }">
		  </tr>
		  <tr>  
	    </c:if>
	  </c:forEach>
	  </table>
	</section>
</body>
</html>