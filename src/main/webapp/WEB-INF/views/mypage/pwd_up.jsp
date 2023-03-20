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
	section input[type=password] {
		width:400px;
		height:50px;
		margin-top:10px;
		font-size:17px;
	}
	section input[type=submit] {
		width:400px;
		height:54px;
		margin-top:10px;
		cursor:pointer;
	}
</style>
<script>
var pchk=0;	// submit할 때 두 비밀번호가 똑같은 값으로 들어갔는 지 체크하기 위해
function pwd_check()
{
	var pwd=document.pwd_up.pwd.value;
	var pwd2=document.pwd_up.pwd2.value;
	if(pwd2.length!=0)
	{
		if(pwd==pwd2)
		{
			document.getElementById("pmsg").innerText="비밀번호가 일치합니다.";
			document.getElementById("pmsg").style.color="blue";
			pchk=1;
		}
		else
		{
			document.getElementById("pmsg").innerText="비밀번호가 불일치합니다.";
			document.getElementById("pmsg").style.color="red";
			pchk=0;
		}
	}
}
//제출 전 비번 잘 들어갔는 지 확인
function mem_check()
{
	if(pchk==0)
	{
		alert("비밀번호를 다시 입력해주세요.");
		return false;
	}
	else
	{
		return true;
	}
	
}
</script>
</head>
<body>
	<section>
	  <form name="pwd_up" method="post" action="pwd_up_ok" onsubmit="return mem_check()">
	    <div><input type="password" name="pwd" placeholder="새로운 비밀번호" maxlength="16" onkeyup="pwd_check()"></div>
	    <div><input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwd_check()"></div>
	    <span id="pmsg" style="font-size:12px;"></span>
	    <div><input type="submit" value="비밀번호 변경하기"></div>
	  </form>
	</section>
</body>
</html>