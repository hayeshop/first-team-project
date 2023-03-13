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
		margin-bottom:200px;
	}
    section #mtm {
    	margin-top:10px;
    }
    section #mtm select {
    	width:100px;
    	height:25px;
    	border:2px solid skyblue;
    	margin-top:10px;
    }
    section #mtm input[type=text] {
        width:500px;
        height:35px;
        border:2px solid skyblue; 
        margin-top:10px;
        padding:5px;
    }
    section #mtm textarea {
    	width:500px;
    	height:200px;
    	border:2px solid skyblue;
    	margin-top:10px;
    	padding:5px;
    }
    section #mtm input[type=submit] {
    	width:515px;
      	height:39px;
      	border:1px solid skyblue; 
      	background:skyblue;
      	color:white;
      	margin-top:20px;
      	cursor:pointer;
    }
</style>
</head>
<body>
<section>
	<h3>1:1 문의하기</h3>
    <form method="post" action="mtm_input" id="mtm">
	  <div>
	  <select name="category">
	    <option value="" disabled selected>카테고리</option>
	    <option value="1">상품관련</option>
	    <option value="2">주문관련</option>
	    <option value="3">회원관련</option>
	    <option value="4">기타</option>
	  </select>
	  </div>
	  <div><input type="text" name="title" placeholder="문의 제목"></div>
	  <div><textarea name="content" placeholder="문의 내용"></textarea></div>
	  <div><input type="submit" value="문의 등록하기"></div>
	</form>
</section>
</body>
</html>