<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <style>
       * {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #FAFBFE;
            font-weight: bold;
            color: #919CA7;
        }

        .wrap {
            width: 1440px;
            margin: 0 auto;
            background-color: #FAFBFE;
        }

        .div {
            width: 1000px;
            margin: 0 auto;
        }

        #header {
            height: 240px;
        }

        #subject {
            padding-top: 64px;
            color: black;
            font-size: 25px;
            text-align: center;
        }

        #line {
            background-color: #FD6F22;
            border: 0;
            height: 2px;
            margin-bottom: 20px;
            width: 1000px;
        }

        .box {
            width: 50px;
            height: 50px;
            border-radius: 70%;
            overflow: hidden;
            float: left;
            margin-left: 10px;
            margin-right: 10px;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        }

        .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        #post {
            width: 1000px;
            height: 100%;
            border: 1px solid #D8D3D0;
            text-align: center;
            margin: 0 auto;
            color: #919CA7;
            background-color: white;
            font-size: 15px;
            border-radius: 5px;
        }

        #btn {
            background: #FD6F22;
            color: white;
            border-radius: 5px;
            height: 27px;
            border: 0px;
            outline: 0px;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        }

        #comments {
            margin: 0 auto;
            width: 840px;
            height: 20px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            float: left;
            margin-top: 15px;
            margin-left: 10px;
            background-color: white;
        }

        .commentbox {
            width: 40px;
            height: 40px;
            margin-top: 8px;
            border-radius: 70%;
            overflow: hidden;
            float: left;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        }

        .commentprofile {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        #commentbox {
            margin: 0 auto;
            width: 1000px;
            margin-top: 20px;
        }

        #updateBtn {
            border: 1px solid #C4C4C4;
            box-sizing: border-box;
            border-radius: 5px;
            height: 27px;
            margin-top: 13px;
            margin-left: 7px;
            background-color: white;
        }

        #deleteBtn {
            border: 1px solid #C4C4C4;
            box-sizing: border-box;
            border-radius: 5px;
            height: 27px;
            margin-top: 13px;
            background-color: white;
        }

        #commentarea {
            margin: 0 auto;
            margin-top: 10px;
            width: 880px;
            height: 30px;
            border-color: #D8D3D0;
            background-color: white;
            resize: none;
        }

        #enter {
            background: #FD6F22;
            color: white;
            width: 100px;
            height: 30px;
            margin-top: 13px;
            float: right;
            border-radius: 5px;
            border: 0px;
            outline: 0px;
            filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        }

        #footer {
            height: 235px;
            clear: both;
        }
        
       .image img{
        width: 300px;
        height: 300px;
    }
    </style>
   
<div id="header">
    </div>
    <div style="height: 105px;"></div>
    <div class="wrap">
    
        <div class="div">

            <p id="subject">${view.subject }</p>

            <hr id="line">

            <div style="width: 1000px; margin: 0 auto;">
                <div class="box" style="background: #BDBDBD;">
                    <img class="profile" src="/resources/images/jellybear.jpg">
                </div>
                
                <p style="float: left;">${view.memberId }</p><br> 
            </div> 
            
            <br><br>
            
            <div style="width: 1000px; margin: 0 auto; text-align: right;">

                <a href="" style="text-decoration: none">신고하기</a>
            </div>
            <div id="post">
            ${view.content }
            </div>
            <button id="btn" style="margin-top :8px; cursor:pointer;" onclick="location.href='/board/community.do';">목록으로</button>
            
            
            <!-- 댓글 -->
            <div style="width: 100%; ">
            <c:forEach items="${comment }" var="c">
                <p style="float: left; margin-left: 5px;">${c.memberId }</p>

                <span id="comments">
                ${c.bComment }
                </span>
                 
                <button id="updateBtn">수정</button>
                <button id="deleteBtn">삭제</button>
                 </c:forEach>
                 

              <form action="/comment/insertComment.do" method="post">

                <div id="commentbox">
                <input style="border:none" type="text" name="memberId" readonly/>
                <textarea id="commentarea" name="bComment"> 
                </textarea>
                <input type="hidden" name="boardNo" value="${view.boardNo}">
                    <button type="submit" id="enter">댓글달기</button>
                </div>

               </form> 

            </div>
        </div>
        <div id="footer"></div>
    </div>    
</body>
</html>