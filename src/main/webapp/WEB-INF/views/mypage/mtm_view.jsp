<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1000px;
		margin:auto;
		margin-top:40px;
		margin-bottom:500px;
	}
	section .mtm {
  		list-style:none;
  		padding:0;
  		margin-top:20px;
  	}
  	section .mtm > li {
  		padding:10px 0;
  		box-sizing:border-box;
  	}
  	section .mtm > li:nth-child(n+2) {
  		border-top:1px dashed skyblue;
  	}
  	section .mtm input {
  		display:none;
  	}
  	section .mtm label {
  		font-weight:bold;
  		
  		margin:20px 0 0;
  		cursor:pointer;
  	}
  	section .mtm label::before {
  		display:block;
  		content:"";
  		width:0;
  		height:0;
  		border:8px solid transparent;
  		border-left:8px solid skyblue;
  		margin:2px 0 0 8px;
  		float:left;
  	}
  	section .mtm div {
  		
  		font-size:15px;
  		overflow:hidden;
  		padding:10px 0 10px 30px;
  		box-sizing:border-box;
  		transition:max-height 0.4s;
  	}
</style>
</head>
<body>
	<section>
	<h3>나의 문의내역</h3>
	<ul class="mtm">
	  <c:forEach items="${mlist}" var="mvo">
	    <li>
	    <input type="checkbox" id="mtm${mvo.num}">
	    <label for="mtm${mvo.num}">${mvo.title} - ${mvo.content}</label>
	    <div>
	    <c:if test="${mvo.ans!=null}">
	      <p>${mvo.ans}</p>
	    </c:if>
	    <c:if test="${mvo.ans==null}">
	      <p style="color:grey;">문의가 접수되어 답변을 기다리는 중입니다.</p>
	    </c:if>
	    </div>
	    </li>
	  </c:forEach>
	</ul>	
	</section>
</body>
</html>