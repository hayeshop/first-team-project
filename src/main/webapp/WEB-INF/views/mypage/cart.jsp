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
		margin-top:100px;
	}
	section table {
		border-spacing:0;
		padding-top:50px;
		padding-bottom:250px;
	}
	section table td {
		height:80px;
		font-size:15px;
		border-bottom:1px solid #0080c0;
	}
	section table tr:first-child td {
		border-top:2px solid #0080c0;
	}
	section table tr:last-child td {
		border-bottom:2px solid #0080c0;
	}
	section table #cdel {
		display:inline-block;
		width:70px;
		height:23px;
		border:1px solid #0080c0;
		background:#0080c0;
		color:white;
		padding-top:4px;
		text-align:center;
		cursor:pointer;
	}
	section input[type=submit] {
		width:400px;
		height:54px;
		background:#0080c0;
		color:#fff;
		font-size:18px;
		font-weight:bold;
		border:1px solid #0080c0;
		cursor:pointer;
	}
	section input[type=submit]:disabled {
		background:#fff;
		color:#0080c0;
	}
	section input[type=checkbox] {
		margin-left:10px;
		margin-right:10px;
	}
	section .su {
		width:50px;
		height:20px;
		outline:none;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" >
<script>
  $(function()
  {
	  var $imsi=$(".su");
	  $(".su").spinner(
	  {
		  min:1,
		  max:10,
		  spin:function(e,ui)
		  {
			  var n=$imsi.index(this);
			  var pr=document.getElementsByClassName("pr")[n].value;
			  var price=ui.value*pr;
			  price=comma(price);
			  document.getElementsByClassName("prin")[n].innerText=price+"원";
			  
			  var pcode=document.getElementsByClassName("pcode")[n].value;
			  var su=ui.value;
			  
			  var chk=new XMLHttpRequest();
			  chk.onload=function()
			  {
				  if(chk.responseText=="1")
					  alert("오류가 발생했습니다. 잠시후에 다시 시도해주세요.");
			  }
			  chk.open("get","cart_su?pcode="+pcode+"&su="+su);
			  chk.send();
		  }
	  });
  });
  
  function comma(num)
  {
	  return new Intl.NumberFormat().format(num);
  }
  
  function maincheck(my)
  {
	  var csub=document.getElementsByClassName("csub");
	  
	  var len=csub.length;
	  
	  if(my.checked)
	  {
		  for(i=0;i<len;i++)
		  {
			  csub[i].checked=true;
		  }
		  document.getElementById("up").checked=true;
		  document.getElementById("down").checked=true;
	  }
	  else
	  {
		  for(i=0;i<len;i++)
		  {
			  csub[i].checked=false;
		  }
		  document.getElementById("up").checked=false;
		  document.getElementById("down").checked=false;
	  }
	  
	  price_cal();
	  
	  var n=0;
	  for(i=0;i<len;i++)
	  {
		  if(csub[i].checked)
			  n++;
	  }
	  if(n==0)
		  document.gform.submit.disabled=true;
	  else
		  document.gform.submit.disabled=false;
  }
  function subcheck()
  {
	  var csub=document.getElementsByClassName("csub");
	  var len=csub.length;
	  var n=0;
	  
	  for(i=0;i<len;i++)
	  {
		  if(csub[i].checked)
			  n++;
	  }

	  if(len==n)
	  {
		  document.getElementById("up").checked=true;
		  document.getElementById("down").checked=true;
	  }
	  else
	  {
	      document.getElementById("up").checked=false;
		  document.getElementById("down").checked=false;
	  }
		
	  if(n==0)
		  document.gform.submit.disabled=true;
	  else
		  document.gform.submit.disabled=false;
		
	  price_cal();
  }
  
  var proprice=[${proprice}];
  var prohalin=[${prohalin}];
  var probae=[${probae}];
  function price_cal()
  {
	  var csub=document.getElementsByClassName("csub");
	  var len=csub.length;
	  
	  var chongprice=0;
	  var halin=0;
	  var bprice=0;
	  var totalpcode="";
	  var totalsu="";
	  for(i=0;i<len;i++)
	  {
		  if(csub[i].checked)
		  {
			  var su=document.getElementsByClassName("su")[i].value;
			  chongprice=chongprice+proprice[i]*su;
			  halin=halin+prohalin[i]*su;
			  bprice=bprice+probae[i];
			  totalpcode=totalpcode+document.getElementsByClassName("pcode")[i].value+",";
			  totalsu=totalsu+document.getElementsByClassName("su")[i].value+",";
		  }
	  }
	  
	  document.gform.pcode.value=totalpcode;
	  document.gform.su.value=totalpcode;
	  
	  cprice=chongprice+bprice-halin;
	  
	  document.getElementById("chongprice").innerText=comma(chongprice)+"원";
	  document.getElementById("halin").innerText=comma(halin)+"원";
	  document.getElementById("cprice").innerText=comma(cprice)+"원";
	  document.getElementById("bprice").innerText=comma(bprice)+"원";	  
  }
  
  function cart_del()
  {
	  var id="";
	  var csub=document.getElementsByClassName("csub");
	  var len=csub.length;
	  
	  for(i=0;i<len;i++)
	  {
		  if(csub[i].checked)
			  id=id+csub[i].value+",";
	  }
	  
	  if(id!="")
		  location="cart_del?id="+id;
  }
</script>
</head>
<body>
	<section>
	  <table width="1000" align="center">
	  	<caption><h3>장바구니</h3></caption>
	  	<tr>
	  	  <td colspan="7" align="left">
	  	    <input type="checkbox" onclick="maincheck(this)" id="up"> 전체선택
	  	    <span id="cdel" onclick="cartdel()"> 선택 삭제</span>
	  	  </td>
	  	</tr>
	  	<c:forEach items="${clist}" var="cvo">
	  	<input type="hidden" class="pr" value="${(cvo.price-(cvo.price*(cvo.halin/100)))}">
	  	<input type="hidden" class="pcode" value="${cvo.pcode}">
	  	<input type="hidden" class="baesong" value="${cvo.baesong}">
	  	<tr>
	  	  <td><input type="checkbox" class="csub" onclick="subcheck()" value="${cvo.id}"></td>
	  	  <td><img src="../resources/product/${cvo.img1}" width="100"></td>
	  	  <td><a href="../product/pcontent?pcode=${cvo.pcode}">${cvo.title}</a></td>
	  	  <td><input type="text" name="su" class="su" value="${cvo.su}"></td>
	  	  <td class="prin"><fmt:formatNumber value="${(cvo.price-(cvo.price*(cvo.halin/100)))*cvo.su+cvo.baesong}" pattern="#,###" type="number"/>원</td>
		  <td>${cvo.writeday}</td>
		  <td>
		    <span id="cdel" style="margin-top:5px;" onclick="location='cart_del?id=${cvo.id}'">삭제</span>
		  </td>
	  	</tr>
	  	</c:forEach>
	  	<tr>
	  	  <td colspan="7" align="left">
	  	    <input type="checkbox" onclick="maincheck(this)" id="down"> 전체선택
	  	    <span id="cdel" onclick="cart_del()"> 선택 삭제</span>
	  	  </td>
	  	</tr>
	  	<tr>
	  	  <td colspan="7" align="right">
	  	      총 상품 가격: <span id="chongprice">0원</span>
	  	      총 할인 가격: <span id="halin">0원</span>
	  	      총 배송비 금액: <span id="bprice">0원</span>
	  	      총 결제 금액: <span id="cprice">0원</span>
	  	  </td>
	  	</tr>
	  	<tr>
	  	  <td colspan="7" align="center">
	  	    <form name="gform" method="post" action="../product/gumae">
	  	      <input type="hidden" name="pcode">
	  	      <input type="hidden" name="su">
	  	      <input type="submit" value="구매하기" name="submit" disabled>
	  	    </form>
	  	  </td>
	  	</tr>
	  </table>
	</section>
<style>
  #chongprice,#halin,#bprice {
  	font-size:16px;
  	color:#0080c0;
  	font-weight:900;
  }
  #cprice {
  	font-size:18px;
  	color:#0080c0;
  	font-weight:900;
  }
</style>
</body>
</html>