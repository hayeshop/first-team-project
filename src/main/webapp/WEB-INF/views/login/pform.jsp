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
	   section #pform {
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
	function pwd_search()
    {
           	
       var chk=new XMLHttpRequest();
       var userid=document.pform.userid.value;
       var name=document.pform.name.value;
 	   var email=document.pform.email.value;
 	   
 	   chk.onload=function()
 	   {
 		   var pwd=chk.responseText.trim();
 		   if(pwd=="1")
 		   {
 			  document.getElementById("sview").innerText="입력 정보가 불일치 합니다.";
 		   }	
 		   else
 		   {
 			  document.getElementById("sview").innerHTML="<p>회원님의 비밀번호는 <b>"+pwd+"</b> 입니다.";
 			  document.getElementById("pform").style.display="none";
 			 document.getElementById("title").style.display="none"; 
			 document.getElementById("login").style.display="inline-block";
 		   }	   
 	   }
 	   
 	   chk.open("get","pwd_search?userid="+userid+"&name="+name+"&email="+email);
 	   chk.send();
    }
</script>
</head>
<body>
<section>
<!-- 비밀번호 조회폼 -->
	<div><a href="../main/main"><img src="../resources/img/logo4.jpg" width="180px"></a></div>
     <form name="pform" id="pform">
      <input type="text" name="userid" placeholder="아이디"> <p>
      <input type="text" name="name" placeholder="이 름"> <p>
      <input type="text" name="email" placeholder="이메일"> <p>
      <input type="button" onclick="pwd_search()" value="비밀번호찾기">
     </form>
     <span id="sview"></span>
     <input type="button" id="login" onclick="location='login'" value="로그인 바로가기">
</section>
</body>
</html>