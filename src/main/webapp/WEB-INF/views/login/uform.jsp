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
      margin-top:200px;
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
      cursor:pointer;
   	}
   	
   	section #login {
   	  display:none;
   	  width:150px;
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
			 document.getElementById("sview").innerText="이름 혹은 이메일이 잘못 되었습니다.";
		   else
	       {		   
			 document.getElementById("sview").innerHTML="<p>회원님의 아이디는 <b>"+userid+"</b> 입니다.";
			 document.getElementById("uform").style.display="none"; 
			 document.getElementById("title").style.display="none"; 
			 document.getElementById("login").style.display="inline-block";
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
	<div><a href="../main/main"><img src="../resources/img/logo4.jpg" width="180px"></a></div>
     <form name="uform" id="uform">
      <input type="text" name="name" placeholder="이 름"> <p>
      <input type="text" name="email" placeholder="이메일"> <p>
      <input type="button" onclick="userid_search()" value="아이디찾기">
     </form>
     <span id="sview"></span>
     <input type="button" id="login" onclick="location='login'" value="로그인 바로가기">
</section>
</body>
</html>