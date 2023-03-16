<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:400px;
		margin:auto;
	}
	section div {
		width:380px;
		height:35px;
		margin-top:12px;
		border:1px solid #cccccc;
		padding-top:15px;
	}
	section input[type=radio] {
		cursor:pointer;
	}
	section input[type=button] {
		width:382px;
		height:50px;
		margin-top:10px;
		cursor:pointer;
	}
</style>
<script>
  function chg_ok()
  {
	  var cla=document.baesong.cla.value;
	  var id=document.baesong.id.value;
	  
	  var chk=new XMLHttpRequest();
	  chk.onload=function()
	  {
		  if(chk.responseText=="0")
		  {
			  var my2=opener.document.getElementById("my2");
			  var div=document.getElementsByClassName("div");
			  my2.innerText=div[cla].innerText;
			  opener.document.oform.cla.value=cla;
			  opener.document.oform.id.value=id;
			  close();
		  }
		  else
		  {
			  alert("오류가 발생하였습니다.");
		  }
	  }
	  chk.open("get","chg_ok?cla="+cla+"&id="+id);
	  chk.send();
  }
  window.onload=function()
  {
	  document.baesong.cla[${cla}].checked=true;
  }
</script>
</head>
<body>
	<section>
	  <h3>배송 요청사항</h3>
	  <form name="baesong" method="post">
	  	<input type="hidden" name="id" value="${id}">
	  	<div class="div"><input type="radio" name="cla" value="0">요청사항 없음</div>
	  	<div class="div"><input type="radio" name="cla" value="1">직접 수령 (부재 시 문 앞)</div>
	  	<div class="div"><input type="radio" name="cla" value="2">문 앞</div>
	  	<div class="div"><input type="radio" name="cla" value="3">경비실</div>
	  	<div class="div"><input type="radio" name="cla" value="4">택배함</div>
	  	<input type="button" value="변경 저장" onclick="chg_ok()">
	  </form>
	</section>
</body>
</html>