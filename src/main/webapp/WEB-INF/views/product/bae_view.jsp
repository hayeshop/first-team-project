<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
	section {
		width:400px;
		margin:auto;
	}
	section div {
		line-height:18px;
	}
	section .jusolist {
		width:350px;
		border:1px solid #cccccc;
		padding:8px;
		margin-left:13px;
	}
	section #left,#right {
		display:inline-block;
		width:40px;
		height:20px;
		border:1px solid #cccccc;
		font-size:14px;
		text-align:center;
		padding-top:6px;
		cursor:pointer;
	}
	section #right {
		margin-left:254px;
	}
	section #chuga {
		text-align:center;
		margin-top:6px;
	}
	section #chuga input {
		width:369px;
		height:40px;
		border:1px solid #cccccc;
		background:#fff;
		margin-left:-8px;
		cursor:pointer;
	}
</style>
<script>
  function init()
  {
	  document.getElementById("gib").style.borderColor="black";
  }
  function order_move(id,n,g,j,p,c,cla)
  {
	  opener.document.oform.id.value=id;
	  opener.document.oform.cla.value=cla;
	  var gibon="";
	  if(g==1)
		  gibon="기본배송지";
	  
	  opener.document.getElementsByClassName("my")[0].innerText=n;
	  opener.document.getElementsByClassName("my")[1].innerText=gibon;
	  opener.document.getElementsByClassName("my")[2].innerText=j;
	  opener.document.getElementsByClassName("my")[3].innerText=p;
	  opener.document.getElementsByClassName("my")[4].innerText=c;
	  
	  close();
  }
  function baeup(id)
  {
	  document.bae_up.id.value=id;
	  document.bae_up.submit();
  }
</script>
</head>
<body onload="init()">
	<section>
	  <c:forEach items="${blist}" var="bvo">
	    <c:if test="${bvo.gibon==1}">
	      <c:set var="tt" value="id='gib'"/>
	    </c:if>
	    <c:if test="${bvo.gibon!=1}">
	      <c:set var="tt" value=""/>
	    </c:if>
	    <div class="jusolist" ${tt}>
	      ${bvo.name} <p>
	      <c:if test="${bvo.gibon==1 }">
	        <span>기본배송지</span> <p>
	      </c:if>
	      ${bvo.juso} ${bvo.juso_etc} <p>
	      ${bvo.phone} <p>
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
	      <p>
	      <span id="left" onclick="baeup(${bvo.id})">수정</span>
	      <span id="right" onclick="order_move(${bvo.id},'${bvo.name}',${bvo.gibon},'${bvo.juso} ${bvo.juso_etc}','${bvo.phone}','${cla}',${bvo.cla})">선택</span>
	    </div>
	  </c:forEach>
	  <div id="chuga">
	    <input type="button" onclick="location='bae_add'" value="+ 배송지 추가">
	  </div>
	  <form name="bae_up" method="post" action="bae_up">
	    <input type="hidden" name="id">
	  </form>
	</section>
</body>
</html>