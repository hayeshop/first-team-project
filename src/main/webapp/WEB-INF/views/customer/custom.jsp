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
	}
	section .faq {
  		list-style:none;
  		margin:0;
  		padding:0;
  	}
  	section .faq > li {
  		padding:10px 0;
  		box-sizing:border-box;
  	}
  	section .faq > li:nth-child(n+2) {
  		border-top:1px dashed skyblue;
  	}
  	section .faq input {
  		display:none;
  	}
  	section .faq label {
  		font-weight:bold;
  		
  		margin:20px 0 0;
  		cursor:pointer;
  	}
  	section .faq label::before {
  		display:block;
  		content:"";
  		width:0;
  		height:0;
  		border:8px solid transparent;
  		border-left:8px solid skyblue;
  		margin:2px 0 0 8px;
  		float:left;
  	}
  	section .faq input:checked + label::before {
  		border:8px solid transparent;
  		border-top:8px solid skyblue;
  		border-bottom:0;
  		margin:8px 4px 0;
  	}
  	section .faq div {
  		display:none;
  		font-size:15px;
  		overflow:hidden;
  		padding:10px 0 10px 30px;
  		box-sizing:border-box;
  		transition:max-height 0.4s;
  	}
  	section .faq input:checked + label + div {
  		display:block;
  	}
  	section #gongji {
     	margin-top:10px;
    }
    section #gongji tr:first-child:hover {
      	background:white;
    }
    section #gongji td {
    	height:30px;
     	font-size:15px;
     	padding:3px;
    }
    section #gongji td {
     	border-bottom:1px solid skyblue;
    }
    section #gongji tr:first-child td {
     	border-top:2px solid skyblue;
    	font-weight:900;
    }
    section #gongji tr:last-child td {
     	border-bottom:2px solid skyblue;
    }
    section a {
    	text-decoration:none;
    	color:black;
    }
    section #gongji a:hover {
     	text-decoration:none;
     	color:skyblue;
     	cursor:pointer;
    }
    section #mtm {
    	width:120px;
    	margin-top:20px;
    	border:1px solid skyblue;
    	border-radius:5px;
    	padding:5px;
    	background:skyblue;
    	font-weight:bold;
    }
</style>
</head>
<body>
	<section>
	<br><br>
	<h1 style="text-align:center">고객센터</h1>
	<br><br><br><br>
	<h3>FAQ</h3>
	<ul class="faq">
	  <c:forEach items="${flist}" var="fvo">
	    <li>
	    <input type="checkbox" id="faq${fvo.num}">
	    <label for="faq${fvo.num}">${fvo.que}</label>
	    <div>
	      <p>${fvo.ans}</p>
	    </div>
	  </li>
	  </c:forEach>
	</ul>
	
	<br><br><br><br>
	<h3>공지사항</h3>
	<table width="1000" align="center" id="gongji">
	   <tr style="background:skyblue;color:white;">
	        <td width="800"> 제목 </td>
	        <td align="center"> 작성자 </td>
	        <td align="right"> 작성일 </td>
       </tr>
     <c:forEach items="${glist}" var="gvo">
     <tr>
        <td> 
        <a href="gongji_content?id=${gvo.id}"><c:if test="${gvo.chk==1}"> <b style='color:red;'>[필독]</b> </c:if> 
        ${gvo.title}</a>
        </td>
        <td align="center"> 관리자 </td>
        <td align="right"> ${gvo.writeday} </td>
     </tr>
	 </c:forEach>
	</table>
	
	<br><br><br><br>
	<h3>1:1 문의하기</h3>
	<div id="mtm"><a href="mtm">문의글 작성하기</a></div>
	</section>
</body>
</html>