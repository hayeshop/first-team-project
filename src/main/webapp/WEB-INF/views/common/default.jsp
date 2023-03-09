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
	<link rel="stylesheet" href="../resources/css/main.css?ver=2" type="text/css">
	
	<script>
	  // 검색 기능
	  function send()
	  {
		  document.search_form.submit();
	  }
	</script>
</head>
  <decorator:head/>
<body>
	<header>
	<div id="top"> <!-- top 로그인,회원가입 / 장바구니, 마이페이지-->
		<div id="left"><a href="../main/main"><img src="../resources/img/logo4.jpg" width="180px"></a></div>
		<div id="right">
		<c:if test="${userid==null}">
		  <a href="../login/login"> 로그인</a> | <a href="../member/member_input">회원가입</a>
		</c:if>
		<c:if test="${userid!=null}">
		  <a href="../mypage/mypage">${name}님</a>,	<a href="../login/logout">로그아웃</a>
		</c:if>
		   | <a>장바구니</a>
		</div>
	</div>	
	</header>
	
	<!-- 메뉴 관련 -->
	<nav>
	<ul class="menu"> 
	  <li style="height:40px;"> <a href="../product/pro_home">가구홈</a></li>	
	  <li> <a href="#">커뮤니티</a> </li>
      <li> <a href="../customer/custom">고객센터</a> </li>
      <li> <div class="search">
      	   <form name="search_form" method="post" action="search">
		     <input type="text" placeholder="검색어를 입력하세요." name="search_text" maxlength="50"/>
		     <div class="icon" onclick="send()"><img src="../resources/img/search.png" width="20px"></div>
      	   </form>
		   </div>
	  </li>
	</ul>
	</nav>
  <decorator:body/>
  	<footer>
  	<div id="bottom">
  		<div id="footer_logo">
  			<img src="../resources/img/logo3.jpg" width="140px">
  		</div>
  		<div id="address">
  			<ul>
  				<li>Gyeonggi-do</li>
  				<li>TEL:031-123-4567 Email : mola@email.com</li>
  				<li>COPYRIGHT (C) 하예 ALL RIGHTS RESERVED</li>
  				<li><a style="text-decoration:none;color:grey;font-size:13px;" href="../admin/adminmain">관리자</a></li>
  			</ul>
  		</div>
  	</div>
  	</footer>
</body>
</html>