<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 댕댕 ｜ 아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/searchIdPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" 
integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
<div class="header"></div>

	  <div class="form">
	      <h2>아이디 찾기</h2>
	      <hr>
	      <input type="email" id="email" style="margin-bottom:1px;" placeholder="이메일을 입력하세요"/>
	      <button class="longBtn" id="sendEmailCodeBtn">인증번호 받기</button><br>
	      
	      <input type="text" id="findIdCode" placeholder="6자리 코드 입력" style="display:none;"/>
	      <button class="smallBtn" id="resendBtn" style="display:none;">재전송</button>
	      <div id="timer" style="display:none; font-size:12px;"></div>
	      <button class="longBtn" id="findIdBtn" style="display:none;">아이디 찾기</button>
	      
	      <div id="showId" style="display:none;">아이디는 <b id="memberId"></b> 입니다. </div><br>
	      <div id="showEnrollDate" style="display:none; font-size:10px;">가입일 :  <b id="enrollDate"> </b></div>
	      <a href="/resources/views/login.jsp" class="longBtn" id="loginBtn" style="display:none;">로그인하기</a>
	  </div>
	  
	  
<div class="footer"></div>

<script>
	//인증번호 받기
	$('#sendEmailCodeBtn').click(function(){
		var email = $('#email').val();
		$.ajax({
			url:"/findId/sendEmailCode.do",
			data:{"email":email},
			type:"POST",
			success:function(result){
				if(result=="true"){
					alert('이메일로 인증번호가 발송되었습니다.');
					$('#email').hide();
					$('#sendEmailCodeBtn').hide();
					
					$('#findIdCode').show();
					$('#timer').show();
					$('#resendBtn').show();
					$('#findIdBtn').show();
					timer();
				}else{
					alert('가입 시 입력한 이메일이 맞는지 다시 한번 확인해 주세요.');
				}
			},
			error:function(){
				console.log('ajax 통신 실패');
			}
		})
	})
	
	//인증번호 입력하여 아이디 찾기 
	$('#findIdBtn').click(function(){
		var findIdCode = $('#findIdCode').val();
		var email = $('#email').val();
		$.ajax({
			url:"/findId/checkIdCode.do",
			data:{"findIdCode":findIdCode, "email":email},
			type:"POST",
			success:function(data){
				var info = JSON.parse(data);
				var sendDate = info.SENDDATE;
				var memberId = info.MEMBERID;
				var enrollDate = info.ENROLLDATE;
				$('#findIdCode').hide();
				$('#resendBtn').hide();
				$('#timer').hide();
				$('#findIdBtn').hide();
				
				$('#showId').show();
				$('#memberId').html(memberId);
				$('#showEnrollDate').show();
				$('#enrollDate').html(enrollDate);
			},
			error:function(){
				console.log('ajax통신 실패');
			}
		})
	})							
	
	//인증번호 재전송 + 타이머 리셋
	$('#resendBtn').click(function(){
		var email = $('#email').val();
		$.ajax({
			url:"/findId/sendEmailCode.do",
			data:{"email":email},
			type:"POST",
			success:function(result){
				if(result=="true"){
					alert('이메일로 인증번호가 재발송되었습니다.');
					//타이머 겹침
					timer();
				}else{
					alert('재전송에 실패하였습니다.');
				}
			},
			error:function(){
				console.log('ajax 통신 실패');
			}
		})
	})
</script>

<script>
function timer(){
	var time = 180;
	var min = "";
	var sec = "";
	
	var x = setInterval(function(){
		min = parseInt(time/60); //몫
		sec = time%60; //나머지
		$('#timer').html(min + "분" + sec + "초");
		time--;
		
		//타임아웃시
		if(time < 0){
			clearInterval(x);
			alert('인증 시간이 초과되었습니다. 다시 전송해 주세요');
		}
	}, 1000);
}
</script>
	
</body>
</html>