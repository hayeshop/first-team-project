<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
      text-align:center;
   }
   section div {
     margin-top:12px;
   }
   section input[type=text] {
      width:330px;
      height:35px;
      border:1px solid skyblue; 
   }
   section input[type=password] {
      width:330px;
      height:35px;
      border:1px solid skyblue; 
   }
   section input[type=submit] {
      width:336px;
      height:39px;
      border:1px solid skyblue; 
      background:skyblue;
      border:1px solid skyblue; 
      color:white;
   }
  </style>
  
</head>
<body> <!-- login.jsp -->
   <section>
      <form method="post" action="login_ok">
       
        <h3> 로그인 </h3>
        <div> <input type="text" name="userid" placeholder="아이디"> </div>
        <div> <input type="password" name="pwd" placeholder="비밀번호"> </div>
        <div> <input type="submit" value="로그인"> </div>
       <c:if test="${chk == 1}">
        <div id="msg" style="font-size:12px;color:red;">아이디 혹은 비밀번호가 틀립니다</div>
       </c:if>
      </form>
      <div align="center">
        <span style="cursor:pointer;" onclick="location='uform'"> 아이디 찾기 </span> 
        <span style="cursor:pointer;" onclick="location='pform'"> 비밀번호 찾기 </span>
      </div>
   </section>
</body>
</html>
