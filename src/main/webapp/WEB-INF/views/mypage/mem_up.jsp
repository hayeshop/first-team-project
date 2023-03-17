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
		margin:auto;
		margin-top:60px;
	}
	section .mem_box {
		margin-top:10px;
		height:120px;
		width:1000px;
	}
	section .mem_box .left {
		display:inline-block;
		height:83%;
		padding:10px;
		float:left;
		width:20%;
		background:#CAD7E6;
		border-top:2px solid #98ACC2;
		border-bottom:2px solid #98ACC2;
	}
	section .mem_box .right {
		display:inline-block;
		height:83%;
		width:75%;
		padding:10px;
		border-top:2px solid #98ACC2;
		border-bottom:2px solid #98ACC2;
	}
	section input[type=submit] {
		width:300px;
		height:40px;
		font-size:16px;
		border:1px solid #0080c0;
		background:#0080c0;
		color:#fff;
		margin-top:20px;
		cursor:pointer;
		margin-bottom:80px;
	}
	section input[type=text],[type=password] {
		width:300px;
		height:30px;
		margin-top:4px;
		border:0;
		outline:none;
		border-radius:15px;
		padding-left: 10px;
  		background:#F5F5F5;
	}
	section input[type=button] {
		font-weight:100;
		font-size:13px;
		display:inline-block;
		height:25px;
		border:1px solid #aaaaaa;
		padding:3px;
		margin-left:20px;
		cursor:pointer;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function search_post()
		{
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
		        	
		        	// 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('post').value = data.zonecode;
	                document.getElementById("juso").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("juso_etc").focus();
		        }
		    }).open();
		}
		
		function pwdCheck()
		{
			old_pwd=document.getElementById("old_pwd").value;
			
			if(old_pwd==${mvo.pwd})
				open("pwd_up","","width=500,height=500");
			else
				document.getElementById("pmsg").innerText="비밀번호가 틀렸습니다.";
		}
	</script>
</head>
<body>
	<section>
	  <div><h2>회원정보 수정</h2></div>
	  <form method="post" action="mem_up_ok">
	  	<div class="mem_box">
		  <div class="left">아이디 <span style="font-size:13px;color:#800C08;">(변경불가)</span></div>
		  <div class="right">${mvo.userid}</div>
		</div>
		<div class="mem_box">
		  <div class="left">이름 <span style="font-size:13px;color:#800C08;">(변경불가)</span></div>
		  <div class="right">${mvo.name}</div>
		</div>
		<div class="mem_box">
		  <div class="left">비밀번호</div>
		  <div class="right">
		    <input type="password" id="old_pwd" placeholder="기존 비밀번호 입력">
		    <input type="button" value="비밀번호 변경" onclick="pwdCheck()"> <br><br>
		    <span id="pmsg" style="font-size:12px;margin-left:10px;"></span>
		  </div>
		</div>
		<div class="mem_box">
		  <div class="left">이메일 주소</div>
		  <div class="right"><input style="width:150px;" type="text" name="email" placeholder="ex) kim1234@email.com" value="${mvo.email}"></div>
		</div>
		<div class="mem_box">
		  <div class="left">주소</div>
		  <div class="right">
			<input style="width:150px;" type="text" name="post" id="post" placeholder="우편번호" value="${mvo.post}" readonly><input type="button" value="주소변경" onclick="search_post()"> <p>
			<input type="text" name="juso" id="juso" placeholder="주소" value="${mvo.juso}" readonly> <p>
			<input type="text" name="juso_etc" id="juso_etc" placeholder="상세주소" value="${mvo.juso_etc}">
		  </div>
		</div>
		<div class="mem_box">
		  <div class="left">본인명의의 휴대전화번호</div>
		  <div class="right">
			<select name="telecom">
				<option value="" disabled>통신사 선택</option>
				<c:if test="${mvo.telecom==1 }">
				<option value="1" selected>SKT</option>
				</c:if>
				<c:if test="${mvo.telecom==2 }">
				<option value="2" selected>KT</option>
				</c:if>
				<c:if test="${mvo.telecom==3 }">
				<option value="3" selected>LG U+</option>
				</c:if>
				<c:if test="${mvo.telecom==4 }">
				<option value="4" selected>SKT 알뜰폰</option>
				</c:if>
				<c:if test="${mvo.telecom==5 }">
				<option value="5" selected>KT 알뜰폰</option>
				</c:if>
				<c:if test="${mvo.telecom==6 }">
				<option value="6" selected>LG U+ 알뜰폰</option>
				</c:if>
				<c:if test="${mvo.telecom!=1 }">
				<option value="1">SKT</option>
				</c:if>
				<c:if test="${mvo.telecom!=2 }">
				<option value="2">KT</option>
				</c:if>
				<c:if test="${mvo.telecom!=3 }">
				<option value="3">LG U+</option>
				</c:if>
				<c:if test="${mvo.telecom!=4 }">
				<option value="4">SKT 알뜰폰</option>
				</c:if>
				<c:if test="${mvo.telecom!=5 }">
				<option value="5">KT 알뜰폰</option>
				</c:if>
				<c:if test="${mvo.telecom!=6 }">
				<option value="6">LG U+ 알뜰폰</option>
				</c:if>
			</select>
			<span class="icoArrow"><img src="https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png" alt=""></span>
			<p>
			<input style="width:150px;" type="text" name="phone" placeholder="-없이 휴대폰 번호 입력" value="${mvo.phone}">
		  </div>
		</div>
	    <div style="clear:both;" align="center">
		<input type="submit" value="수정하기">
		</div>
	  </form>
	</section>
</body>
</html>