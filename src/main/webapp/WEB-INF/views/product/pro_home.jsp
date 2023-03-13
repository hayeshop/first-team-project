<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	section a {
		text-decoration:none;
		color:black;
	}
	section a:hover {
		color:skyblue;
	}
	section ul {
		list-style:none;
		padding:0px;
		margin:0px;
		width:120px;
		height:100%;
		overflow:auto;
		position:absolute;
	}
	section li a {
		text-decoration:none;
		padding:10px;
		display:block;
		font-weight:bold;
	}
	section li a:hover {
		background:#333;
		color:#fff;
	}
	section #product {
		margin-left:140px;
	}
	section .menu {
		background:#333;
		color:#fff;
	}
	section table td {
		width:246px;
		vertical-align:top;
		height:300px;
		border:1px solid white;
		padding:3px;
	}
	section table td div {
		width:180px;
	}
	section table td:hover {
		border:1px solid #a8bfc8;
		cursor:pointer;
	}
	section #navi {
		margin-bottom:20px;
		margin-left:3px;
		font-weight:bold;
	}
</style>
</head>
<body>
	<section>
	<ul>
	  <li><a class="menu" href="pro_home?pcode=p0">가구</a></li>
	  <li><a href="pro_home?pcode=p01">침실가구</a></li>
	  <li><a href="pro_home?pcode=p02">옷장/수납장</a></li>
	  <li><a href="pro_home?pcode=p03">거실가구</a></li>
	  <li><a href="pro_home?pcode=p04">주방가구</a></li>
	  <li><a href="pro_home?pcode=p05">서재가구</a></li>
	</ul>

	<div id="product">
		<div id="navi"> <a href="pro_home?pcode=p0">가구</a>
		  <c:if test="${pcode eq 'p01'}"> > <a href="pro_home?pcode=p01">침실가구</a></c:if>
		  <c:if test="${pcode eq 'p02'}"> > <a href="pro_home?pcode=p02">옷장/수납장</a></c:if>
		  <c:if test="${pcode eq 'p03'}"> > <a href="pro_home?pcode=p03">거실가구</a></c:if>
		  <c:if test="${pcode eq 'p04'}"> > <a href="pro_home?pcode=p04">주방가구</a></c:if>
		  <c:if test="${pcode eq 'p05'}"> > <a href="pro_home?pcode=p05">서재가구</a></c:if>
		</div>
	  <table align="center" width="850">
	  <tr>
	  <c:forEach items="${plist}" var="pvo" varStatus="sts">	
	    <td onclick="location='pcontent?pcode=${pvo.pcode}'">
	      <div align="center" width="140px"><img src="../resources/product/${pvo.img1}" width="180" height="140"></div>
	      <div><b>${pvo.title}</b></div>
	      <div>${pvo.halin}% <s><fmt:formatNumber value="${pvo.price}" type="number"/>원</s></div>
	      <div style="color:red;font-weight:bold;"><fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin)/100)}" type="number" pattern="#,###"/>원</div>
	      <div style="font-size:14px;">최대 <fmt:formatNumber value="${Math.floor(pvo.price*(pvo.juk/100))}" type="number"/>원 적립</div>
	    </td>
	  <c:if test="${sts.count%4==0 }">
	  </tr>
	  <tr>  
	  </c:if>
	  </c:forEach>
	  </table>
	
	<!-- 페이징 처리 -->
	<div align="center">
	
	<!-- 10페이지 전 -->
	<c:if test="${pstart != 1}">
          <a href="pro_home?pcode=${pcode}&page=${pstart-1}"> &#9194; </a>
    </c:if>
    <c:if test="${pstart == 1}">
      <span style="color:grey;cursor:default"> &#9194; </span>
    </c:if>
    
    <!-- 1페이지 전 -->
    <c:if test="${page != 1}">
      <a href="pro_home?pcode=${pcode}&page=${page-1}"> &#9664; </a>
    </c:if>
    <c:if test="${page == 1}">
      <span style="color:grey;cursor:default"> &#9664; </span>
    </c:if>
	
	<!-- 페이지 -->
	<c:forEach begin="${pstart}" end="${pend}" var="i">
	  <c:if test="${page!=i}">
	    <a href="pro_home?pcode=${pcode}&page=${i}">${i}</a>
	  </c:if>
	  <c:if test="${page==i}">
	    <span style="color:navy;font-weight:bold;cursor:default">${i}</span>
	  </c:if>
	</c:forEach>
	
	<!-- 1페이지 후 -->
	<c:if test="${page != chong}">
      <a href="pro_home?pcode=${pcode}&page=${page+1}"> &#9654; </a>
    </c:if>
    <c:if test="${page == chong}">
      <span style="color:grey;cursor:default"> &#9654; </span>
    </c:if>
         
	<!-- 10페이지 후 -->
	<c:if test="${pend != chong}">
      <a href="pro_home?pcode=${pcode}&page=${pend+1}"> &#9193; </a>
    </c:if>
    <c:if test="${pend == chong}">
      <span style="color:grey;cursor:default"> &#9193; </span>
    </c:if>
	</div>
	</div>
	</section>
</body>
</html>