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
	<link rel="stylesheet" href="../resources/css/main.css" type="text/css">
	<script>
	  var cnt=0;
	  function show_jung(n)
	  {
	  	cnt++;
	  	if(cnt%2!=0)
	  	{
	  		document.getElementsByClassName("jung")[n].style.height="300px";
	  	}
	  	else
	  	{
	  		document.getElementsByClassName("jung")[n].style.height="0px";
	  	}
	  }
	</script>
</head>
  <decorator:head/>
<body>
	<header>
	<div id="top"> <!-- top 로그인,회원가입 / 로고 / 장바구니 / 마이페이지-->
		<div id="left"> <a href="../login/login"> 로그인</a> | <a href="../member/member_input">회원가입</a> | 로고 | </div>
		<div id="right"> 장바구니 | 마이페이지</div>
	</div>	
	</header>
	
	<!-- 메뉴 관련 -->
	<nav>
	<ul id="menu"> 
	  <li> 카테고리
	   <ul class="dae">
        <li onclick="show_jung(0)"> 침실가구 
	        <ul class="jung">
	        	<li> <span> 킹사이즈 </span> 
	        		<ul class="so">
	        		  <li> <span> 일반침대 </span> </li>
	        		  <li> <span> 전동침대 </span> </li>
	        		  <li> <span> 수납침대 </span> </li>
	        		</ul>
	        	</li>
	        	<li> <span> 퀸사이즈 </span> 
	        		<ul class="so">
	        		  <li> <span> 일반침대 </span> </li>
	        		  <li> <span> 전동침대 </span> </li>
	        		  <li> <span> 수납침대 </span> </li>
	        		</ul>
	        	</li>
	        	<li> <span> 싱글사이즈 </span> 
	        		<ul class="so">
	        		  <li> <span> 일반침대 </span> </li>
	        		  <li> <span> 전동침대 </span> </li>
	        		  <li> <span> 수납침대 </span> </li>
	        		</ul>
	        	</li>
	        	<li> <span> 슈퍼싱글사이즈 </span> 
	        		<ul class="so">
	        		  <li> <span> 일반침대 </span> </li>
	        		  <li> <span> 전동침대 </span> </li>
	        		  <li> <span> 수납침대 </span> </li>
	        		</ul>
	        	</li>
	        </ul>
        </li>
        <li onclick="show_jung(1)"> 옷장/수납장 
		    <ul class="jung">
		        <li> <span> 옷장/붙박이장 </span> </li>
		        <li> <span> 드레스룸/행거 </span> </li>
		    </ul>
        </li>
	    <li onclick="show_jung(2)"> 거실가구 
		    <ul class="jung">
		        <li> <span> 소파 </span> </li>
		        <li> <span> 거실테이블 </span> </li>
		        <li> <span> 거실장 </span> </li>
		    </ul>
	    </li>
	    <li onclick="show_jung(3)"> 주방가구 
		    <ul class="jung">
		        <li> <span> 식기건조대 </span> </li>
		        <li> <span> 정리대/주방선반 </span> </li>
		        <li> <span> 주방수납용품 </span> </li>
		        <li> <span> 음식물쓰레기통 </span> </li>
		    </ul>
	    </li>
	    <li onclick="show_jung(4)"> 서재가구 
		    <ul class="jung">
		        <li> <span> 책상/책장/ACC </span> </li>
		        <li> <span> 서재의자 </span> </li>
		    </ul>
	    </li>
	   </ul>	<!-- .dae ul태그 끝 -->
	  </li>	<!-- 카테고리 끝 -->
	  <li> new </li>
      <li> best </li>
      <li> 검색폼 </li>
	</ul>	<!-- #menu ul태그 끝 -->
	</nav>
  <decorator:body/>
  	<footer>
  	
  	</footer>
</body>
</html>
