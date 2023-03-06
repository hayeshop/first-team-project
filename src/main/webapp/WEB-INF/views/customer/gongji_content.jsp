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
  		margin-top:100px;
  		margin-bottom:100px;
  	}
  	section .icon {
	  	display: block;
	    float: left;
	    width: 40px;
	    height: 40px;
	    margin: 0px 10px 0 0;
	    text-align: left;
  	}
  	section .name,.writeday {
  		display: block;
    	overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    color: #666;
	    font-size:14px;	    
  	}
  	section .content {
  		padding: 50px 35px;
	    line-height: 2.6rem;
	    font-size: 14px;
	    color: #666;
	    border-bottom: 1px solid #e8e8e8;
  	}
  	section .list_btn {
  	    display: block;
	    width: 100px;
	    margin: 40px auto 0;
	    padding: 12px 0 11px;
	    line-height: 26px;
	    font-size:17px;
	    border: 1px solid skyblue;
	    border-radius: 5px;
	    -webkit-border-radius: 5px;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	    -webkit-box-sizing: border-box;
	    letter-spacing: -.5px;
	    background:skyblue;
	    color: white;
	    text-align: center;
  	}
  	section a {
  		text-decoration:none;
  	}
</style>
</head>
<body>  
  <section>
     <div><h4>${gvo.title}</h4></div>
	 <div style="position: relative;padding: 30px 0 29px 35px;border-bottom: 1px solid rgba(34,34,34,.1);">
		 <div class="icon"><img src="../resources/img/logo_icon.JPG" width="40"></div>
		 <span class="name">관리자</span>
		 <span class="writeday">${gvo.writeday}</span>
	 </div>
	 <div class="content">
		 <p>${gvo.content}</p>
		 <p>${gvo.writeday}</p>	 
	 </div>
     <a href="custom" class="list_btn"> 목록 </a>
  </section>
</body>
</html>