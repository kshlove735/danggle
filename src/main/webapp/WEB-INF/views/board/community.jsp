<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- App favicon -->
    <link rel="shortcut icon" href="/resources/images/favicon.ico">
    <!-- App css -->
    <link href="/resources/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/css/app-creative.min.css" rel="stylesheet" type="text/css" id="light-style"/>
</head>

<style>
    * {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #FAFBFE;
        font-weight: bold;
        color: #919CA7;
    }

    .wrap {
        width: 100%;
        margin: 0 auto;
        background-color: #FAFBFE;
    }

    #header {
        height: 240px;
    }

    #select {
        border: 1px solid #FD6F22;
        border-radius: 5px;
        height: 27px
    }

    #search {
        border: 1px solid #FD6F22;
        box-sizing: border-box;
        border-radius: 5px;
        width: 200px;
        height: 27px;
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

    #writeBtn {
        float: left;
        border: 1px solid #FD6F22;
        box-sizing: border-box;
        border-radius: 5px;
        height: 27px;
    }

    #commutable {
        width: 1000px;
        margin: 0 auto;
        margin-top: 10px;
        text-align: center;
        background-color: white;
        filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
    }

    #commutitle {
        padding-top: 64px;
        padding-bottom: 35px;
        font-size: 25px;
        color: black;
        text-align: center;
    }

    a {
        color: #919CA7;
    }

    #searchdiv {
        width: 1000px;
        margin: auto;
        text-align: right;
    }

    #paging {
        padding-top: 30px;
        text-align: center;
    }

    #footer {
        height: 235px;
    }
</style>
<body>

<div id="header">
</div>

<div style="height: 105px;"></div>
<div class="wrap">
    <p id="commutitle">커뮤니티 게시판</p>

    <div id="searchdiv">
        <form action="/board/community.do">
            <button id="writeBtn">글쓰기</button>
            <select id="select">
                <option style="text-align: left;" value="subject" selected>제목</option>
                <option style="text-align: left;" value="writer">작성자</option>
            </select>

            <input type="text" id="search"/>
            <button id="btn">검색</button>
        </form>
    </div>

    <table id="commutable" class="table">
        <thead>
        <tr>
            <th style="width: 10%">번호</th>
            <th style="width: 50%">제목</th>
            <th style="width: 12%">작성자</th>
            <th style="width: 15%">작성일</th>
            <th style="width: 13%">수정/삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.noticelist }" begin="1" end="5" var="n">
        <tr>
            <td class="table-user">
                ${n.noticeNo }
            </td>
            <td><a href="">${n.subject }</a></td>
            <td>관리자</td>
            <td>${n.regDateString }</td> 
            <td>
                <a href="" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                <a href="" class="action-icon"> <i class="mdi mdi-delete"></i></a>
            </td>
        </tr>
        </c:forEach>
        
        <c:forEach items="${requestScope.boardlist }" begin="1" end="10" var="b">
        <tr>
            <td class="table-user">
                ${b.boardNo }
            </td>
            <td><a href="">${b.subject }</a></td>
            <td>${b.memberId }</td>
            <td>${b.regDateString }</td>
            <td>
                <a href="" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
                <a href="" class="action-icon"> <i class="mdi mdi-delete"></i></a>
            </td>
        </tr>
        </c:forEach>

        </tbody>
    </table>

    <div id="paging">
        <a style="color: #FD6F22;" href="">Prev</a>
        <a style="color: #919CA7;" href="">1</a>
        <a style="color: #919CA7;" href="">2</a>
        <a style="color: #919CA7;" href="">3</a>
        <a style="color: #919CA7;" href="">4</a>
        <a style="color: #919CA7;" href="">5</a>
        <a style="color: #FD6F22;" href="">Next</a>
    </div>

</div>
<div id="footer"></div>

</body>
</html>