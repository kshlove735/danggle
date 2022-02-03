<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap 사용중 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<style>
   @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
   @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
    
    * {
        font-family: 'noto sans kr';
        font-size: 15px;        
        
        box-sizing: border-box;
        margin: 0px;
    }
    
    #wrap {
        width: 100%;
        height: 240px;
        position: absolute;
    }
    
    #head {
        cursor:pointer;
        position: relative;
        left:645px;
        width: 550px;
        top: 7px;
        bottom:  7px;
        height: 180px;
        text-align: center;                  
    }
    
    #head>a{
        border: 1px solid black;
        width: 80%;
        height: 100%;
        display: inline-block;
        
    }
    
    
    #head>a:hover{
        transform: scale(1.1);
        transition-property: transform;
        transition-duration: 0.2s;
    }
    
    #menuWrap {
        position: relative;
        width: 100%;
        height: 70px;        
    }
    
    #menuBox {
        width: 652px;
        height: 31px;
        
        position: absolute;
        top: 20px;
        left: 598px;        
    }
    
    #menuBox>span>span {
        font-family: 'Black Han Sans';
        font-size: 25px;
        cursor:pointer;
    }
    
    #menuBox>span>span:hover{
        transform: scale(1.2);
        transition-property: transform;
        transition-duration: 0.3s;
    }
    
    #diary {
        position: absolute;
        right: 512px;
    }

    #area{
        position: absolute;
        right: 372px;
    }
    
    #community {
        position: absolute;
        right: 212px;
    }
    
    #vet {
        position: absolute;
        left: 519px;
    }
    
    
    
    #loginBox {
        width: 117px;
        height: 47px;
        background-color: #FD6F22;
        border-radius: 25px 25px; 
        text-align:center;
        
        position: absolute;
        right: 186px;
        top: 12px;
    }
    
    #logoutBox {
        width: 127px;
        height: 47px;
        background-color: #FD6F22;
        border-radius: 25px 25px; 
        text-align:center;
        
        position: absolute;
        right: 186px;
        top: 12px;
    }
    
    #joinBox {
        width: 127px;
        height: 47px;
        border-radius: 25px 25px; 
        border: 1px solid #FD6F22;
        box-sizing: border-box;   
        text-align:center;
        
        position: absolute;
        right: 33px;
        top: 12px;
    }
    
    #login {
        cursor:pointer;
        line-height: 47px;
        vertical-align: middle;
        font-size: 25px;
        color: #ffffff;
    }
    
    #loginBox:hover{        
      color: #fff;
      text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #FD6F22;
    }
    
    #logout {
        cursor:pointer;
        line-height: 47px;
        vertical-align: middle;
        font-size: 25px;
        color: #ffffff;
    }
    
    #logoutBox:hover{        
      color: #fff;
      text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px #FD6F22;
    }
    
    
     #join {
        cursor:pointer;
        line-height: 47px;
        vertical-align: middle;
        font-size: 25px;       
    }
    
    #joinBox:hover{
     color: #FD6F22;     
    }
    
     #info {
        cursor:pointer;
        line-height: 47px;
        vertical-align: middle;
        font-size: 25px;       
    }
    
    #infoBox:hover{
     color: #FD6F22;     
    }

    .headUnderline:after {    
  background: none repeat scroll 0 0 transparent;
  bottom: 0;
  content: "";
  display: block;
  height: 2px;
  left: 50%;
  position: absolute;
  background: #ffb000;
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
  width: 0;
}
.headUnderline:hover:after { 
  width: 100%; 
  left: 0; 
}
</style>
<body>

    <div id="wrap">
        <div id="head"> <a img src="/logo.png"> </a>  </div>
        
        <div id="menuWrap"> 
           
            <div id="menuBox">
                <span class="headUnderline">  <span id="diary">내 반려견 일기</span> </span>
              <span class="headUnderline">  <span id="area">멍세권 </span> </span>
              <span class="headUnderline">  <span id="community">커뮤니티</span> </span>
              <span class="headUnderline">  <span id="vet">동물병원 찾기</span> </span>
            </div>
         
        <c:choose>
            <c:when test="${sessionScope.member != null }" >    
                <div id="logoutBox">
                    <span id="logout"> ${(sessionScope.member.nickname)} </span> 
                </div>
            
                <div id="infoBox"> 
                    <span id="info">회원정보</span>
                </div>
             </c:when>    
        
            <c:otherwise>
            <c:if test="${sessionScope.member == null }" >            
                <div id="loginBox">
                    <span id="login">로그인</span>
                </div>

                <div id="joinBox"> 
                    <span id="join">회원가입</span>
                 </div>
            </c:if>
            </c:otherwise>    
        </c:choose>        
        </div>
    </div>    
    
    
    <script>
        
        $('#head>a').click(function(){
            location.replace("/");
        });
        
        $('#diary').click(function(){
            location.replcae("/myPage/diaryPage.do");
        });
        
        $('#area').click(function(){
				alert('멍세권으로 이동');
        });
        
        $('#community').click(function(){
            location.replcae("/board/community.do");
        });
        
        $('#vet').click(function(){
            location.replace("/hospital/hospitalInfo.do");
        });
        
        $('#login').click(function(){
        	location.replace("/resources/staticViews/member/login.jsp");
        });
        
        $('#join').click(function(){
        	location.replace("/resources/staticViews/member/join.jsp");
        });
        
        $('#info').click(function(){
            location.replcae("/myPage/memberInfoPage.do");
        });
        
        $('#logout').click(function(){
                alert('로그아웃으로 이동'); 
        });
        
    </script>
    
</body>
</html>