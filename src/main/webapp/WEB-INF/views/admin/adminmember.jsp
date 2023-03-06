<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<%@ include file="admintop.jsp" %>
<style>
  	section {
  		width:1000px;
  		margin:auto;
  		margin-top:100px;
  	}
  	section #mem {
  		font-size:15px;
  	}
  	section #mem td {
  		border-bottom:1px solid skyblue;
  		border-right:1px solid skyblue;
  	}
  	section #mem td:first-child {
  		border-left:0;
  	}
  	section #mem td:last-child {
  		border-right:0;
  	}
  	section #mem #telecom {
  		border:1px solid skyblue;
  		text-align:cneter;
  		font-size:13px;
  		padding:3px;
  	}
</style>

  <section>
	<table id="mem" width="1000" align="center">
	  <tr align="center" style="background:skyblue;color:white">
	    <td>아이디</td>
	  	<td>이름</td>
	  	<td>성별</td>
	  	<td>생년월일</td>
	  	<td width="200">주소</td>
	  	<td width="150">이메일주소</td>
	  	<td width="150">핸드폰</td>
	  	<td>적립금</td>
	  	<td>회원상태</td>
	  </tr>
	  <c:forEach items="${mlist}" var="mvo">
	  <c:choose>
	    <c:when test="${mvo.gender==1}">
	      <c:set var="gender" value="남성"/>
	    </c:when>
	    <c:when test="${mvo.gender==2}">
	      <c:set var="gender" value="여성"/>
	    </c:when>
	  </c:choose>
	  <c:choose>
	    <c:when test="${mvo.telecom==1}">
	      <c:set var="telecom" value="SKT"/>
	    </c:when>
	    <c:when test="${mvo.telecom==2}">
	      <c:set var="telecom" value="KT"/>
	    </c:when>
	    <c:when test="${mvo.telecom==3}">
	      <c:set var="telecom" value="LG U+"/>
	    </c:when>
	    <c:when test="${mvo.telecom==4}">
	      <c:set var="telecom" value="SKT 알뜰폰"/>
	    </c:when>
	    <c:when test="${mvo.telecom==5}">
	      <c:set var="telecom" value="KT 알뜰폰"/>
	    </c:when>
	    <c:when test="${mvo.telecom==6}">
	      <c:set var="telecom" value="LG U+ 알뜰폰"/>
	    </c:when>
	  </c:choose>
	  <c:choose>
	  	<c:when test="${mvo.state==0}">
	  	  <c:set var="state" value="정상회원"/>
	  	</c:when>
	  	<c:when test="${mvo.state==1}">
	  	  <c:set var="state" value="탈퇴처리중"/>
	  	</c:when>
	  	<c:when test="${mvo.state==2}">
	  	  <c:set var="state" value="탈퇴완료"/>
	  	</c:when>
	  </c:choose>
	  <tr>
	    <td>${mvo.userid}</td>
	  	<td>${mvo.name}</td>
	  	<td>${gender}</td>
	  	<td>${mvo.birth}</td>
	  	<td>${mvo.juso} ${mvo.juso_etc}</td>
	  	<td>${mvo.email}</td>
	  	<td><span id="telecom">${telecom}</span> ${mvo.phone}</td>
	  	<td align="right"><fmt:formatNumber value="${mvo.juk}" pattern="#,###"/>원</td>
	  	<td align="right">${state}</td>
	  </tr>
	  </c:forEach>
	</table>
  </section>
</body>
</html>