<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  a {
    text-decoration:none;
  }
  input[type=text],[type=password] {
    width:330px;
    height:35px;
    border:1px solid skyblue;
  }
  input[type=submit] {
  	margin-top:30px;
  	width:336px;
  	height:39px;
  	border:1px solid skyblue;
  	background:skyblue;
  	color:white;
  }
</style>
</head>
<body>
	<a href="../main/main"><h2 align="center" style="color:#0080c0;font-size:100px;font-weight:bold;">LOGO</h2></a>
	<form method="post" action="adminlogin_ok" align="center">
	  <div><input type="text" name="userid" placeholder="아이디"></div> <p>
	  <div><input type="password" name="pwd" placeholder="비밀번호"></div>
	  <div><input type="submit" value="관리자 로그인"></div>
	</form>
</body>
</html>