<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-top:30px;
		margin-bottom:60px;
	}
	section #bs {
		font-size:14px;
		font-weight:100;
		display:inline-block;
		width:65px;
		height:18px;
		border:1px solid #aaaaaa;
		padding:4px;
		margin-left:20px;
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
		var cla=document.gform.cla.value;
		var id=document.gform.id.value;
		open("chgcla?cla="+cla+"&id="+id,"","width=400,height=500");
	}
	function check(form)
	{
		
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
	  <form name="oform" method="post" action="order_ok" onsubmit="return check(this)">
	    <input type="hidden" name="id" value="${bvo.id}">
	    <input type="hidden" name="cla" value="${bvo.cla}">
		<input type="hidden" name="pcode" value="${pcode}">
		<input type="hidden" name="su2" value="${su}">
		<input type="hidden" name="cprice" value="${cprice}">
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
				<c:if test="${bvo.cla==0 }">
		      	  <c:set var="cla" value="요청사항 없음"/>
		        </c:if>
		        <c:if test="${bvo.cla==1 }">
		          <c:set var="cla" value="직접 수령 (부재 시 문 앞)"/>
		        </c:if>
		        <c:if test="${bvo.cla==2 }">
		          <c:set var="cla" value="문 앞"/>
		        </c:if>
		        <c:if test="${bvo.cla==3 }">
		          <c:set var="cla" value="경비실"/>
		        </c:if>
		        <c:if test="${bvo.cla==4 }">
		          <c:set var="cla" value="택배함"/>
		        </c:if>
					<span class="my" id="my2">${cla}</span> <input type="button" onclick="chgcla()" value="변경"> 
				</td>
			</tr>
		</table>
	</section>
</body>
</html>