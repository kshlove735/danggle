<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>

<script>
window.onload = function(){
    alert('메인페이지 데이터.do');
}
</script>

<style>
   @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); 
    
    * {
        font-family: 'noto sans kr';
        font-size: 15px;        
        
        box-sizing: border-box;
        margin: 0px;
    } 
        
    #wrap {
        position:relative;
        width: 100%;
        height: 100%;               
    }
     
    
    #carouselBox {
        position: relative;
        top:257px;
        width:100%;
        height: 500px;
        background-color: #C4C4C4;        
    	color: black;
    }
    
    #prev{
        cursor: pointer;
        position: absolute;
        top: 116px;
        left: 212px;
        width: 50px;
        height: 100px; 
        font-size: 60px;
        z-index: 9;
    }
    
    #next:hover{
        transform: scale(1.4);
        transition-property: transform;
        transition-duration: 0.3s;
    }
        
    
     #next{
        cursor: pointer;
        width: 50px;
        height: 100px;  
        font-size: 60px;
         
        position: absolute;
        top: 116px;
        right: 212px;
        font-size: 60px;
        z-index: 9;                  
    }
    
    #prev:hover{
        transform: scale(1.4);
        transition-property: transform;
        transition-duration: 0.3s;
    }

    .slideItem {
        width: 100%;
        height: 382px;        
        background-image: url(/SDK2a/img/Doge-Head-PNG.png); 
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        position: absolute;
        z-index: 0;
        opacity: 0;
        transition: all .5s ease-in-out;
        transform: scale(0.9);
        border-radius: 20px 20px;
    }
    
    .show {
	opacity: 1;
	z-index: 1;
	transform: none;
    }

    
    #contentsBox{
        height: 2380px;
        width: 1440px;
        background-color: #FAFBFE;

        position:absolute;
        left: 200px;
        top: 758px;
    }

    #diaryBox{
        position: relative;
        top:50px;
        left: 260px;
        
        width:920px;
        height: 675px;
        background-color: #FFFFFF;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 10px 10px;
    }    
    
    #diaryTitle{
        position: relative;
        left:202px;
        top: 20px;
        width: 515px;
        height: 86px;        
        line-height: 36px;
        text-align: center;
        color: #919CA7;                
    }
    
    #diaryTitle>p{
        font-family: 'Noto Sans KR';
        font-style: normal;
        font-weight: bold;
        font-size: 25px;
    }
    
    #diaryContent {
        border: 1px solid black;
        
        cursor: pointer;
        position: relative;
        top:58px;
        left:30px;
        width: 859px;
        height: 470px;    
        border-radius: 20px;
        filter: drop-shadow( 0px 4px 4px rgba(0, 0, 0, 0.25) );
    }
    
     #areaBox{         
        position: relative;
        top: 100px;
        left: 260px;
        
        width:919px;
        height: 1036px;
        background-color: #FFFFFF;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 10px 10px;
    }    
    
    #areaTitle {
        position: relative;
        top: 20px;
        left:210px;
        line-height: 36px;
        text-align: center;
        color: #919CA7;
        width: 500px;
        height: 80px;               
    }   
    
    #areaTitle>p{
        font-family: 'Noto Sans KR';
        font-style: normal;
        font-weight: bold;
        font-size: 25px;
    }
    
    .row1{
        border: 1px solid black;
        
        cursor: pointer;
        width: 238px;
        height: 374px;
        border-radius: 20px 20px;
        display: inline-block;
        
        position: relative;
        top: 74px;
        left: 25px;
        margin: 25px;
    }
    
    .petPic {
        border: 1px solid red;
        height: 30%;
        width: 100%;
        border-radius: 20px 20px 0 0;
        background-image: url(/SDK2a/img/logo.png);
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
        
    }
    
    .petProfile{
        height: 70%;
        width: 100%;
    }        
    
    .petProfile table{        
        text-align: center;
        
        height: 100%;
        width: 100%;
    }
    .petProfile table>span{
        
    }
    
    .row2{
        border: 1px solid black;
        
        cursor: pointer;
        width: 238px;
        height: 374px;
        border-radius: 20px 20px;
        display: inline-block;
        
        position: relative;
        top: 74px;
        left: 25px;
        margin: 25px;
    }
    
    #communityBox {
        position: relative;
        top: 150px;
        left: 260px;
        
        width: 920px;
        height: 470px;
        background-color: #FFFFFF;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 10px 10px;
    }
    
    #communityTitle {
        position: absolute;
        top: 20px;
        left: 210px;
        
        line-height: 36px;
        text-align: center;
        color: #919CA7;
        width: 500px;
        height: 80px;               
    } 
    
    #communityTitle>p{
        font-family: 'Noto Sans KR';
        font-style: normal;
        font-weight: bold;
        font-size: 25px;
    }
    
    .comBox1 {
       cursor: pointer;
       width: 240px;
       height: 230px;
       background-color: #C4C4C4;
        
       position: absolute;
       left: 50px;
       bottom: 60px;  
    }
    
     .comBox2 {
       cursor: pointer;
       width: 240px;
       height: 230px;
       background-color: #C4C4C4;
        
       position: absolute;
       left: 340px;
       bottom: 60px;  
    }
    
     .comBox3 {
       cursor: pointer; 
       width: 240px;
       height: 230px;
       background-color: #C4C4C4;
        
       position: absolute;
       left: 630px;
       bottom: 60px;  
    }
    
    #header {
    border: 1plx solid black;
    width: 100%;    
    top:0;
    }
    
    #footer{
        width: 100%;
        position: absolute;
        top: 3100px;
        height: 235px;
    }

</style>  
<body style="background-color: #FAFBFE;">
   
    <div id="wrap">
        <div id="header"> <%@ include file="/WEB-INF/views/mainPageView/mainHeader.jsp" %> </div>
        
             <div id="carouselBox">
                      <!-- 캐로셀에 배치중인 이미지는 doge-head 테스트 이미지 -->
                      <div id="prev">  &lt; </div>                        
                    <div>
                        <div class="slideItem show"><h1> 1 </h1></div>
                         
                        <div class="slideItem"><h1>2</h1></div>
                         
                        <div class="slideItem"><h1>3</h1></div>
                        
                        <div class="slideItem"><h1>4</h1></div>                  
                    </div>                          
                       <div id="next">  &gt; </div>
                       
             </div>
              
             <div id="contentsBox">
                 
                 <div id="diaryBox">
                     <div id="diaryTitle"> 
                         <p> 다이어리 <p>
                         <p> 소중한 반려견의 하루하루를 기록하세요 </p>
                     </div>
                     
                     <div id="diaryContent">
                         <h2>다이어리</h2>                      
                     </div>
                     
                 </div>
                 
                 <div id="areaBox">
                     <div id="areaTitle">
                         <p> 멍세권 <p>
                         <p style="font-size: 21px;"> 우리 강아지의 베스트 프렌드부터 자격 있는 펫시터까지! </p>                         
                     </div>
                                                                   
                     <div class="row1">
                        <div class="petPic"> 사진 <!--EL태그로 request 객체에서 바로 데이터 출력+resize값 확인 필수, div 요소의 background img URL로 처리? --> </div>
                        <div class="petProfile"> 
                           
                            <table>
                                <tr>
                                    <td> 이름 </td>    
                                    <td> <span> 경복이 </span> </td>
                                    <!--EL태그로 request 객체에서 바로 데이터 출력 -->
                                </tr>
                                
                                <tr>
                                    <td> 성별 </td>    
                                    <td> <span> 남 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 생일 </td>    
                                    <td> <span> 2020/01/20 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 품종 </td>    
                                    <td> <span> 말티즈 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 사이즈 </td>    
                                    <td> <span> 소형견 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 접종유무 </td>    
                                    <td> <span> 진행중 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 중성화유무 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>
                                
                            </table>                         
                            
                        </div>
                        
                     </div>
                     
                     <div class="row1">
                        <div class="petPic"> 사진 </div>
                        <div class="petProfile">   
                         
                          <table>
                                <tr>
                                    <td> 이름 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 성별 </td>    
                                    <td> <span> 남 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 생일 </td>    
                                    <td> <span> 2020/01/20 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 품종 </td>    
                                    <td> <span> 말티즈 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 사이즈 </td>    
                                    <td> <span> 소형견 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 접종유무 </td>    
                                    <td> <span> 진행중 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 중성화유무 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>                                
                            </table>                       
                                                                         
                        </div>                        
                     </div>
                     
                     <div class="row1">
                        <div class="petPic"> 사진 </div>
                        <div class="petProfile"> 
                         
                          <table>
                                <tr>
                                    <td> 이름 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 성별 </td>    
                                    <td> <span> 남 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 생일 </td>    
                                    <td> <span> 2020/01/20 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 품종 </td>    
                                    <td> <span> 말티즈 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 사이즈 </td>    
                                    <td> <span> 소형견 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 접종유무 </td>    
                                    <td> <span> 진행중 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 중성화유무 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>                                
                            </table> 
                                                    
                        </div>                        
                     </div>
                    
                    <div class="row2">
                        <div class="petPic"> 사진 </div>
                        <div class="petProfile"> 
                         
                          <table>
                                <tr>
                                    <td> 이름 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 성별 </td>    
                                    <td> <span> 남 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 생일 </td>    
                                    <td> <span> 2020/01/20 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 품종 </td>    
                                    <td> <span> 말티즈 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 사이즈 </td>    
                                    <td> <span> 소형견 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 접종유무 </td>    
                                    <td> <span> 진행중 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 중성화유무 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>                                
                            </table> 
                                                    
                        </div>                                            
                    </div>
                    
                    <div class="row2">
                        <div class="petPic"> 사진 </div>
                        <div class="petProfile"> 
                         
                          <table>
                                <tr>
                                    <td> 이름 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 성별 </td>    
                                    <td> <span> 남 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 생일 </td>    
                                    <td> <span> 2020/01/20 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 품종 </td>    
                                    <td> <span> 말티즈 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 사이즈 </td>    
                                    <td> <span> 소형견 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 접종유무 </td>    
                                    <td> <span> 진행중 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 중성화유무 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>                                
                            </table> 
                                                    
                        </div>                                            
                    </div>
                    
                    <div class="row2">
                        <div class="petPic"> 사진 </div>
                        <div class="petProfile"> 
                         
                          <table>
                                <tr>
                                    <td> 이름 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 성별 </td>    
                                    <td> <span> 남 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 생일 </td>    
                                    <td> <span> 2020/01/20 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 품종 </td>    
                                    <td> <span> 말티즈 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 사이즈 </td>    
                                    <td> <span> 소형견 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 접종유무 </td>    
                                    <td> <span> 진행중 </span> </td>
                                </tr>
                                
                                <tr>
                                    <td> 중성화유무 </td>    
                                    <td> <span> 경복이 </span> </td>
                                </tr>                                
                            </table> 
                                                    
                        </div>                                            
                    </div>
                    
                 </div>

                 <div id="communityBox">
                 
                       <div id="communityTitle">
                           <p>커뮤니티</p>
                           <p>우리 강아지에게 유익한 정보 가득!</p>
                       </div>
                       
                       <div class="comBox1"> <!-- 출력될 값이 어떤 종류인지 확인해야 함 --> </div>
                       <div class="comBox2"> </div>
                       <div class="comBox3"> </div>                         
                </div>                                                                                                                                                                                                          
             </div> 
             
                     <div id="footer"> <%@ include file="/WEB-INF/views/mainPageView/mainFooter.jsp" %> </div>                                             
    </div>
          
<script>
    
const firstSlide = document.querySelector('.slideItem:first-child');
const lastSlide = document.querySelector('.slideItem:last-child');
    
document.getElementById('next').addEventListener('click', prevSlide);
document.getElementById('prev').addEventListener('click', nextSlide);

function nextSlide() {
  const currentSlide = document.querySelector('.show');
  if(currentSlide) {
    currentSlide.classList.remove('show');
    const nextSlide = currentSlide.nextElementSibling;

    if(nextSlide) {
      nextSlide.classList.add('show');
    } else {
      firstSlide.classList.add('show');
    }
  } else {
    firstSlide.classList.add('show');
  }
}


function prevSlide() { 
  const currentSlide = document.querySelector('.show');
  if(currentSlide) {
    currentSlide.classList.remove('show');
    const prevSlide = currentSlide.previousElementSibling;
    
    if(prevSlide) {
      prevSlide.classList.add('show');
    } else {
      lastSlide.classList.add('show');
    }
  } else {
    lastSlide.classList.add('show');
  }
}
</script>
    
    
    
   <script>
        $('.row1').click(function(){
           alert('멍세권 이동');
        });
       
       $('.row2').click(function(){
           alert('멍세권 이동');
        });
       
       $('#diaryContent').click(function(){
           alert('다이어리 이동');
        });
       
       $('.comBox1').click(function(){
           alert('커뮤니티 이동');
        });
       
       $('.comBox2').click(function(){
           alert('다이어리 이동');           
        });
       
       $('.comBox3').click(function(){
           alert('다이어리 이동');           
        });
       
   </script>
    
</body>
</html>