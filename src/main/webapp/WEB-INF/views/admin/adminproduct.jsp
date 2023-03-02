<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="admintop.jsp" %>
<style>
  	section {
  		width:1000px;
  		margin:auto;
  		margin-top:30px;
  	}
  	section input[type=text] {
  		width:400px;
  		height:30px;
  		padding-left:10px;
  		margin-top:10px;
  	}
  	section input[type=file] {
  		margin-top:5px;
  		width:320px;
  		height:30px;
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
  	section select option[value=""][disabled] {
  		display:none;
  	}
  	section #show_btn {
  		width:200px;
  		height:30px;
  		background:skyblue;
  		color:white;
  		border:1px solid skyblue;
  		margin-bottom:20px;
  		cursor:pointer;
  	}
  	section #pro {
  		display:none;
  	}
  	section #pro_list {
  		margin-top:30px;
  	}
</style>
<script>
  // 카테고리2,3 불러오기
  function getCat2(catcode)
  {
	  var chk=new XMLHttpRequest();
	  
	  chk.onload=function()
	  {
		  document.pro.category2.innerHTML=decodeURI(chk.responseText);
	  }
	  chk.open("get","getCat2?catcode="+catcode);
	  chk.send();
  }
  function getCat3(cat2)
  {
	  var chk=new XMLHttpRequest();
	  
	  var cat=document.pro.category.value;
	  var catncat2=cat+cat2;
	  
	  chk.onload=function()
	  {
		  document.pro.category3.innerHTML=decodeURI(chk.responseText);
	  }
	  chk.open("get","getCat3?catncat2="+catncat2);
	  chk.send();
  }
  
  // 상품코드 불러오기
  function getCode()
  {
	  var cat=document.pro.category.value;
	  var cat2=document.pro.category2.value;
	  var cat3=document.pro.category3.value;
	  var pcode="p"+cat+cat2+cat3;
	  
	  var chk=new XMLHttpRequest();
	  
	  chk.onload=function()
	  {
		  var num=chk.responseText;
		  
		  if(num.length==1)
			  num="00"+num;
		  else if(num.length==2)
			  num="0"+num;
		  
		  document.pro.pcode.value=pcode+num;
	  }
	  chk.open("get","getCode?pcode="+pcode);
	  chk.send();
  }
  
  // 상품 상세사진 추가,삭제
  function add_form()
  {
	  var size=document.getElementsByClassName("up").length;
	  if(size<10)
	  {
		  var outer=document.getElementById("outer");
		  outer.innerHTML=outer.innerHTML+"<p class='up'> <input type='file' name='img2"+(size+1)+"'> (상세사진) </p>";
	  }
  }
  function del_form()
  {
	  var size=document.getElementsByClassName("up").length;
	  if(size!=1)
		  document.getElementsByClassName("up")[size-1].remove();
  }
  
  // 상품등록 toggle
  function toggle()
  {
	  if(document.getElementById("pro").style.display==="none")
	  {
		  document.getElementById("pro").style.display="block";
		  document.getElementById("show_btn").value="상품 등록 접기▲";
	  }
	  else
	  {
		  document.getElementById("pro").style.display="none";
		  document.getElementById("show_btn").value="상품 등록 펼치기▼";
	  }
  }
</script>

  <section>
  	<!-- 상품 등록 -->
  	<div><input type="button" id="show_btn" value="상품 등록 펼치기▼" onclick="toggle()"></div>
	<form method="post" name="pro" id="pro" action="product_input" enctype="multipart/form-data">
	  <div>
	    <select name="category" onchange="getCat2(this.value)">
	      <option value="" disabled selected>카테고리</option>
	      <c:forEach items="${category}" var="cat">
	      	<option value="${cat.code}">${cat.name}</option>
	      </c:forEach>
	    </select>
	    <select name="category2" onchange="getCat3(this.value)">
	        <option>카테고리2</option>
	    </select>
	    <select name="category3" onchange="getCode()">
	      	<option>카테고리3</option>
	    </select>
	  </div>
	  <div><input type="text" name="pcode" placeholder="상품코드" readonly></div>
	  <div><input type="text" name="title" placeholder="상품명"></div>
	  <div><input type="text" name="made" placeholder="제조사"></div>
	  <div><input type="text" name="price" placeholder="가격(원)"></div>
	  <div><input type="text" name="baesong" placeholder="배송비(원)"></div>
	  <div><input type="text" name="su" placeholder="재고량(개)"></div>
	  <div><input type="text" name="halin" placeholder="할인율(%)"></div>
	  <div><input type="text" name="juk" placeholder="적립률(%)"></div>
	  <div><input type="file" name="img1"> (대표사진)</div>
	  <div id="outer">
	  	<p><input type="button" value="추가" onclick="add_form()">
	  	<input type="button" value="삭제" onclick="del_form()"> <br>
	  	<input type="file" name="img2" class="up"> (상세사진) <br>
	  </div>
	  <div><input type="submit" value="등록"></div>
	</form>
	<!-- // 상품등록 -->
	
	<!-- 상품 조회 -->
	<table width="1000" align="center" id="pro_list">
	  <tr align="center" style="background:skyblue;color:white">
	  	<td>상품사진</td>
	  	<td>상품명</td>
	  	<td>제조사</td>
	  	<td>가격(원)</td>
	  	<td>배송비(원)</td>
	  	<td>재고량(개)</td>
	  	<td>할인율(%)</td>
	  	<td>적립률(%)</td>
	  </tr>
	  <c:forEach items="${plist}" var="pvo">
	  <tr align="center">
	  	<td><img src="../resources/product/${pvo.img1}" width="100"></td>
	  	<td>${pvo.title}</td>
	  	<td>${pvo.made}</td>
	  	<td><fmt:formatNumber value="${pvo.price}" pattern="#,###"/>원</td>
	  	<td><fmt:formatNumber value="${pvo.baesong}" pattern="#,###"/>원</td>
	  	<td><fmt:formatNumber value="${pvo.su}" type="number"/>개</td>
	  	<td>${pvo.halin}%</td>
	  	<td>${pvo.juk}%</td>
	  </tr>
	  </c:forEach>
	</table>
  </section>
</body>
</html>