<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/mainIndex.css">
</head>

<script>
window.onload = function(){
    alert('메인페이지 데이터.do');
}
</script>

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