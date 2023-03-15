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
      height:500px;
      margin:auto;
   }
   section #cform div {
   	 margin-top:15px;
   }
   section #cform input[type=text] {
	 margin-top:10px;
	 width: 300px;
	 height:30px;
   }
   section #cform input[type=submit] {
	 margin-top:30px;
	 width:200px;
	 height:50px;
	 background:skyblue;
	 border:1px solid skyblue;
	 color:white;
   }
   section #cform input[type=button] {
	  	margin-left:5px;
	  	width:120px;
	  	height:30px;
   }
   section #cform select {
	  	position: relative;
  		width: 100px;
  		height: 35px;
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
    <form id="cform" method="post" action="cwrite_ok" enctype="multipart/form-data">
       <caption><h3> 집들이 글쓰기 </h3></caption>
       <div> 제목 </div>
       <input type="text" name="title" placeholder="제목을 입력해주세요.">
       <div>
		<select name="space">
			<option value="" disabled selected>평수 선택</option>
			<option value="1">1~9평</option>
			<option value="2">10평대</option>
			<option value="3">20평대</option>
			<option value="4">30평대</option>
			<option value="5">40평대</option>
		</select>
		</div>
       <div> 내용 </div>
       <textarea cols="90" rows="5" name="content" placeholder="글을 작성해주세요"></textarea><p>
	  <div id="outer">
	  	<input type="button" value="사진 추가" onclick="add_form()"> 
	  	<input type="button" value="삭제" onclick="del_form()"> <br>
	  	<input type="file" name="cimg" class="up"> (상세사진) <br>
	  </div>
	  <input type="submit" value="글 저장">
    </form>
   </section>
</body>
</html>