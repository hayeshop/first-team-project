<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</style>
</head>
<body>
	<section>
	<div id="product">
	  <c:forEach items="${plist}" var="pvo">	  
	  <div>
	    <div><img src="../resources/product/${pvo.img1}" width="60"></div>
	    <div>${pvo.title}</div>
	    <div>${pvo.price}</div>
	  </div>
	  </c:forEach>
	</div>
	
	<!-- 페이징 처리 -->
	<div align="center">
	
	<!-- 10페이지 전 -->
	<c:if test="${pstart != 1}">
          <a href="pro_home?page=${pstart-1}"> &#9194; </a>
    </c:if>
    <c:if test="${pstart == 1}">
      <span style="color:grey;cursor:default"> &#9194; </span>
    </c:if>
    
    <!-- 1페이지 전 -->
    <c:if test="${page != 1}">
      <a href="pro_home?page=${page-1}"> &#9664; </a>
    </c:if>
    <c:if test="${page == 1}">
      <span style="color:grey;cursor:default"> &#9664; </span>
    </c:if>
	
	<!-- 페이지 -->
	<c:forEach begin="${pstart}" end="${pend}" var="i">
	  <c:if test="${page!=i}">
	    <a href="pro_home?page=${i}">${i}</a>
	  </c:if>
	  <c:if test="${page==i}">
	    <span style="color:navy;font-weight:bold;cursor:default">${i}</span>
	  </c:if>
	</c:forEach>
	
	<!-- 1페이지 후 -->
	<c:if test="${page != chong}">
      <a href="pro_home?page=${page+1}"> &#9654; </a>
    </c:if>
    <c:if test="${page == chong}">
      <span style="color:grey;cursor:default"> &#9654; </span>
    </c:if>
         
	<!-- 10페이지 후 -->
	<c:if test="${pend != chong}">
      <a href="pro_home?page=${pend+1}"> &#9193; </a>
    </c:if>
    <c:if test="${pend == chong}">
      <span style="color:grey;cursor:default"> &#9193; </span>
    </c:if>
	</div>
	</section>
</body>
</html>