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
</style>
</head>
<body>
	<section>
	  <table width="1000" align="center">
	  	<caption><h3>장바구니</h3></caption>
	  	<c:forEach items="${clist}" var="cvo">
	  	<tr>
	  	  <td><input type="checkbox" class="csub" onclick="subcheck()" value="${cvo.id}"></td>
	  	  <td><img src="../resources/product/${cvo.img1}" width="100"></td>
	  	  <td><a href="../product/pcontent?pcode=${cvo.pcode}">${cvo.title}</a></td>
	  	  <td><input type="text" name="su" class="su" value="${cvo.su}"></td>
	  	  <td class="prin"><fmt:formatNumber value="${(cvo.price-(cvo.price*(cvo.halin/100)))*cvo.su+cvo.baesong}" pattern="#,###" type="number"/>원</td>
		  <td>${cvo.writeday}</td>
		  <td>
		    <span id="cdel" style="margin-top:5px;" onclick="location='cartdel?id=${cvo.id}'">삭제</span>
		  </td>
	  	</tr>
	  	</c:forEach>
	  </table>
	</section>
</body>
</html>