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
		width:400px;
		margin:auto;
	}
	section input[type=text] {
		width:400px;
		height:50px;
		margin-top:10px;
		font-size:17px;
	}
	section input[type=submit] {
		width:400px;
		height:54px;
		margin-top:10px;
		cursor:pointer;
	}
	section input[type=button] {
		width:400px;
		height:54px;
		margin-top:10px;
		cursor:pointer;
	}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
  {
    new daum.Postcode({
        oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.baesong.post.value = data.zonecode; // 우편번호
          document.baesong.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.baesong.juso_etc.focus();
      }
    }).open();
  }
</script>
</head>
<body>
	<section>
	  <c:if test="${bvo.gibon==1}">
	    <c:set var="imsi" value="checked"/>
	  </c:if>
	  <c:if test="${bvo.gibon!=1}">
	    <c:set var="imsi" value=""/>
	  </c:if>
	  <form name="baesong" method="post" action="bae_up_ok">
	   <input type="hidden" name="id" value="${bvo.id}">
	    <div><input type="text" name="name" placeholder="받는사람" value="${bvo.name}"></div>
	    <div><input type="text" name="phone" placeholder="휴대폰 번호" value="${bvo.phone}"></div>
	    <div><input type="text" name="post" placeholder="우편번호" readonly onclick="juso_search()" value="${bvo.post}"></div>
	    <div><input type="text" name="juso" placeholder="주소" readonly value="${bvo.juso}"></div>
	    <div><input type="text" name="juso_etc" placeholder="상세주소" value="${bvo.juso_etc}"></div>
	    <div><input type="checkbox" name="gibon" value="1" ${imsi}>기본 배송지로 설정</div>
	    <div><input type="submit" value="저장"></div>
	    <div><input type="button" value="취소" onclick="location='bae_view'"></div>
	  </form>
	</section>
</body>
</html>