<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인 페이지</h1>
	The time on the server is ${serverTime }.
	
	<form class="login-form" action="/member/loginMember.do" method="post">
      <input type="text" name="memberId" placeholder="아이디"/>
      <input type="password" style="margin-bottom:1px;" name="memberPwd" placeholder="비밀번호"/>
      <button type="submit">확인</button><br>
    </form>
	    
</body>
</html>