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
      height:600px;
      margin:auto;
      margin-top:50px;
      text-align:center;
   	}
    
    section #uform {
      margin-top:10px;
    }
    
	section input[type=text] {
      width:330px;
      height:35px;
      border:1px solid skyblue; 
      margin-top:10px;
   	}
   
   section input[type=button] {
      width:336px;
      height:39px;
      border:1px solid skyblue; 
      background:skyblue;
      border:1px solid skyblue; 
      color:white;
      margin-top:10px;
   	}
</style>
<script>
	function userid_search()
	{
  	   var chk=new XMLHttpRequest();
	   var name=document.uform.name.value;
	   var email=document.uform.email.value;
	   
	   chk.onload=function()
	   {
		   var userid=chk.responseText.trim();
		   if(userid=="1") // 이름, 이메일이 잘못 되었을 경우
			 document.getElementById("sview").innerText="이름 혹은 이메일이 잘못 되었습니다";
		   else
	       {		   
			 document.getElementById("sview").innerText="당신의 아이디 : "+userid;
			 document.getElementById("uform").style.display="none"; 
	       }
	   }
	   
	   chk.open("get","userid_search?name="+name+"&email="+email);
	   chk.send();
	}
</script>
</head>
<body>
<section>
<!-- 아이디 조회폼 -->
	<h4>아이디 찾기 </h4>
     <form name="uform" id="uform">
      <input type="text" name="name" placeholder="이 름"> <p>
      <input type="text" name="email" placeholder="이메일"> <p>
      <input type="button" onclick="userid_search()" value="아이디찾기">
     </form>
</section>
</body>
</html>