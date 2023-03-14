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
</head>
<body>
	<section>
	  <h2 align="left">주문/결제</h2>
	  <hr>
	  <form name="oform" method="post" action="order_ok" onsubmit="return check(this)">
	    <input type="hidden" name="id">
	  </form>
	</section>
</body>
</html>