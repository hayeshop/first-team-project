<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1000px;
		margin:auto;
		margin-top:60px;
	}
	section .box {
		width:100px;
		height:100px;
		border:2px solid #98ACC2;
		padding:10px;
		border-radius:5px;
		text-align:center;
		display:inline-block;
		margin-right:10px;
	}
	section .box .num {
		margin-top:20px;
		border-top:1px solid #98ACC2;
		padding:15px;
		font-size:20px;
	}
	section .box a {
		text-decoration:none;
		color:black;
	}
	section .box a:hover {
		color:#0080c0;
	}
	section table {
		margin-top:40px;
		border-spacing:0;
	}
	section table tr:first-child td {
		border-top:2px solid #98ACC2;
	}
	section table tr:last-child td {
		border-bottom:2px solid #98ACC2;
	}
	section table td {
		height:30px;
		padding-left:10px;
	}
	section table tr td:first-child {
		background:#CAD7E6;
		padding-right:10px;
	}
	section #mu {
		font-size:14px;
		font-weight:100;
		display:inline-block;
		width:79px;
		height:14px;
		border:1px solid #aaaaaa;
		padding:3px;
		margin-left:20px;
		cursor:pointer;
	}
</style>
</head>
<body>
	<section>
	<h1>마이페이지</h1>
	<!-- 회원정보수정 -->
	<table width="1000" align="center">
	  <caption><h3 align="left">회원 정보<span onclick="location='mem_up'" id="mu">회원정보 수정</span></h3></caption>
	  <tr>
	    <td width="140">아이디</td>
	    <td>${mvo.userid}</td>
	  </tr>
	  <tr>
	    <td>이름</td>
	    <td>${mvo.name}</td>
	  </tr>
	  <tr>
	    <td>이메일</td>
	    <td>${mvo.email}</td>
	  </tr>
	</table>

	<br><br><br><br><br>
	<!-- 배송지 관리 -->
	
	<!-- 주문내역 -->
	<div class="box">
	<h3>주문내역</h3>
	<div class="num"><a href="order_list">${onum}</a></div>
	</div>
	<!-- 리뷰 쓰기 -->

	<!-- 찜한상품 -->
	<div class="box">
	<h3>위시리스트</h3>
	<div class="num"><a href="wish">${wnum}</a></div>
	</div>
	
	<!-- 장바구니 -->
	<div class="box">
	<h3>장바구니</h3>
	<div class="num"><a href="cart">${cnum}</a></div>
	</div>
	
	<!-- 문의 내역 -->
	<div class="box">
	<h3>문의 내역</h3>
	<div class="num"><a href="mtm_view">${mnum}</a></div>
	</div>
	</section>
</body>
</html>