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
  		margin-top:30px;
  	}
  	section #table title {
  		text-align: left;
  	}
  	section #table td {
      vertical-align:top;
      border:1px solid white;
      padding:3px;
   }
   section #table td div {
      width:230px;
   }
   section #table td:hover {
      border:1px solid skyblue;
    }
</style>
</head>
<body>
<section>
    <table width="1000" align="center">
		<caption> <h3> 집들이 </h3></caption>
		 <tr align="center">
	        <td> 게시물 </td>
	        <td> 제목 </td>
	        <td> 작성자 </td>
	        <td> 작성일 </td>
       </tr>
     <c:forEach items="${clist}" var="cvo">
     <tr>
     	<td> <img src="../resources/community/${cvo.img}" width="150" height="150"> </td>
        <td> <a href="ccontent?id=${cvo.id}">${cvo.title}</a> </td>
        <td> ${cvo.name} </td>
        <td> ${cvo.writeday} </td>
      </tr>
	  </c:forEach>
	  <tr>
        <td colspan="4" align="center">
          <a href="cwrite"> 글쓰기</a>
        </td>
      </tr>
	</table>
</section>
</body>
</html>