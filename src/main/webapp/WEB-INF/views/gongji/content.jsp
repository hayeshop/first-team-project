<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>  
   <table width="600" align="center">
     <tr>
       <td> 제 목 </td>
       <td> ${bvo.title}</td>
     </tr>
     <tr>
       <td> 작성자 </td>
       <td> ${bvo.name}</td>
     </tr>
     <tr>
       <td> 작성일 </td>
       <td> ${bvo.writeday}</td>
     </tr>
     <tr>
       <td> 내 용 </td>
       <td> ${bvo.content}</td>
     </tr>
     <tr>
       <td colspan="2" align="center">
         <a href="list?page=${page}"> 목록 </a>
         <a href="update?id=${bvo.id}&page=${page}"> 수정 </a>
         <a href="javascript:viewform()"> 삭제 </a>
       </td>
     </tr>
     
   </table>
</body>
</html>
