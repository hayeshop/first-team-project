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
	section table {
        width: 1000px;
        border: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 20px;
        padding: 20px;
        background-color: #f9f9f9;
        border-collapse: collapse;
    }
    section table td {
        padding: 10px;
        border: 1px solid #ccc;
        text-align: center;
    }
    section table td:first-child {
        font-weight: bold;
        background-color: #e0e0e0;
        width: 20%;
    }
</style>
<script>
   function viewform()
   {
	   document.getElementById("delform").style.display="table-row";
   }
   function userid_check()
   {
	   var id= document.form.name.value;
   }
</script>
</head>
<body>
<section>
<table width="600" align="center">
     <tr>
       <td> 제 목 </td>
       <td> ${cvo.title}</td>
     </tr>
     <tr>
       <td> 작성자 </td>
       <td> ${cvo.name}</td>
     </tr>
     <tr>
       <td> 평수 </td>
       <td> ${cvo.space}</td>
     </tr>
     <tr>
       <td> 작성일 </td>
       <td> ${cvo.writeday}</td>
     </tr>
     <tr>
       <td> 내 용 </td>
       <td><c:forEach items="${cvo.img}" var="img">
   			   <img src="../resources/community/${img}" width="150" height="150">
   			  </c:forEach></td>
       <td> ${cvo.content}</td>
     </tr>
     <tr>
       <td colspan="2" align="center">
         <a href="clist"> 목록 </a>
         <a href="cupdate?id=${cvo.id}"> 수정 </a>
         <a href="javascript:viewform()"> 삭제 </a>
       </td>
     </tr>
     
     <tr id="delform" style="display:none;">
       <td colspan="2" align="center">
         <form method="post" action="delete">
           <input type="hidden" name="id" value="${cvo.id}">
           <input type="submit" value="삭제">
         </form>
       </td>
     </tr>
   </table>
</section>
</body>
</html>