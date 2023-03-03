<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admintop.jsp" %>
<style>
  	section {
  		width:1000px;
  		margin:auto;
  		margin-top:100px;
  		margin-bottom:100px;
  	}
  	section input[type=text] {
  		width:400px;
  		height:30px;
  		padding-left:10px;
  		margin-top:10px;
  	}
  	section textarea {
  		width:400px;
  		height:80px;
  		padding-left:10px;
  		margin-top:10px;
  	}
  	section input[type=submit] {
  		width:100px;
  		height:30px;
  		background:skyblue;
  		color:white;
  		border:1px solid skyblue;
  		margin-top:10px;
  		cursor:pointer;
  	}
  	section #faq {
  		margin-top:20px;
  		font-size:15px;
  	}
  	section #faq td {
  		border-bottom:1px solid skyblue;
  		border-right:1px solid skyblue;
  	}
  	section #faq td:first-child {
  		border-left:0;
  	}
  	section #faq td:last-child {
  		border-right:0;
  	}
</style>

  <section>
	<!-- 자주묻는질문 등록, 수정, 삭제 -->
	<form method="post" action="faq_input">
	  <div><h3>FAQ 관리</h3></div>
	  <div><input type="text" name="que" placeholder="질문"></div>
	  <div><textarea name="ans" placeholder="답변"></textarea></div>
	  <div><input type="submit" value="등록"></div>
	</form>
	<table id="faq" width="1000" align="center">
	  <tr align="center" style="background:skyblue;color:white">
	  	<td width="30"></td>
	  	<td>질문</td>
	  	<td width="650">답변</td>
	  	<td width="30">수정</td>
	  </tr>
	  <c:forEach items="${flist}" var="fvo">
	  <tr>
	  	<td align="center">${fvo.id}</td>
	  	<td>${fvo.que}</td>
	  	<td>${fvo.ans}</td>
	  	<td>click</td>
	  </tr>
	  </c:forEach>
	</table>
	
	
	<!-- 1:1 문의 조회, 답변 -->

	<!-- 공지사항 등록, 수정, 삭제 -->
	<br><br><br><br><br>
    <form method="post" action="gongji_input">
      <div><h3> 공지사항 글쓰기 </h3></div>
	  <div><input type="text" name="title" id="title" placeholder="공지 제목"></div>
      <div><textarea cols="40" rows="5" name="content" id="content" placeholder="공지 내용"></textarea></div>
      <div><input type="checkbox" name="chk" value="1"> 체크하시면 항상 첫 페이지에 나오는 공지사항입니다.</div>
      <div><input type="submit" value="공지사항 저장" id="submit"></div>
    </form>
  </section>
</body>
</html>