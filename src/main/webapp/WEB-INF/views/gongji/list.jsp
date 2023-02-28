<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.gongji.dao.GongjiDao" %>
<%@page import="kr.co.gongji.dto.GongjiDto" %>
<%@page import="java.util.ArrayList" %>
<%
    GongjiDao gdao=new GongjiDao();
    gdao.list(request);
    
    ArrayList<GongjiDto> glist=(ArrayList<GongjiDto>)request.getAttribute("glist");
%>    
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
     border-spacing:0px;
   }
   #section table tr:hover {
      background:#D4F4FA;
   }
   #section table tr:first-child:hover {
      background:white;
   }
   #section table td {
     height:30px;
     font-size:13px;
   }
   #section table td {
     border-bottom:1px solid blue;
   }
   #section table tr:first-child td {
     border-top:2px solid blue;
     font-weight:900;
   }
   #section table tr:last-child td {
     border-bottom:2px solid blue;
   }
   #section a {
     color:blue;
   }
</style>
</head>
<body>
<div id="section">
	<table width="600" align="center">
		<caption> <h3> 공지사항 </h3></caption>
		 <tr align="center">
	        <td> 제목 </td>
	        <td> 작성자 </td>
	        <td> 작성일 </td>
       </tr>
       <%
     for(int i=0;i<glist.size();i++)
     {
    	 String imsi="";
    	 if(glist.get(i).getChk()==1)
    		 imsi="<b style='color:red;'>[공지]</b>";
     %> 
      <tr>
        <td> <a href="readnum.jsp?id=<%=glist.get(i).getId()%>">
        		<%=imsi%>  <%=glist.get(i).getTitle() %> </a> </td>
        <td align="center"> 관리자 </td>
        <td align="center"> <%=glist.get(i).getWriteday() %> </td>
      </tr>
     <% 
     }
     %> 
     
     <%
       //admin만 글쓰기 가능
    if(session.getAttribute("userid")!=null)
    {
       if(session.getAttribute("userid").equals("admin"))
       {
     %>
     <tr>
        <td colspan="4" align="center">
          <a href="write.jsp">공지사항 글쓰기</a>
        </td>
      </tr>
     <%
       }
    }
     %> 
	</table>
</div>
</body>
</html>
