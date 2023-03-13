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
		margin:auto;
		margin-top:50px;
	}
	section #title {
		width:1000px;
		height:500px;
		margin:auto;
	}
	section #title > #left {
		width:500px;
		height:500px;
		float:left;
	}
	section #title > #right {
		width:450px;
		height:500px;
		float:right;
		position:relative;
	}
	section #ptitle {
		font-size:20px;
		font-weight:bold;
	}
	section #suform {
		margin-top:30px;
	}
	section #su {
		outline:none;
		width:40px;
		height:20px;
	}
	section #juk span {
		margin-top:10px;
		display:inline-block;
		width:134px;
		height:16px;
		border:1px solid #0080c0;
		border-radius:12px;
		font-size:13px;
		text-align:center;
		padding:2px;
	}
	section #btn span {
		margin-top:30px;
		display:inline-block;
		width:130px;
		height:25px;
		border:1px solid #0080c0;
		padding-top:4px;
		padding-bottom:4px;
		text-align:center;
		background:#0080c0;
		color:#fff;
	}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" >
<script>
	$(function()
	{
		$("#su").spinner(
		{
			min:1,
			max:10,
			spin:function(e,ui)	// spinner의 값을 바꿀 때 실행되는 함수
			{
				// alert(ui.value);
			}
		});
	});
</script>
</head>
<body>
	<section>
	  <div id="title">
	    <div id="left"><img src="../resources/product/${pvo.img1}" width="400"></div>
	    <div id="right">
	      <form name="pform" method="post" action="gumae">
	        <input type="hidden" name="pcode" value="${pvo.pcode}">
	        <div style="font-size:14px;">${pvo.made}</div>
	        <div id="ptitle">${pvo.title}</div>
	        <div>${pvo.halin}% <s style="color:grey"><fmt:formatNumber value="${pvo.price}" type="number"/>원</s></div>
	        <div style="color:red;font-weight:bold;"><fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" pattern="#,###" type="number"/>원</div>
	        <div id="juk"><span>최대 <fmt:formatNumber value="${pvo.price*(pvo.juk/100)}" pattern="#,###" type="number"/>원 적립</span></div>
	        <div style="font-size:14px">
	          <c:if test="${pvo.baesong==0}">
				무료배송
			  </c:if>
			  <c:if test="${pvo.baesong!=0}">
				배송비: <fmt:formatNumber value="${pvo.baesong}" type="number"/>원
			  </c:if>
	        </div>
	        <div id="suform">
			  <input type="text" name="su" id="su" value="1" readonly>
			</div>
			<div id="btn" style="clear:both">
				<span onclick="cart_add()" style="cursor:pointer;">장바구니</span> 
				<span onclick="gumae()" style="cursor:pointer;">구매하기</span>
		    </div>
	      </form>
	    </div>
	  </div>
	</section>
</body>
</html>