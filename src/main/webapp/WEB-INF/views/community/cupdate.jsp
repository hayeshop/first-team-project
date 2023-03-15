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
	}
</style>
 <script>
 	function add_form()
 	{
	  var size=document.getElementsByClassName("up").length;
	  if(size<10)
	  {
		  var outer=document.getElementById("outer");
		  outer.innerHTML=outer.innerHTML+"<p class='up'> <input type='file' name='img"+(size+1)+"'> (추가사진) </p>";
	  }
 	}
 	function del_form()
 	{
	  var size=document.getElementsByClassName("up").length;
	  if(size!=1)
		  document.getElementsByClassName("up")[size-1].remove();
 	}
 </script>
</head>
<body>
<section>
    <form method="post" action="update_ok">
	<h3> 수정하기 </h3>
    <input type="hidden" name="id" value="${cvo.id}">
   제목 <input type="text" name="title" value="${cvo.title}"> <p>
   <select>
		<option value="" disabled selected>평수 선택</option>
		<option value="1">1~9평</option>
		<option value="2">10평대</option>
		<option value="3">20평대</option>
		<option value="4">30평대</option>
		<option value="5">40평대</option>
		</select>
   이름 <input type="text" name="name" value="${cvo.name}"> <p>
   내용 <textarea cols="40" rows="5" name="content">${cvo.content}</textarea><p>
   <div id="outer">
	  	<input type="button" value="사진 추가" onclick="add_form()"> 
	  	<input type="button" value="삭제" onclick="del_form()"> <br>
	  	<input type="file" name="img" class="up"> (상세사진) <br>
	  </div>
   <input type="submit" value="저장">
   </form>
</section>
</body>
</html>