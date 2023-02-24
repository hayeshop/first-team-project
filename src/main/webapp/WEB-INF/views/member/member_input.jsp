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
	  section #login #member_input {
	  	margin-top:40px;
	  }
	  section #login input[type=text],[type=password] {
	  	width:300px;
	  	height:30px;
	  }
	  section #login input[type=submit] {
	  	margin-top:30px;
	  	width:307px;
	  	height:40px;
	  	background:black;
	  	color:white;
	  }
	  section #login input[type=button] {
	  	margin-left:5px;
	  	width:120px;
	  	height:30px;
	  }
	  section #login select option[value=""][disabled] {
	  	display:none;
	  }
	  section #login select {
	  	position: relative;
  		width: 307px;
  		height: 35px;
  		border: 1px solid black;
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
		
		var uchk=0;
		function userid_check(userid)
		{
			if(userid.length<4 && userid.length>16)
			{
				document.getElementById("umsg").innerText="아이디의 길이는 4~16자입니다.";
				document.getElementById("umsg").color="red";
			}
			else
			{
				var chk=new XMLHttpRequest();
				
				chk.onload=function()
				{
					if(chk.responseText=="0")
					{
						document.getElementById("umsg").innerText="사용 가능한 아이디입니다.";
						document.getElementById("umsg").color="blue";
					}
					else
					{
						document.getElementById("umsg").innerText="이미 사용중인 아이디입니다.";
						document.getElementById("umsg").color="red";
					}
				}
			}
		}
	</script>
</head>
<body>
	<section>
	<h1>회원가입</h1>

	<div id="login">
	<form id="member_input" method="post" action="member_input_ok">
		<div>
		아이디를 입력해주세요. <p>
		<input type="text" name="userid" placeholder="아이디" onblur="userid_check(this.value)">
		</div>
		<span id="umsg" style="font-size:12px;"></span>
		<div>
		비밀번호를 입력해주세요. <p>
		<input type="password" name="pwd" placeholder="비밀번호"> <p>
		비밀번호를 다시 입력해주세요. <p>
		<input type="password" name="pwd2" placeholder="비밀번호 확인">
		</div>
		<div>
		이름을 입력해주세요. <p>
		<input type="text" name="name" placeholder="이름 입력">
		</div>
		<div>
		주소를 입력해주세요. <p>
		<input style="width:150px;" type="text" name="post" id="post" placeholder="우편번호" readonly><input type="button" value="주소검색" onclick="search_post()" id="postbtn"> <p>
		<input type="text" name="juso" id="juso" placeholder="주소" readonly> <p>
		<input type="text" name="juso_etc" id="juso_etc" placeholder="상세주소">
		</div>
		<div>
		성별을 선택해주세요. <p>
		<select name="gender">
			<option value="" disabled selected>성별</option>
			<option value="1">남성</option>
			<option value="2">여성</option>
		</select>
		</div>
		<div>
		생년월일을 입력해주세요.(예:19990101) <p>
		<input type="text" name="birth" placeholder="법정생년월일 8자리">
		</div>
		<div>
		본인명의의 휴대전화번호를 입력해주세요. <p>
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
		</div>
		<div>
		<input type="text" name="phone" placeholder="-없이 휴대폰 번호 입력">
		</div>
		<div>
		<input type="submit" value="가입하기">
		</div>
	</form>
	</div>
	</section>
</body>
</html>