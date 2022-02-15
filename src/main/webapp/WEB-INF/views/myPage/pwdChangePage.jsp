<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 15px;
            font-weight: bold;
            color: #919CA7;
        }

        .wrap {
            /*border: 1px solid red;*/
            width: 520px;
            height: 480px;
            margin: 0 auto;
           
        }

        .content {
            /*border: 1px solid black;*/
            width: 520px;
            
            margin: 0 auto;
            
            position: relative;
            top: 70px;
        }


        input[type=password] {
            width: 330px;
            height: 37px;
            border: 1px solid #919CA7;
            border-radius: 5px;
            padding: 0 10px 0 10px;
        }

        .pwd_change_btn {
            border: 1px solid #FD6F22;
            background-color: #FD6F22;
            color: #ffffff;
            width: 120px;
            height: 40px;
            border-radius: 5px;
            cursor: pointer;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
            margin: 0 13px;

        }

        .cancel_btn {
            width: 67px;
            height: 40px;
            border: 1px solid #FD6F22;
            background-color: #ffffff;
            border-radius: 5px;
            cursor: pointer;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
            margin: 0 13px;
        }
        table{
            margin: 0 auto;
        }
        td{
        	vertical-align: top;
        	line-height: 40px;
        }
        
        tr>td:first-child{
            width: 150px;
            height: 80px;
            
        }
        .content>div:last-child{
            /*border: 1px solid red;*/
            text-align: center;
            margin-top: 30px;
        }
        
        .txt_guide{
        	margin: 0 0 10px 0;
        	display: none;
        
        }
        .txt_guide>span{
        	color:red;
        	font-size: 12px;
        }
        
        #newMemberPwdCheck{
        	margin: 0;
        }
        
    </style>
    
    <script>
        function cancel(){
            window.close();
        }
    </script>
    
    <script>
	    /* 필수 값 유효성 검사 가이드 텍스트 보여주기 */
		function input_txt(val) {
			$(val).next().css("display", "block");
		}
	
    </script>
</head>
<body>

    <div class='wrap'>
        <div class='content'>

            <table>
                <tr>
                    <td>현재 비밀번호</td>
                    <td><input type='password' name='originalMemberPwd' placeholder='비밀번호를 입력해주세요.'></td>
                </tr>
                <tr>
                    <td>새 비밀번호</td>
                    <td>
                    	<input type='password' onfocus="input_txt(this)" onkeyup="check(this)" name='newMemberPwd' placeholder='새 비밀번호를 입력해주세요.'>
                    	<p class="txt_guide">
	                    	<span id="newMemberPwdCheck">* 영문/숫자/특수문자를 조합하여 8~15자로 입력 해주세요.</span><br>
	                    	
						</p>
                    </td>
                </tr>
                <tr>
                    <td>새 비밀번호 확인</td>
                    <td>
                    	<input type='password' onfocus="input_txt(this)" onkeyup="check(this)" name='newMemberPwd_re' placeholder='새 비밀번호를 한 번 더 입력해주세요.'>
                    	<p class="txt_guide">
	                    	<span id="newMemberPwd_reCheck">* 새 비밀번호와 동일하게 입력해 주세요.</span><br>
						</p>
                    </td>
                </tr>
            </table>

            <div class="btn"><button class="pwd_change_btn" onclick="pwd_change()">비밀번호 변경</button> <button class="cancel_btn" onclick="cancel()">취소</button></div>
        </div>
    </div>


	<script>
	
	
	</script>



	<script>
		/* 타이핑과 함께 유효성 검사 진행 -> 검사 여부에 따라 가이드 텍스트 색상 변경 */
		function check(val){
			if($(val).attr('name')=='newMemberPwd'){
				var newMemberPwd=$(val).val();
				var newMemberPwdRule =  /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
				if(!newMemberPwdRule.test(newMemberPwd)){
					$('#newMemberPwdCheck').css("color", "red");
					
				}else{
					$('#newMemberPwdCheck').css("color", "green");
				}
			}else{
				var newMemberPwd_re=$(val).val();
				var newMemberPwd = $('input[name=newMemberPwd]').val();
				if(newMemberPwd!=newMemberPwd_re){
					$('#newMemberPwd_reCheck').css("color", "red");
				}else{
					$('#newMemberPwd_reCheck').css("color", "green");
				}
				
			}
		}
		
	
		function pwd_change() {
			var originalMemberPwd= $('input[name=originalMemberPwd]').val();
			var newMemberPwd= $('input[name=newMemberPwd]').val();
			var newMemberPwd_re= $('input[name=newMemberPwd_re]').val();
			
			var rule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
			// 플래그 값 관리
			var flag=0;
			
			if(originalMemberPwd ==''|| originalMemberPwd== null || originalMemberPwd == undefined) flag = 1;
			if(newMemberPwd ==''|| newMemberPwd== null || newMemberPwd == undefined) flag = 1;
			if(newMemberPwd_re ==''|| newMemberPwd_re== null || newMemberPwd_re == undefined) flag = 1;
			
			if(flag==1){
				alert("필수 입력값을 채워주세요.");
				return false;
			}else if(!(rule.test(newMemberPwd)) && !(rule.test(newMemberPwd_re))){
				alert("비밀번호 양식에 맞게 입력해주세요.");
				return false;
			}else if(newMemberPwd!=newMemberPwd_re){
				alert("새 비밀번호와 동일하게 입력해주세요.");
				return false;
			}else{
				$.ajax({
					url:"/myPage/updatePwdChange.do",
					data:{"originalMemberPwd":originalMemberPwd, "newMemberPwd":newMemberPwd},
					type:"post",
					success: function(result){
						if(result=='true'){
							alert('비밀번호 변경 성공');
							window.close();
						}else{
							alert('비밀번호 변경 실패 - 비밀번호를 확인해 주세요');
						}
					},
					error: function(){
						console.log("ajax 통신 오류");
					}
				});
			}
			
			
			
		}
		
	</script>
</body>
</html>