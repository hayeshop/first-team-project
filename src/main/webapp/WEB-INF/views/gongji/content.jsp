<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.gongji.dao.GongjiDao" %>
<%@page import="kr.co.gongji.dto.GongjiDto" %>
<%
	GongjiDao gdao = new GongjiDao();
	gdao.content(request);
	GongjiDto gdto=(GongjiDto)request.getAttribute("gdto");
%>
<style>
	#section {
		width: 1000px;
		height:500px;
      	margin:auto;
	}
	#section a {
     color:light blue;
     font-weight:900;
     border:1px solid light blue;
     width:80px;
     height:25px;
     padding-top:3px;
     display:inline-block;
     font-size:15px; 
   }
   #section table {
      border-spacing:0px;
    }
    #section table td {
     border-bottom:1px solid light blue;
     height:30px;
     font-size:13px;
   }
   #section table tr:last-child td {
     border-bottom:none;
     height:60px;
   }
</style>
</head>
<body>

<div id="section">
<table width="600" align="center">
 	<caption><h3> <%=gdto.getTitle()%> </h3></caption>  <!-- 제목 -->
	<tr>
	  <td>작성일</td>
	  <td><%=gdto.getWriteday()%></td>
	</tr>
	<tr>
	  <td>내용</td>
	  <td><div id="content"> <%=gdto.getContent().replace("\r\n","<br>")%> </div></td>
	</tr>
	<tr>
      <td colspan="2" align="center">
        <a href="list.jsp"> 목록 </a>
     <%
    if(session.getAttribute("userid")!=null)
    {
       if(session.getAttribute("userid").equals("admin"))
       {
     %>    
        <a href="update.jsp?id=<%=gdto.getId()%>"> 수정 </a>
        <a href="delete.jsp?id=<%=gdto.getId()%>"> 삭제 </a>
       <%
       }
    }
       %>    
      </td>
    </tr>
  </table>
</div>

</body>
</html>
