<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
   #section {
      width:1000px;
      height:500px;
      margin:auto;
   }
   #section table {
     margin-top:30px;
     border-spacing:15px;
   }
    #section #submit {
      width:200px;
      height:32px;
      border:1px solid black;
      background:white;
      color:blue;
      font-size:15px;
      font-weight:900;
   }
    #section #content {
      width:500px;
      height:120px;
      border:1px solid black;
      outline:none;
   }
      #section #title {
      width:500px;   
      height:28px;
      border:1px solid black;
      outline:none;
   }
 </style>
</head>
<body>
<div id="section">
    <table width="600" align="center">
     <caption> <h3> 공지사항 글쓰기 </h3></caption>
     <form method="post" action="write_ok.jsp">
      <tr>
        <td> 제 목 </td>
        <td> <input type="text" name="title" id="title"> </td>
      </tr>
      <tr>
        <td> 내 용 </td>
        <td> <textarea cols="40" rows="5" name="content" id="content"></textarea></td>
      </tr>
      <tr>
      	<td colspan="2">
      		<input type="checkbox" name="chk" value="1"> 체크하시면 항상 첫 페이지에 나오는 공지사항입니다.
      	</td>
      <tr>
        <td colspan="2" align="center"> <input type="submit" value="공지사항 저장" id="submit"> </td>
      </tr>
      </tr>
     </form>
    </table>
  </div>
</body>
</html>
