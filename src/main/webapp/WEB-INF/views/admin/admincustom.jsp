<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admintop.jsp" %>
<link rel="stylesheet" href="../resources/css/popup.css" type="text/css">
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
  		width:500px;
  		height:30px;
  		padding-left:10px;
  		margin-top:10px;
  	}
  	section textarea {
  		width:500px;
  		height:100px;
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
  	section #faq,#gongji,#mtm {
  		margin-top:20px;
  		font-size:15px;
  	}
  	section #faq td,#gongji td,#mtm td {
  		border-bottom:1px solid skyblue;
  		border-right:1px solid skyblue;
  		border-right:0;
  		padding:3px;
  	}
</style>
<script>
	function faq_upform(id,que,ans)
	{
		document.faq.id.disabled=false;
		document.faq.id.value=id;
		document.faq.que.value=que;
		document.faq.ans.value=ans;
		document.faq.submit.value="FAQ 수정";
		document.faq.action="faq_update";
	}
	function gong_upform(id,chk,title,content)
	{
		document.gongji.id.disabled=false;
		document.gongji.id.value=id;
		document.gongji.title.value=title;
		document.gongji.content.value=content;
		document.gongji.submit.value="공지사항 수정";
		document.gongji.action="gongji_update";
		if(chk==1)
			document.getElementById("chk").checked=true;
		else
			document.getElementById("chk").checked=false;
	}
</script>
  <section>
	<!-- 자주묻는질문 등록, 수정, 삭제 -->
	<form name="faq" method="post" action="faq_input">
	<input type="hidden" name="id" disabled>
	  <div><h3>FAQ 관리</h3></div>
	  <div><input type="text" name="que" placeholder="질문"></div>
	  <div><textarea name="ans" placeholder="답변"></textarea></div>
	  <div><input type="submit" name="submit" value="FAQ 등록"></div>
	</form>
	<table id="faq" width="1000" align="center">
	  <tr align="center" style="background:skyblue;color:white">
	  	<td width="30">순서</td>
	  	<td>질문</td>
	  	<td width="650">답변</td>
	  	<td width="30">수정</td>
	  	<td width="30">삭제</td>
	  </tr>
	  <c:forEach items="${flist}" var="fvo">
	  <tr>
	  	<td align="center">${fvo.num}</td>
	  	<td>${fvo.que}</td>
	  	<td>${fvo.ans}</td>
	  	<td align="center"><img src="../resources/img/pen.png" style="cursor:pointer;" width="15" onclick="faq_upform(${fvo.id},'${fvo.que}','${fvo.ans}')"></td>
	  	<td align="center"><a href="faq_del?id=${fvo.id}"><img src="../resources/img/trash.png" width="20"></a></td>
	  </tr>
	  </c:forEach>
	</table>
	
	<!-- 공지사항 등록, 수정, 삭제 -->
	<br><br><br><br><br>
    <form name="gongji" method="post" action="gongji_input">
      <input type="hidden" name="id" disabled>
      <div><h3> 공지사항 관리 </h3></div>
	  <div><input type="text" name="title" id="title" placeholder="공지 제목"></div>
      <div><textarea cols="40" rows="5" name="content" id="content" placeholder="공지 내용"></textarea></div>
      <div><input type="checkbox" name="chk" id="chk" value="1"> 체크하시면 항상 첫 페이지에 나오는 공지사항입니다.</div>
      <div><input type="submit" value="공지사항 저장" name="submit" id="submit"></div>
    </form>
    <table id="gongji" width="1000" align="center">
	  <tr align="center" style="background:skyblue;color:white">
	  	<td>제목</td>
	  	<td width="650">내용</td>
	  	<td width="90">등록날짜</td>
	  	<td width="30">수정</td>
	  	<td width="30">삭제</td>
	  </tr>
	  <c:forEach items="${glist}" var="gvo">
	  <tr>
	  	<td><c:if test="${gvo.chk==1}"> <b style='color:red;'>[필독]</b> </c:if> ${gvo.title}</td>
	  	<td>${gvo.content}</td>
	  	<td align="center">${gvo.writeday}</td>
	  	<td align="center"><img src="../resources/img/pen.png" style="cursor:pointer;" width="15" onclick="gong_upform(${gvo.id},${gvo.chk},'${gvo.title}','${gvo.content}')"></td>
	  	<td align="center"><a href="gong_del?id=${gvo.id}"><img src="../resources/img/trash.png" width="20"></a></td>
	  </tr>
	  </c:forEach>
	</table>
	
	<!-- 1:1 문의 조회, 답변 -->
	<br><br><br><br><br>
	<div><h3> 1:1 문의 관리 </h3></div>
	<form name="mtm_ans" method="post" action="mtm_update" style="display:none;">
	  <input type="hidden" name="id">
	  <div><input type="text" name="title" readonly></div>
	  <div><textarea name="content" readonly></textarea></div>
	  <div><textarea name="ans" placeholder="문의 답변"></textarea></div>
	  <div><input type="submit" value="답변 등록"></div>
	</form>
	<table id="mtm" width="1000" align="center">
	  <tr align="center" style="background:skyblue;color:white">
	  	<td width="70">문의종류</td>
	  	<td>아이디</td>
	  	<td>제목</td>
	  	<td>내용</td>
	  	<td width="90">등록날짜</td>
	  	<td width="80">답변</td>
	  </tr>
	  <c:forEach items="${mlist }" var="mvo">
	  <c:choose>
	  	<c:when test="${mvo.category==1}">
	  	  <c:set var="category" value="상품관련"/>
	  	</c:when>
	  	<c:when test="${mvo.category==2}">
	  	  <c:set var="category" value="주문관련"/>
	  	</c:when>
	  	<c:when test="${mvo.category==3}">
	  	  <c:set var="category" value="회원관련"/>
	  	</c:when>
	  	<c:when test="${mvo.category==4}">
	  	  <c:set var="category" value="기타"/>
	  	</c:when>
	  </c:choose>
	  <tr>
	  	<td>${category}</td>
	  	<td>${mvo.userid}</td>
	  	<td>${mvo.title}</td>
	  	<td>${mvo.content}</td>
	  	<td align="center">${mvo.writeday}</td>
	  	<td align="center">
	  	<c:if test="${mvo.ans==null}">
	  	<span style="cursor:pointer" onclick="javascript:view_ansform(${mvo.id},'${mvo.title}','${mvo.content}')">답변하기</span>
	  	</c:if>
	  	<c:if test="${mvo.ans!=null}">
	  	<a href="javascript:openPop('${mvo.ans}')">답변완료</a>
	  	</c:if>
	  	</td>
	  </tr>
	  </c:forEach>
	</table>	
	<div id="popup_layer" class="popup_layer" style="display:none;">
	  <div class="popup_box">
	    <div class="popup_ans">
	    <h2>답변내용</h2>
	      <p id="ans_content"></p>
	    </div>
	    <div class="popup_btn" style="float:bottom;margin-top:200px;">
	    	<a href="javascript:closePop()">닫기</a>
	    </div>
	  </div>
	</div>
  </section>

  <script>
  function view_ansform(id,title,content)
  {
	  document.mtm_ans.style.display="block";
	  document.mtm_ans.id.value=id;
	  document.mtm_ans.title.value='문의제목 - '+title;
	  document.mtm_ans.content.value='문의내용 - '+content;
  }
  function openPop(ans) 
  {
	  document.getElementById("popup_layer").style.display="block";	  
	  document.getElementById("ans_content").innerText=ans;
  }
  function closePop() 
  {
	  document.getElementById("popup_layer").style.display="none";	  
  }
  </script>
</body>
</html>