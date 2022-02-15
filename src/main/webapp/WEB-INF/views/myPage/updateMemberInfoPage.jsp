<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- JSTL 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

   <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 15px;
            font-weight: bold;
            color: #919CA7;
        }

        .wrap {
            border: 1px solid black;
            width: 100%;
            height: 1600px;
            background: #FAFBFE;
        }

        /*header(헤더)*/
        .header {
            border: 1px solid black;
            width: 100%;
            height: 240px;
            background: #FFFFFF;
        }

        /*container(컨테이너)*/
        .container {
            border: 1px solid black;
            width: 1440px;
            height: 1125px;
            margin: 0 auto;
        }

        /*사이드 네비*/
        .navi {
            border: 1px solid #eef2f7;
            width: 268px;
            height: 908px;
            position: relative;
            top: 105px;
            border-radius: 5px;
            float: left;
            background: #FFFFFF;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));

        }

        .side_menu {
            margin-top: 64px;
        }

        .side_menu>li {
            margin-bottom: 45px;
            list-style: none;
        }

        .side_menu>li>a {
            color: #919CA7;
            text-decoration: none;
        }

        .side_menu>li:first-child>a {
            color: #000000;
        }

        .side_menu>li:hover>a {
            color: #000000;
        }

        .side_menu>li:hover ul {
            display: block;
        }

        .side_submenu {
            padding-left: 15px;
            display: none;
        }

        .side_submenu>li {
            list-style: none;
            margin: 10px 0 10px 0;
        }

        .side_submenu>li>a {
            color: #919CA7;
            text-decoration: none;
            font-size: 13px;
        }

        .side_submenu>li:hover>a {
            color: #000000;
        }

        /*컨텐츠*/
        .content {
            border: 1px solid #eef2f7;
            width: 1152px;
            height: 908px;
            position: relative;
            top: 105px;
            border-radius: 5px;
            float: right;
            background: #FFFFFF;
            text-align: center;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        }

        .content>p {
            font-size: 25px;
            margin: 0;
            position: relative;
            top: 64px;
            color: #000000;

        }

        .img {
            border: 1px solid #eef2f7;
            background-color: #FD6F22;
            width: 121px;
            height: 116px;
            border-radius: 100%;
            position: relative;
            top: 130px;
            left: 515px;
        }
        
        img {
			width: 100%;
			height: 100%;
			object-fit: fill;
			border-radius: 100%;
			}

		table{
			/* border: 1px solid #FD6F22; */
		}
		
        table tr td {
            height: 60px;
            vertical-align: top;
            line-height: 33px;
        }
        
        td span{
        	color:red;
        	margin-bottom: 10px;
        }

        table tr td:last-child {
            padding-left: 34px;

        }

        .btn {
            /* border: 1px solid #FD6F22; */
            position: relative;
            bottom: -230px;
            
        }

        /*수정폼*/
        .user_info_modify_table {
            /*border: 1px solid black;*/
            width: 400px;
            height: 420px;
            position: relative;
            top: 157px;
            text-align: left;
            margin: 0 auto;
        }
        
        .txt_guide{
        	display: none;
        	margin: 0 0 5px 0; 
        }
        .txt_guide span{
        	font-size:12px;
        }

        input[type=text],
        input[type=email] {
            width: 250px;
            height: 37px;
            border: 1px solid #919CA7;
            border-radius: 5px;
            padding: 0 8px 0 8px;
        }
        
        select{
         	border: 1px solid #919CA7;
         	height: 37px;
            border-radius: 5px;
        }

        label {
            margin-right: 30px;
        }

        .modify_fin_btn {
            width: 67px;
            height: 35px;
            margin: 0 15px;

            border: 1px solid #FD6F22;
            background-color: #FD6F22;
            color: #ffffff;
            border-radius: 5px;
            cursor: pointer;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        }

        .cancel_btn {
            width: 67px;
            height: 35px;
            margin: 0 15px;

            border: 1px solid #FD6F22;
            background-color: #ffffff;
            border-radius: 5px;
            cursor: pointer;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        }
        
        a{
        	text-decoration: none;
        }


        /*footer(풋터)*/
        .footer {
            border: 1px solid black;
            width: 100%;
            height: 235px;
            background-color: dimgrey;
        }
    </style>

</head>
<body>

    <div class="wrap">
        <div class="header"></div>
        <div class="container">
            <div class="navi">
                <ul class="side_menu">
                    <li><a href="/myPage/memberInfoPage.do">마이 페이지</a>
                        <ul class="side_submenu">
                            <li><a href="/myPage/memberInfoPage.do">회원 정보</a></li>
                            <li><a href="/myPage/dogInfoPage.do">반려견 정보</a></li>
                        </ul>
                    </li>
                    <li><a href="/myPage/diaryPage.do">내 반려견 일기</a></li>
                </ul>

            </div>
            <div class="content">
                <p>회원 정보 수정</p>
                <form action="/myPage/updateMemberInfo.do" method="post" onsubmit="return updateMemberInfo();" enctype="multipart/form-data"  >
                
	                <div class="img">
	                	<c:set var="memberProfile" value="${sessionScope.member.memberProfile }" />
						<c:choose>
							<c:when test="${fn:contains(memberProfile,'null') }">
								<img id="user_icon" src="/resources/images/user_icon.png" onclick="profileUpload()"></img>
							</c:when>
							<c:otherwise>
								<img id="user_icon" src="/resources/upload/memberProfile/${sessionScope.member.memberProfile }" onclick="profileUpload()"></img>
							</c:otherwise>
						</c:choose>
	                </div>
	                <input type=file name='profileFile' style='display: none;' onchange="readURL(this);">
	          				 
	          		 <!-- 사진 클릭 시 파일 업로드창 생성 -->
	          		<script>
	          			function profileUpload() {
	          				document.all.profileFile.click();
						}
	          		</script>
	          				 
	          		<script>
	          			function readURL(input){
	          				if(input.files && input.files[0]){
	          					var reader=new FileReader();
		          				reader.onload=function(e){
		          				document.getElementById('user_icon').src=e.target.result;
		          				};
		          				reader.readAsDataURL(input.files[0]);	
	          				 }else{
	          				 	document.getElementById('user_icon').src="";
	          				 }
	          			}
	          		</script>
	
	                <!--수정 폼-->
	                <div class="user_info_modify_table">
	                    <table>
	                        <tr>
	                            <td width='90px'>아이디</td>
	                            <td>${sessionScope.member.memberId }</td>
	                        </tr>
	                        <tr>
	                            <td>닉네임<span>*</span></td>
	                            <td>
	                            	<input type="text" onfocus="input_txt(this)" onkeyup="check(this)"  name="nickname" value="${sessionScope.member.nickname }">
	                            	<p class="txt_guide">
	                                    <span id="nicknameCheck">* 한글 또는 영문 최대 8글자로 입력해 주세요.</span><br>
	                                </p>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>성별<span>*</span></td>
	                            <td>
	                            	
	                            	<c:choose>
	                            		<c:when test="${sessionScope.member.gender=='M' }">
	                            			<label><input type="radio" name="gender" value="M" checked>남</label> <label><input type="radio" name="gender" value="F" >여</label>	
	                            		</c:when>
	                            		<c:otherwise>
	                            			<label><input type="radio" name="gender" value="M" >남</label> <label><input type="radio" name="gender" value="F"  checked>여</label>
	                            		</c:otherwise>
	                            	</c:choose>
	                            	
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>이메일<span>*</span></td>
	                            <td>
	                            	<input type="email" name="email" onfocus="input_txt(this)" onkeyup="check(this)" value="${sessionScope.member.email }">
	                            	<p class="txt_guide">
	                                    <span id="emailCheck">* 이메일 형식으로 입력해주세요.</span><br>
	                                </p>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>생년월일</td>
	                            <td>
	                            	<select name="yy" id="year" class="birthdate">
	                            		<option value="" selected hidden>--</option>
		        						<option value="">--</option>
		        					</select>년 &nbsp;
           							<select name="mm" id="month" class="birthdate">
	                            		<option value="" selected hidden>--</option>
		        						<option value="">--</option>           							
           							</select>월 &nbsp;
            						<select name="dd" id="day" class="birthdate">
	                            		<option value="" selected hidden>--</option>
		        						<option value="">--</option>            						
            						</select>일 &nbsp;
            						<!-- <input type="text" id="birthdate" name="birthdate" value="" style="display:none;"> -->
            						<input type="text" id="birthdate" name="b_birthdate" value="${sessionScope.member.birthdate }" style="display:none;">
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                            <td>주소</td>
	                            <td><input type="text" id="address_kakao" name="address" value="${sessionScope.member.address }"></td>
	                        </tr>
	                        <tr>
	                            <td>상세주소</td>
	                            <td><input type="text" name="addressDetail" value="${sessionScope.member.addressDetail }"></td>
	                        </tr>
	                    </table>
	                </div>
	
	                <div class="btn">
	                	<input type="submit" class="modify_fin_btn" value="수정">
	                    <button type="button" class="cancel_btn"><a href="/myPage/memberInfoPage.do">취소</a></button>
	                </div>
	                
	                <script>
	                	/* 필수 값 유효성 검사 가이드 텍스트 보여주기 */
	                	function input_txt(val) {
							$(val).next().css("display", "block");
						}
	                	
	                	/* 타이핑과 함께 유효성 검사 진행 -> 검사 여부에 따라 가이드 텍스트 색상 변경 */
	                	function check(val){
	                		if($(val).attr('name')=='nickname'){
	                				var nickname=$(val).val();
	                				var nicknameRule = /^([a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,8}$/;
	                				if(!nicknameRule.test(nickname)){
	                					$('#nicknameCheck').css("color", "red");
	                					
	                				}else{
	                					$('#nicknameCheck').css("color", "green");
	                				}
	                		}else{
	                			var email=$(val).val();
	                			var emailRule = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	                			if(!emailRule.test(email)){
	                				$('#emailCheck').css("color", "red");
	                			}else{
	                				$('#emailCheck').css("color", "green");
	                			}
	                			
	                		}
	                		
	                	}
	                	
	                    
	                	
	                </script>
	                
	                <!-- 카카오 주소 API -->
	                    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	              		<script>
		              		window.onload = function(){
		              			//주소입력칸을 클릭하면 카카오 지도 발생
		              		    document.getElementById("address_kakao").addEventListener("click", function(){ 
		              		        new daum.Postcode({
		              		            oncomplete: function(data) { //선택시 입력값 세팅
		              		                document.getElementById("address_kakao").value = data.address; //주소 넣기
		              		                document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
		              		            }
		              		        }).open();
		              		    });
		              		}
	              		</script>
	                
	                <script>
		                function updateMemberInfo(){
		                	// 플래그값 관리
		        			var flag = 0;
		        			// 필수입력값 체크
		        			var nickname = $('input[name=nickname]').val();
		        			var email = $('input[name=email]').val();
		        			
		        			if(nickname ==''|| nickname== null || nickname == undefined) flag = 1;
		        			if(email ==''|| email== null || email == undefined) flag = 1;
		                	
		        			if(flag == 1){
		        				alert("필수 입력값을 채워주세요.");
		        				return false;
		        			}else{
		        				return true;
		        			}
		                	
		                }
	                	
	                </script>
	                
	                
	                
	                
                </form>
            </div>
        </div>
        <div class="footer"></div>
    </div>

      <!-- 생년월일 -->
      <script>
      $(document).ready(function(){            
		    var now = new Date();
		    var year = now.getFullYear();
		    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
		    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
		    //년도 selectbox만들기               
		    for(var i = 1900 ; i <= year ; i++) {
		        $('#year').append('<option value="' + i + '">' + i + '</option>');    
		    }
		
		    // 월별 selectbox 만들기            
		    for(var i=1; i <= 12; i++) {
		        var mm = i > 9 ? i : "0"+i ;            
		        $('#month').append('<option value="' + mm + '">' + mm + '</option>');    
		    }
		    
		    // 일별 selectbox 만들기
		    for(var i=1; i <= 31; i++) {
		        var dd = i > 9 ? i : "0"+i ;            
		        $('#day').append('<option value="' + dd + '">' + dd+ '</option>');    
		    }
          
          // 기존 정보 가져와서 기본 값으로 설정
          var birthdate= $('input[name=b_birthdate]').val();
          var year =birthdate.substring(0,4);
          var mon =birthdate.substring(4,6);
          var day =birthdate.substring(6,8);
    
          $("#year  > option[value="+year+"]").attr("selected", "true");        
          $("#month  > option[value="+mon+"]").attr("selected", "true");    
          $("#day  > option[value="+day+"]").attr("selected", "true");   
          
          /* $('#birthdate').attr('value',year+mon+day); */
      })
      
      
   </script>



</body>
</html>