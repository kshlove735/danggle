<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인 페이지</h1>
	
	<c:choose>
		<c:when test="${sessionScope.member != null}">
			[${sessionScope.member.memberNickname }]님 환영합니다.
			<a href="/myPage/memberInfoPage.do">마이페이지</a>
		</c:when>

		<c:otherwise>
			<a href="/resources/views/member/login.jsp">로그인</a>  
		</c:otherwise>	
	</c:choose>
	
	
</body>
</html>