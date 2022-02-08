<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 댕댕 ｜ 로그인</title>
<link rel="stylesheet" type="text/css" href="/resources/css/loginForm.css">
</head>
<body>
<div class="header"></div>

	  <div class="form">
	    <form class="login-form" action="/member/loginMember.do" method="post">
	      <h2 style="margin-top:0px;">로그인</h2>
	      <input type="text" name="memberId" placeholder="아이디"/>
	      <input type="password" style="margin-bottom:1px;" name="memberPwd" placeholder="비밀번호"/>
	      <a href="/resources/staticViews/member/searchIdPage.jsp" class="message">아이디 찾기</a><a class="message"> │</a>
	      <a href="/resources/staticViews/member/searchPwdPage.jsp" class="message">비밀번호 찾기</a><a class="message"> │</a>
	      <a href="/resources/staticViews/member/join.jsp" class="message">회원가입</a>
	      <button type="submit">확인</button><br>
	      
		  <!-- 카카오 로그인 -->
		  <a href="https://kauth.kakao.com/oauth/authorize?client_id=81af0dfe58ccf188fe47f9f421528ad2&redirect_uri=http://localhost/login/kakao&response_type=code">
		  	<image style="width:290px; margin-bottom:3px;" src="/resources/images/kakao_login_btn.png"></image>
		  </a>
		  <!-- 네이버 로그인 -->
		  <a href="https://nid.naver.com/oauth2.0/authorize?client_id=yvOnjHEnLyapFHXdjTK2&redirect_uri=http://localhost/login/naver&response_type=code">
		  	<image style= "width:290px; height:45px;" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"></image>
		  </a>
	    </form>
	  </div>
	  
<div class="footer"></div>

</body>
</html>