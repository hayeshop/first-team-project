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
		margin-bottom:80px;
	}
	section #title > #left {
		width:600px;
		height:500px;
		float:left;
	}
	section #title > #right {
		width:400px;
		height:500px;
		float:right;
		position:relative;
	}
	section #ptitle {
		font-size:20px;
		font-weight:bold;
		margin-top:20px;
		margin-bottom:20px;
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
		width:320px;
		height:16px;
		border-top:1px solid #0080c0;
		font-size:13px;
		padding:2px;
	}
	section #btn span {
		margin-top:100px;
		display:inline-block;
		width:130px;
		height:25px;
		border:1px solid #0080c0;
		padding-top:8px;
		padding-bottom:4px;
		text-align:center;
		background:#0080c0;
		color:#fff;
	}
	section #cart_move {
		position:absolute;
		top:395px;
		width:180px;
		height:60px;
		font-size:12px;
		border:1px solid #0080c0;
		text-align:center;
		background:#fff;
		padding-top:10px;
		visibility:hidden;
	}
	section #cart_move #btn2 {
		margin-top:10px;
		display:inline-block;
		width:120px;
		height:20px;
		border:1px solid #0080c0;
		padding:2px;
		background:#0080c0;
		color:white;
	}
	section #pmenu {
		width:1000px;
		height:40px;
		margin:auto;
	}
	section #pmenu ul {
		padding-left:0px;
	}
	section #pmenu ul li {
		float:left;
		width:248px;
		height:30px;
		border:1px solid #cccccc;
		margin-left:0px;
		border-top-width:3px;
		margin-top:30px;
		list-style:none;
		text-align:center;
		padding-top:10px;
		background:#FaFaFa;
	}
	
	section #layer {
		position:absolute;
		left:1600px;
		top:400px;
		border:2px solid grey;
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
	
	function wish(my)
	{
		var ck;
		if(my.src.indexOf("w1.png")==-1)
			var ck=1;
		else
			var ck=2;
		
		<c:if test="${userid!=null}">
		  <c:set var="chk" value="true"/>
		</c:if>
		<c:if test="${userid==null}">
		  <c:set var="chk" value="false"/>
		</c:if>
		
		if(${chk})
		{
			var chk=new XMLHttpRequest();
			chk.onload=function()
			{
				if(chk.responseText=="0")
				{
					if(ck==1)
						my.src="../resources/img/w1.png";
					else
						my.src="../resources/img/w2.png";
				}
				else
					alert("찜하기에 실패했습니다. 잠시후에 다시 시도해주세요.");
			}
			chk.open("get","wish_add?pcode=${pvo.pcode}&ck="+ck);
			chk.send();
		}
		else
			location="../login/login";
	}
	
	function cart_add()
	{
		var su=document.pform.su.value;
		var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			if(chk.responseText=="0")
			{
				document.getElementById("cart_move").style.visibility="visible";
				setTimeout(function()
				{
					document.getElementById("cart_move").style.visibility="hidden";
				},3000);
			}
			else
			{
				location="../login/login";
			}
		}
		chk.open("get","cart_add?pcode=${pvo.pcode}&su="+su);
		chk.send();
	}
	
	function gumae()
	{
		document.pform.submit();
	}
	
	$(document).on('click', '.pli', function(e){
	    e.preventDefault();  
	  $(this).css('border-top', '3px solid black');
	  $(this).css('background', '#fff');
	   $('.pli').not($(this)).css('border-top', '3px solid #cccccc');
	   $('.pli').not($(this)).css('background', '#FaFaFa');
	})
	
	function movelayer()
	{
		var top=document.documentElement.scrollTop;
		document.getElementById("layer").style.top=(top+400)+"px";
	}
	document.onscroll=movelayer;
	
	function moveTop()
	{
		document.documentElement.scrollTop=0;
	}
</script>
</head>
<body>
	<section>
	  <!-- 최근 본 상품 -->
	  <div id="layer">
	    <c:forEach items="${plist2}" var="pvo">
	      <a href="pcontent?pcode=${pvo.pcode}"><div><img src="../resources/product/${pvo.img1}" width="70"></div></a> <br>
	    </c:forEach>
	    <div align="center" onclick="moveTop()" style="cursor:pointer">△ TOP</div>
	  </div>
	
	  <div id="title">
	    <div id="left"><img src="../resources/product/${pvo.img1}" width="500"></div>
	    <div id="right">
	      <div id="cart_move">
	        <span>상품이 장바구니에 담겼습니다.</span>
	        <span id="btn2" onclick="location='../mypage/cart'" style="cursor:pointer">장바구니로 이동</span>
	      </div>
	      <form name="pform" method="post" action="gumae">
	        <input type="hidden" name="pcode" value="${pvo.pcode}">
	        <div style="font-size:14px;">${pvo.made}</div>
	        <div id="ptitle">${pvo.title}</div>
	        <div>${pvo.halin}% <s style="color:grey"><fmt:formatNumber value="${pvo.price}" type="number"/>원</s></div>
	        <div style="color:red;font-weight:bold;font-size:20px;"><fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" pattern="#,###" type="number"/>원</div>
	        <div style="font-size:14px">
	          <c:if test="${pvo.baesong==0}">
				무료배송
			  </c:if>
			  <c:if test="${pvo.baesong!=0}">
				배송비: <fmt:formatNumber value="${pvo.baesong}" type="number"/>원
			  </c:if>
	        </div>
	        <div id="juk"><span>최대 <fmt:formatNumber value="${pvo.price*(pvo.juk/100)}" pattern="#,###" type="number"/>원 적립</span></div>
	        <div id="suform">
			  <input type="text" name="su" id="su" value="1" readonly>
			</div>
			<div id="btn" style="clear:both">
			  <span onclick="cart_add()" style="cursor:pointer;margin-right:10px;">장바구니</span> 
			  <span onclick="order()" style="cursor:pointer;margin-right:10px;">구매하기</span>
			  <c:if test="${wcnt==0 || wcnt==null}">
			    <img src="../resources/img/w1.png" style="cursor:pointer" width="32" valign="bottom" onclick="wish(this)">
			  </c:if>
			  <c:if test="${wcnt!=0 && wcnt!=null}">
			    <img src="../resources/img/w2.png" style="cursor:pointer" width="32" valign="bottom" onclick="wish(this)">
			  </c:if>
		    </div>
	      </form>
	    </div>
	  </div>
	  <div id="pmenu">
	  	<ul>
	  	  <li class="pli">상품상세</li>
	  	  <li class="pli">상품후기</li>
	  	  <li class="pli">상품문의</li>
	  	  <li class="pli">배송/교환/환불 안내</li>
	  	</ul>
	  </div>
	  <div id="pcontent" align="center">
	    <c:forEach begin="1" end="${im_leng-1}" var="i">
	  	  <img src="../resources/product/${img2[i]}" width="750" height="850" style="margin-top:50px;">
	    </c:forEach>
	  </div>
	</section>
</body>
</html>