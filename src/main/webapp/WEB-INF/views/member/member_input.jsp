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
	  section #member_input div {
	  	margin-top:10px;
	  }
	  section #member_input {
	  	margin-top:40px;
	  }
	  section #member_input input[type=text],[type=password] {
	  	margin-top:10px;
	  	width:300px;
	  	height:30px;
	  }
	  section #member_input input[type=submit] {
	  	margin-top:30px;
	  	width:307px;
	  	height:40px;
	  	background:skyblue;
	  	border:1px solid skyblue;
	  	color:white;
	  }
	  section #member_input input[type=button] {
	  	margin-left:5px;
	  	width:120px;
	  	height:30px;
	  }
	  section #member_input select option[value=""][disabled] {
	  	display:none;
	  }
	  section #member_input select {
	  	position: relative;
  		width: 307px;
  		height: 35px;
  		border: 1px solid black;
  		margin-top:10px;
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
		
		var uchk=0;	// submit할 때 아이디가 제대로 들어갔는 지 체크하기 위해
		function userid_check(userid)
		{
			if(userid.length<4 || userid.length>16)
			{
				document.getElementById("umsg").innerText="아이디의 길이는 4~16자입니다.";
				document.getElementById("umsg").style.color="red";
			}
			else
			{
				var chk=new XMLHttpRequest();
				
				chk.onload=function()
				{
					if(chk.responseText=="0")
					{
						document.getElementById("umsg").innerText="사용 가능한 아이디입니다.";
						document.getElementById("umsg").style.color="blue";
						uchk=1;
					}
					else
					{
						document.getElementById("umsg").innerText="이미 사용중인 아이디입니다.";
						document.getElementById("umsg").style.color="red";
						uchk=0;
					}
				}
				chk.open("get","userid_check?userid="+userid);
				chk.send();
			}
		}
		
		var pchk=0;	// submit할 때 두 비밀번호가 똑같은 값으로 들어갔는 지 체크하기 위해
		function pwd_check()
		{
			var pwd=document.mem.pwd.value;
			var pwd2=document.mem.pwd2.value;
			if(pwd2.length!=0)
			{
				if(pwd==pwd2)
				{
					document.getElementById("pmsg").innerText="비밀번호가 일치합니다.";
					document.getElementById("pmsg").style.color="blue";
					pchk=1;
				}
				else
				{
					document.getElementById("pmsg").innerText="비밀번호가 불일치합니다.";
					document.getElementById("pmsg").style.color="red";
					pchk=0;
				}
			}
		}
		
		// 제출 전 아이디랑 비번 잘 들어갔는 지 확인
		function mem_check()
		{
			if(uchk==0)
			{
				alert("아이디를 다시 입력해주세요.");
				return false;
			}
			else if(pchk==0)
			{
				alert("비밀번호를 다시 입력해주세요.");
				return false;
			}
			else
			{
				return true;
			}
			
		}
	</script>
</head>
<body>
	<section>
	<h1>회원가입</h1>
	<form id="member_input" name="mem" method="post" action="member_input_ok" onsubmit="return mem_check()">
		<div>
		  <div>아이디를 입력해주세요.</div>
		<input type="text" name="userid" placeholder="아이디" maxlength="16" onblur="userid_check(this.value)">
		</div>
		<span id="umsg" style="font-size:12px;"></span>
		<div>
		  <div>비밀번호를 입력해주세요.</div>
		<input type="password" name="pwd" placeholder="비밀번호" maxlength="16" onkeyup="pwd_check()"> <p>
		  <div>비밀번호를 다시 입력해주세요.</div>
		<input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwd_check()">
		</div>
		<span id="pmsg" style="font-size:12px;"></span>
		<div>
		  <div>이름을 입력해주세요.</div>
		<input type="text" name="name" placeholder="이름 입력">
		</div>
		<div>
		  <div>주소를 입력해주세요.</div>
		<input style="width:150px;" type="text" name="post" id="post" placeholder="우편번호" readonly><input type="button" value="주소검색" onclick="search_post()" id="postbtn"> <p>
		<input type="text" name="juso" id="juso" placeholder="주소" readonly> <p>
		<input type="text" name="juso_etc" id="juso_etc" placeholder="상세주소">
		</div>
		<div>
		  <div>성별을 선택해주세요.</div>
		<select name="gender">
			<option value="" disabled selected>성별</option>
			<option value="1">남성</option>
			<option value="2">여성</option>
		</select>
		</div>
		<div>
		  <div>생년월일을 입력해주세요.(예:19990101)</div>
		<input type="text" name="birth" placeholder="법정생년월일 8자리">
		</div>
		<div>
		  <div>본인명의의 휴대전화번호를 입력해주세요.</div>
		<select>
			<option value="" disabled selected>통신사</option>
			<option value="1">SKT</option>
			<option value="2">KT</option>
			<option value="3">LG U+</option>
			<option value="4">SKT 알뜰폰</option>
			<option value="5">KT 알뜰폰</option>
			<option value="6">LG U+ 알뜰폰</option>
		</select>
		<span class="icoArrow"><img src="https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png" alt=""></span>
		<p>
		<input type="text" name="phone" placeholder="-없이 휴대폰 번호 입력">
		</div>
		<div>
		<input type="submit" value="가입하기">
		</div>
	</form>
	</section>
</body>
</html>