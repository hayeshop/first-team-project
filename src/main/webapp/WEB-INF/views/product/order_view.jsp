<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	section .box_title {
		position: relative;
	    width: 1000px;
	    margin: 28px auto;
	}
	section .main_title {
		display: inline-block;
	    font-size: 30px;
	    line-height: 38px;
	    font-weight: 600;
	    margin-block-start: 0.83em;
	    margin-block-end: 0.83em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	section .box_title ul {
		list-style: none;
		display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 40px;
	}
	section .list {
		position: absolute;
	    top: 7px;
	    right: 0;
	    font-size: 0;
	}
	section .list_item {
		position: relative;
	    display: inline-block;
	    font-size: 16px;
	    line-height: 24px;
	    padding-left: 24px;
	    color: #94989f;
	    letter-spacing: -0.4px;
	}
	section .list_item:first-child::before {
    	display: none;
	}
	section .list_item:before {
	    position: absolute;
	    top: 8px;
	    left: 5px;
	    content: '';
	    width: 8px;
	    height: 8px;
	    border-top: 1px solid rgba(0, 0, 0, 0.3);
	    border-right: 1px solid rgba(0, 0, 0, 0.3);
	    transform: rotate(45deg);
    }
    section .list_item.select {
    	color: #000;
	}
	section table {
		border-spacing:0;
		margin-top:60px;
		margin-bottom:60px;
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
	section input[type=button] {
		width:300px;
		height:40px;
		font-size:16px;
		border:1px solid #0080c0;
		background:#0080c0;
		color:#fff;
		margin-top:20px;
		cursor:pointer;
		margin-bottom:80px;
	}
</style>
</head>
<body>
	<section>
	<div class="box_title">
	    <h2 class="main_title">주문완료</h2>
	    <ul class="list">
	      <li class="list_item">장바구니</li>
	      <li class="list_item" >주문결제</li>
	      <li class="list_item select">주문완료</li>
	    </ul>
	  </div>
	  <hr>
	  <table width="1000" align="center">
		  <caption> <h3 align="left"> 구매자 정보 </h3> </caption>
			<tr align="left">
				<td width="140">이름</td>
				<td>${mvo.name}</td>
			</tr>
			<tr align="left">
				<td>이메일</td>
				<td>${mvo.email}</td>
			</tr>
			<tr align="left">
				<td>휴대폰번호</td>
				<td>${mvo.phone}</td>
			</tr>
		</table>
		
		<!-- 배송지 정보 -->
		<table width="1000" align="center">
		  <caption> <h3 align="left"> 배송지 정보</h3></caption>
			<tr align="left">
				<td width="140">이름</td>
				<td> ${bvo.name} </td>
			</tr>
			<tr align="left">
				<td> 주소 </td>
				<td> ${bvo.juso} ${bvo.juso_etc} </td>
			</tr>
			<tr align="left">
				<td> 휴대폰번호 </td>
				<td> <span>${bvo.phone}</span> </td>
			</tr>
			<tr align="left">
				<td> 배송 요청사항 </td>
				<td>
				<c:if test="${bvo.cla==0}">
		      	  <c:set var="cla" value="요청사항 없음"/>
		        </c:if>
		        <c:if test="${bvo.cla==1}">
		          <c:set var="cla" value="직접 수령 (부재 시 문 앞)"/>
		        </c:if>
		        <c:if test="${bvo.cla==2}">
		          <c:set var="cla" value="문 앞"/>
		        </c:if>
		        <c:if test="${bvo.cla==3}">
		          <c:set var="cla" value="경비실"/>
		        </c:if>
		        <c:if test="${bvo.cla==4}">
		          <c:set var="cla" value="택배함"/>
		        </c:if>
				  <span>${cla}</span>
				</td>
			</tr>
		</table>
		
		<table width="1000" align="center">
		  <caption><h3 align="left">주문 정보</h3></caption>
		    <tr align="left">
		      <td width="140">주문번호</td>
		      <td>${ordercode}</td>
		    </tr>
		    <tr>
		      <td>상품명 / 수량</td>
		      <td>${ptitle} / ${su}</td>
		    </tr>
		    <tr>
			  <td>총 상품 가격</td>
			  <td><fmt:formatNumber value="${cprice}" pattern="#,###" type="number"/>원</td>
		    </tr>
		    <tr>
		      <td>사용한 적립금</td>
		      <td>-<fmt:formatNumber value="${use_juk}" pattern="#,###" type="number"/>원</td>
		    </tr>
		    <tr>
		      <td>결제 금액</td>
		      <td><fmt:formatNumber value="${payprice}" pattern="#,###" type="number"/>원</td>
		    </tr>
		    <tr>
		      <td>결제 수단</td>
		      <td>
		        <c:if test="${pay==0}">
		        	무통장 입금
		        </c:if>
		        <c:if test="${pay==1}">
		        	체크/신용카드
		        </c:if>
		        <c:if test="${pay==2}">
		        	휴대폰 결제
		        </c:if>
		      </td>
		    </tr>
		</table>
		
		<div align="center"><input type="button" onclick="location='../mypage/order_list'" value="주문 조회하기"></div>
	</section>
</body>
</html>