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
		background:#eeeeee;
		padding-right:10px;
	}
	section #bs {
		font-size:14px;
		font-weight:100;
		display:inline-block;
		width:65px;
		height:14px;
		border:1px solid #aaaaaa;
		padding:3px;
		margin-left:20px;
		cursor:pointer;
	}
	section input[type=button] {
		font-size:14px;
		font-weight:100;
		width:48px;
		border:1px solid #aaaaaa;
		background:#fff;
		cursor:pointer;
		padding:1px;
	}
	section input[type=text] {
		width:100px;
	}
	section .pay {
		width:800px;
		height:100px;
		display:none;
		padding:10px;
		border:1px solid #aaaaaa;
		margin-top:15px;
	}
	section .pay hr {
		border-color:#eeeeee;
		border-top:none;
	}
	section #sbtn {
		width:300px;
		height:40px;
		border:1px solid #0080c0;
		background:#0080c0;
		color:#fff;
		margin-top:20px;
		cursor:pointer;
	}
</style>
<script>
	function bae_search()
	{
		open("bae_view","","width=500,height=620");
	}
	function chgcla()
	{
		var cla=document.oform.cla.value;
		var id=document.oform.id.value;
		open("bae_cla?cla="+cla+"&id="+id,"","width=400,height=500");
	}
	function chkPoint(amt,pnt) {
		//amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트
		var v_point = 0;
	
		if (document.getElementById("chk_use").checked)  
		{
			v_point = pnt

			if(pnt > amt ){
				v_point = amt;
			}
			
		}
		document.getElementById("use_pnt").value = v_point;

		changePoint(amt,pnt);
	}
	function changePoint(amt,pnt){
		var v_point=0;
		var use_pnt=document.getElementById("use_pnt").value;
		if(use_pnt!=null)
			v_point = use_pnt;
		else
			v_point=0;
			
		if (v_point > pnt)
		{
			v_point = pnt;
			document.getElementById("use_pnt").value = v_point;
		}

		if(v_point > amt ){
			v_point = amt;
			document.getElementById("use_pnt").value = v_point;
		}

		var v_left = document.getElementById("left_pnt");
		for (var i = 0; i < v_left.length; i++) {
			v_left[i].innerText = pnt - v_point;
		}
		document.getElementById("result_pnt").innerHTML = comma(amt - v_point);
	}
	function comma(num)
	{
		return new Intl.NumberFormat().format(num);
	}
	function pay_change(n)
	{
		var pay=document.getElementsByClassName("pay");
		
		for(i=0;i<pay.length;i++)
		{
			pay[i].style.display="none";
			document.oform.gibonpay[i].checked=false;
		}
		pay[n].style.display="block";
		document.oform.gibonpay[i].checked=true;
	}
</script>
</head>
<body>
	<section>
	  <div class="box_title">
	    <h2 class="main_title">주문/결제</h2>
	    <ul class="list">
	      <li class="list_item">장바구니</li>
	      <li class="list_item select" >주문결제</li>
	      <li class="list_item">주문완료</li>
	    </ul>
	  </div>
	  <hr>
	  <form name="oform" method="post" action="order_ok">
	    <input type="hidden" name="bae_id" value="${bvo.id}">
	    <input type="hidden" name="cla" value="${bvo.cla}">
		<input type="hidden" name="pcode" value="${pcode}">
		<input type="hidden" name="su2" value="${su}">
		<input type="hidden" name="cprice2" value="${pprice}">
		<input type="hidden" name="juk2" value="${juk}">
		<!-- 구매자 정보 -->
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
		  <caption> <h3 align="left"> 배송지 정보   <span onclick="bae_search()" id="bs">배송지 변경</span></h3></caption>
			<tr align="left">
				<td width="140">이름</td>
				<td> <span class="my">${bvo.name}</span> <span class="my"> 기본배송지 </span> </td>
			</tr>
			<tr align="left">
				<td> 주소 </td>
				<td> <span class="my">${bvo.juso} ${bvo.juso_etc}</span> </td>
			</tr>
			<tr align="left">
				<td> 휴대폰번호 </td>
				<td> <span class="my">${bvo.phone}</span> </td>
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
				  <span class="my" id="my2">${cla}</span> <input type="button" onclick="chgcla()" value="변경"> 
				</td>
			</tr>
		</table>
		
		<!-- 결제 정보 -->
		<table width="1000" align="center">
		  <caption><h3 align="left">결제 정보</h3></caption>
		  <tr align="left">
		    <td width="120">총 상품 가격</td>
		    <td><fmt:formatNumber value="${price}" pattern="#,###" type="number"/>원  </td>
		  </tr>
		  <tr align="left">
		    <td width="120">배송비</td>
		    <td><fmt:formatNumber value="${bae}" pattern="#,###" type="number"/>원  </td>
		  </tr>
		  <tr align="left">
		    <td width="120" valign="top">포인트</td>
		    <td>
		      <input type="checkbox" id="chk_use" onclick="chkPoint(${cprice},${mvo.juk})" value="1"> 포인트 전체 사용 <br>
		      <input type="text" name="use_juk" id="use_pnt" onchange="changePoint(${cprice},${mvo.juk})"> p (사용가능 포인트: <span id="left_pnt">${mvo.juk}</span>p)
		    </td>
		  </tr>
		  <tr align="left">
		    <td width="120" valign="top">총 결제 금액</td>
		    <td>
		      <span class="bold txt_red" id="result_pnt"><fmt:formatNumber value="${cprice}" pattern="#,###" type="number"/></span> 원
		    </td>
		  </tr>
		  <tr>
		    <td valign="top">결제 방법</td>
		    <td>
		      <input type="radio" name="pay" value="0" onclick="pay_change(0)">무통장 입금
		      <input type="radio" name="pay" value="1" onclick="pay_change(1)">체크/신용카드
		      <input type="radio" name="pay" value="2" onclick="pay_change(2)">휴대폰 결제
		      
		      <div class="pay">
		        * 입금은행
				<select name="bank">
					<option value="" disabled selected> 선택 </option>
					<option value="1"> 국민은행 </option>
					<option value="2"> 우리은행 </option>
					<option value="3"> 신한은행 </option>
					<option value="4"> 농협 </option>
					<option value="5"> 카카오뱅크 </option>
					<option value="6"> k뱅크 </option>
					<option value="7"> 축협 </option>
				</select>
				<hr>
				* <b></b>까지 입금이 가능합니다.
				<hr>
				<input type="checkbox" name="gibonpay" value="0">
				선택한 결제수단으로 향후 결제 이용에 동의합니다. (선택)
		      </div>
		      
		      <div class="pay">
		        * 카드선택
				<select name="card">
					<option value="" disabled selected> 선택 </option>
					<option value="1"> 신한카드 </option>
					<option value="2"> 우리카드 </option>
					<option value="3"> NH농협카드 </option>
					<option value="4"> KB국민카드 </option>
					<option value="5"> 삼성카드 </option>
					<option value="6"> 롯데카드 </option>
					<option value="7"> 현대카드 </option>
					<option value="8"> 카카오페이 </option>
				</select>
				<hr>
				* 할부기간
				<select name="gigan">
					<option value="" disabled selected> 선택 </option>
					<option value="1"> 일시불 </option>
					<option value="2"> 2개월 </option>
					<option value="3"> 3개월 </option>
					<option value="4"> 4개월 </option>
					<option value="5"> 5개월 </option>
					<option value="6"> 6개월 </option>
				</select>
				* 할부는 50,000원 이상만 가능합니다.
				* 법인카드는 일시불만 가능합니다.
				<hr>
				<input type="checkbox" name="gibonpay" value="1">
				선택한 결제수단으로 향후 결제 이용에 동의합니다. (선택)
			  </div>
			  
			  <div class="pay">
			    * 통신사 종류
				<select name="telecom">
					<option value="" disabled selected> 선택 </option>
					<option value="1"> KT </option>
					<option value="2"> SKT </option>
					<option value="3"> LG U+ </option>
					<option value="4"> 알뜰통신사 </option>
				</select>
				<hr>
				<input type="checkbox" name="gibonpay" value="2">
				선택한 결제수단으로 향후 결제 이용에 동의합니다. (선택)
			  </div>
		    </td>
		  </tr>
		</table>
		
		<div align="center" style="font-size:13px;margin-top:30px;">위 주문 내용을 확인하였으며, 결제에 동의합니다.</div>
		<div align="center">
		  <input type="submit" id="sbtn" value="결제">
		</div>
		</form>
	</section>
</body>
</html>