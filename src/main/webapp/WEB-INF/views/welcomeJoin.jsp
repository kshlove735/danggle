<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 댕댕 ｜ 가입 완료</title>
<link rel="stylesheet" type="text/css" href="/resources/css/welcomeJoin.css">
</head>
<body>
	<div class="header"></div>

	  <div class="form">
	    <form class="login-form">
		   <div class="icon_box">
		   	<img id="check_icon" src="/resources/images/check_icon.png"></img>
		   </div>
		   <br>
			 ${sessionScope.member.nickname}님 가입을 환영합니다!<br>
			  <a href="/">메인으로 가기</a>
	    </form>
	  </div>
	  
<div class="footer"></div>
</body>
</html>