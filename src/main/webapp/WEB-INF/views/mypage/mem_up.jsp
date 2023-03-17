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
		margin-top:60px;
	}
	section div {
		margin-bottom:10px;
	}
</style>
</head>
<body>
	<section>
	  <div><h3>회원정보 수정</h3></div>
	  <form method="post" action="mem_up_ok">
	  	<div><input type="text" name="name" placeholder="이름" value="${mvo.name}"></div>
	  	<div><input type="text" name="email" placeholder="이메일 주소" value="${mvo.email}"></div>
	  	<div><input type="text" name="pwd" placeholder="비밀번호"></div>
	  	
	  	<div><input type="text" name="phone" placeholder="휴대폰 번호" value="${mvo.phone}"></div>
	  </form>
	</section>
</body>
</html>