<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>      
</head>
  
<style>
    .wrap{
        width: 100%;
        height: 100%;
        position:relative;
        box-sizing: border-box;
        margin: 0px;
    }
    
     .wrap>div{
        box-sizing: border-box;
        margin: 0px;
        display: inline-block;
    }
    
    #header{
        height: 10%;
        width: 100%;
    }    
    
    #body{
        height: 90%;
        width: 100%;
    }
    
    #aside{
        width: 20%;
        height: 100%;
        float: left;
    }
    
    .contents{
        width: 80%;
        height: 100%;
        float: left;
        text-align: center;
    }
    
    .search {
        height: 30%;
        float: left;
        margin:5px;
    }  

        
</style>
          
<body>
   
   <div class="wrap"> 
      <div id="header">  <%@ include file="/WEB-INF/views/adminView/adminHeader.jsp" %> </div>
       
       <div id="body">
          
         <div id="aside">  <%@ include file="/WEB-INF/views/adminView/adminAside.jsp" %>  </div>
           
         <div class="contents">
            
            <div class="search">
                <select> 
                    <option disabled selected>검색</option>
                    <option value="memberNo">관리자 번호</option>
                    <option value="memberId">관리자 ID</option>
                    <option value="memberNickname">관리자 이름</option>
                </select>
                <input type="text">
                <input type="button" value="검색">                
            </div>
            
        	<div class="table">
                <table class="table table-hover" >        	 
                    <thead>
                        <tr style="text-align:center;">
                            <th>관리자 번호</th>                            
                            <th>관리자 ID</th>
                            <th>관리자 이름</th>
                            <th>관리자 이메일</th>
                            <th>관리자 등급</th>
                            <th>선택</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> request.scope.data  </td>
                            <td> request.scope.data </td>
                            <td> request.scope.data  </td>
                            <td> request.scope.data </td>
                            <td> request.scope.data </td>
                            <td> <input type="checkbox"> </td>
                        </tr>                                                                                  
                    </tbody>
                    <tfoot>                            
                        <tr>
                           <td colspan="2"></td>
                           <td colspan="2">
                            <nav aria-label="...">
								  <ul class="pagination">
								  		<li class="page-item"><a class="page-link" href="/board/boardMain.do?currentPage=${requestScope.start}">처음</a></li>
    									  									
    									<li class="page-item">
      										페이징 없음
									    </li>
									    
									    <li class="page-item"><a class="page-link" href="/board/boardMain.do?currentPage=${requestScope.end}">끝</a> </li>									    
 								  </ul>
							</nav>
                           </td>
                           <td colspan="2"></td>
                        </tr>                                                        
                                                       
                        <tr>
                            <td colspan="5"></td>
                            <td>    
                                
                                <button type="button"  data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                 	 변경
                                </button>
                                
                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-sm">
                                    <div class="modal-content">                                     
                                          <div class="modal-body">
                                            <br>
                                            	변경할 사항: 
                                              <select> 
                                                <option disabled selected> 조정 </option>
                                                                                                                                        
                                                <option value="B">등급B</option>
                                                <option value="C">등급C</option>
                                                <option value="D">삭제</option>
                                              </select>                                                                                            
                                              
                                          </div>
                                      <div class="modal-footer">
                                      <button type="button" class="btn btn-outline-danger">실행</button>
                                      <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            
                            </td>
                        </tr>                        
                    </tfoot>
                  </table>
             </div>   
               
           </div>
           
       </div>        
   </div>
    
</body>
</html>