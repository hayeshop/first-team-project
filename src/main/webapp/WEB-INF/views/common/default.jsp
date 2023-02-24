<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- css파일 불러오기 -->
	<link rel="stylesheet" href="../resources/css/main.css?ver=1" type="text/css">
</head>
  <decorator:head/>
<body>
	<header>
	<div id="top"> <!-- top 로그인,회원가입 / 장바구니, 마이페이지-->
		<div id="left"><a href="../main/main" style="color:#0080c0;font-size:100px;font-weight:bold;">LOGO</a></div>
		<div id="right">  <a href="../login/login"> 로그인</a> | <a href="../member/member_input">회원가입</a> | <a>장바구니</a> | <a>마이페이지</a></div>
	</div>	
	</header>
	
	<!-- 메뉴 관련 -->
	<nav>
	<ul class="menu"> 
	  <li> <a href="#">카테고리</a>
	   <ul class="submenu">
        <li><a href="#">침실가구 </a></li>
        <li><a href="#">옷장/수납장 </a></li>
	    <li><a href="#">거실가구 </a></li>
	    <li><a href="#">주방가구 </a></li>
	    <li><a href="#">서재가구 </a></li>
	   </ul>
	  </li>	
	  <li> <a href="#">new</a> </li>
      <li> <a href="#">best</a> </li>
      <li> <a href="#">검색폼</a> </li>
	</ul>
	</nav>
  <decorator:body/>
  	<footer>
  	<div id="bottom">
  		<div id="footer_logo" style="color:#0080c0;font-size:50px;font-weight:bold;">
  			LOGO
  		</div>
  		<div id="address">
  			<ul>
  				<li>경기도</li>
  				<li>TEL:031-123-4567 Email : mola@email.com</li>
  				<li>COPYRIGHT (C) 하예 ALL RIGHTS RESERVED</li>
  			</ul>
  		</div>
  	</div>
  	</footer>
</body>
</html>