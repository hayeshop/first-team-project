<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body {
	  margin:0px;
	}
	
	#top {
	  width:1000px;
      height:150px;
      margin:auto;
	}
	
	#top #left {
	  width: 700px;
	  height:150px;
	  float: left;
	  text-align: center;
	}
	
	#top #right {
	  width: 300px;
	  heigth: 150px;
	  float: right;
	  text-align: center;
	}
	nav {
		width:1000px;
		height:40px;
		margin:auto;
	}
	nav a {
		text-decoration:none;
		color:black;
	}
	nav a:hover {
		color:lightblue;
	}
	nav #menu {
		padding-left:0px;
	}
	nav #menu > li {
	  list-style-type:none;
	  display:inline-block;
	  width:130px;
	  height:40px;
	  text-align:center;
	}
	nav #menu > li:first-child {
		width:200px;
	}
	nav #menu > li:last-child {
		width:230px;
	}
	nav #category {
		position:relative;
	}
	nav #category .dae {
		position:absolute;
		left:63px;
		top:30px;
		padding-left:0px;
		background:white;
		border:1px solid lightblue;
		padding:4px;
		display:none;
	}
	nav .dae li {
		position:relative;
	}
	nav .dae .jung {
		position:absolute;
		left:70px;
		top:-5px;
		padding-left:0px;
		border:1px solid lightblue;
		background:white;
		display:none;
		padding:4px;
	}
	nav .dae .jung > li {
		list-style-type:none;
		width:62px;
		height:25px;
	}
	nav .jung li {
		positioon:relative;
	}
	nav .jung .so {
		position:absolute;
		left:66px;
		top:-5px;
		padding-left:0px;
		border:1px solid lightblue;
		background:white;
		display:none;
	}
	
	section {
	  width:1000px;
      height:500px;;
	}
	
	footer {
      width:1000px;
      margin:auto;
      background: skyblue;
   }
</style>
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
	  <li id="category"> 카테고리
	   <ul class="dae">
        <li> 침실가구 
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
        <li> 옷장/수납장 
		    <ul class="jung">
		        <li> <span> 옷장/붙박이장 </span> </li>
		        <li> <span> 드레스룸/행거 </span> </li>
		    </ul>
        </li>
	    <li> 거실가구 
		    <ul class="jung">
		        <li> <span> 소파 </span> </li>
		        <li> <span> 거실테이블 </span> </li>
		        <li> <span> 거실장 </span> </li>
		    </ul>
	    </li>
	    <li> 주방가구 
		    <ul class="jung">
		        <li> <span> 식기건조대 </span> </li>
		        <li> <span> 정리대/주방선반 </span> </li>
		        <li> <span> 주방수납용품 </span> </li>
		        <li> <span> 음식물쓰레기통 </span> </li>
		    </ul>
	    </li>
	    <li> 서재가구 
		    <ul class="jung">
		        <li> <span> 책상/책장/ACC </span> </li>
		        <li> <span> 서재의자 </span> </li>
		    </ul>
	    </li>
	    <li> 유아가구 
		    <ul class="jung">
		        <li> <span> 침대 </span> </li>
		        <li> <span> 옷장/수납 </span> </li>
		        <li> <span> 책상/책장 </span> </li>
		        <li> <span> 학생의자 </span> </li>
		        <li> <span> 유아 소가구 </span> </li>
		    </ul>
	    </li>
	   </ul>
	  </li>
	  <li> new </li>
      <li> best </li>
      <li> 검색폼 </li>
	</ul>
	</nav>
  <decorator:body/>
  	<footer>
  	
  	</footer>
</body>
</html>