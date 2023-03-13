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
	section #mtm_history {
		width:100px;
		height:100px;
		border:2px solid skyblue;
		padding:10px;
		border-radius:5px;
		text-align:center;
	}
	section #mtm_history #mnum {
		margin-top:20px;
		border-top:1px solid skyblue;
		padding:15px;
		font-size:20px;
	}
	section #mtm_history a {
		text-decoration:none;
		color:black;
	}
	section #mtm_history a:hover {
		color:#0080c0;
	}
</style>
</head>
<body>
	<section>
	<h1>마이페이지</h1>
	<!-- 회원정보수정 -->
	
	<!-- 배송지 관리 -->
	
	<!-- 주문내역 -->
	
	<!-- 리뷰 쓰기 -->
	
	<!-- 문의 내역 -->
	<br><br><br><br><br>
	<div id="mtm_history">
	<h3>문의 내역</h3>
	<div id="mnum"><a href="mtm_view">${mnum}</a></div>
	</div>
	
	<!-- 찜한상품 -->
	</section>
</body>
</html>