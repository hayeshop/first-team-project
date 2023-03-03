<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- update.jsp -->
   <form method="post" action="update_ok">
    <input type="hidden" name="id" value="${avo.id}">
   제목 <input type="text" name="title" value="${avo.title}"> <p>
   이름 <input type="text" name="name" value="${avo.name}"> <p>
   내용 <textarea cols="40" rows="5" name="content">${avo.content}</textarea><p>
   <input type="submit" value="저장">
   </form>
</body>
</html>
