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
	<div align="center">
	
	<c:forEach begin="${pstart}" end="${pend}" var="i">
	  <c:if test="${page!=i}">
	    <a href="pro_home?page=${i}">${i}</a>
	  </c:if>
	  <c:if test="${page==i}">
	    <a style="color:navy;font-weight:bold">${i}</a>
	  </c:if>
	</c:forEach>
	
	</div>
	</section>
</body>
</html>