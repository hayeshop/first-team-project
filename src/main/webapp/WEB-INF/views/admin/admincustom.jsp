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
  	section a:hover {
  		color:skyblue;
  		cursor:pointer;
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
  	section #faq,#gongji {
  		margin-top:20px;
  		font-size:15px;
  	}
  	section #faq td,#gongji td {
  		border-bottom:1px solid skyblue;
  		border-right:1px solid skyblue;
  		border-right:0;
  		padding:3px;
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
	  	<td align="center"><img src="../resources/img/pen.png" width="15"></td>
	  </tr>
	  </c:forEach>
	</table>
	
	
	<!-- 1:1 문의 조회, 답변 -->

	<!-- 공지사항 등록, 수정, 삭제 -->
	<br><br><br><br><br>
    <form method="post" action="gongji_input">
      <div><h3> 공지사항 관리 </h3></div>
	  <div><input type="text" name="title" id="title" placeholder="공지 제목"></div>
      <div><textarea cols="40" rows="5" name="content" id="content" placeholder="공지 내용"></textarea></div>
      <div><input type="checkbox" name="chk" value="1"> 체크하시면 항상 첫 페이지에 나오는 공지사항입니다.</div>
      <div><input type="submit" value="공지사항 저장" id="submit"></div>
    </form>
    <table id="gongji" width="1000" align="center">
	  <tr align="center" style="background:skyblue;color:white">
	  	<td>제목</td>
	  	<td width="650">등록날짜</td>
	  	<td width="30">수정</td>
	  	<td width="30">삭제</td>
	  </tr>
	  <c:forEach items="${glist}" var="gvo">
	  <tr>
	  	<td><c:if test="${gvo.chk==1}"> <b style='color:red;'>[필독]</b> </c:if> ${gvo.title}</td>
	  	<td style="overflow:auto;">${gvo.content}</td>
	  	<td align="center"><img src="../resources/img/pen.png" width="15"></td>
	  	<td align="center"><a href="gong_del?id=${gvo.id}"><img src="../resources/img/trash.png" width="20"></a></td>
	  </tr>
	  </c:forEach>
	</table>
  </section>
</body>
</html>