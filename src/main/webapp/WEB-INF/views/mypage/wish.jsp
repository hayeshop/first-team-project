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
	section table a {
		text-decoration:none;
		color:black;
	}
	section table a:hover {
		color:skyblue;
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
	section table span {
		display:inline-block;
		width:70px;
		height:23px;
		border:1px solid #0080c0;
		background:#0080c0;
		color:white;
		padding-top:4px;
		text-align:center;
		cursor:pointer;
		margin-left:5px;
	}
	section input[type=checkbox] {
		margin-left:20px;
		margin-right:10px;
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
</style>
<script>
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
}
function wish_del()
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
		  location="wish_del?id="+id;
}
</script>
</head>
<body>
	<section>
	  <table width="1000" align="center">
	    <caption><h3>위시리스트</h3></caption>
	    <tr>
	      <td colspan="6" align="left">
	        <input type="checkbox" onclick="maincheck(this)" id="up"> 전체선택
	        <span id="sdel" onclick="wish_del()"> 선택삭제</span>
	      </td>
	    </tr>
	    <c:forEach items="${wlist}" var="wvo">
	    <tr>
	      <td><input type="checkbox" class="csub" onclick="subcheck()" value="${wvo.id}"></td>
	      <td><img src="../resources/product/${wvo.img1}" width="100" height="70"></td>
	      <td width="450"><a href="../product/pcontent?pcode=${wvo.pcode}">${wvo.title}</a></td>
	      <td><fmt:formatNumber value="${wvo.price}" type="number"/>원</td>
	      <td>${wvo.writeday}</td>
	      <td>
	        <span style="width:100px;" onclick="location='cart_add?pcode=${wvo.pcode}'"> 장바구니 담기 </span>
	        <span style="margin-top:5px;" onclick="location='wish_del?id=${wvo.id}'"> 삭제 </span>
	      </td>
	    </tr>
	    </c:forEach>
	    <tr>
	      <td colspan="6" align="left">
	        <input type="checkbox" onclick="maincheck(this)" id="down"> 전체선택
	        <span id="sdel" onclick="wish_del()"> 선택삭제</span>
	      </td>
	    </tr>
	  </table>
	</section>
</body>
</html>