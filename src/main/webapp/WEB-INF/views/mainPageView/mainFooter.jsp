<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
<style>
.footer-clean {
  padding: 50px 0;
  background-color: #fff;
  color: #4b4c4d;
}

.footer-clean h3 {
  margin-top: 0;
  margin-bottom: 12px;
  font-weight: bold;
  font-size: 16px;
}

.footer-clean ul {
  padding: 0;
  list-style: none;
  line-height: 1.6;
  font-size: 14px;
  margin-bottom: 0;
}

.footer-clean ul a {
  color: inherit;
  text-decoration: none;
  opacity: 0.8;
}

.footer-clean ul a:hover {
  opacity: 1;
}

.footer-clean .item.social {
  text-align: right;
}

@media (max-width:767px) {
  .footer-clean .item {
    text-align: center;
    padding-bottom: 20px;
  }
}

@media (max-width: 768px) {
  .footer-clean .item.social {
    text-align: center;
  }
}

.footer-clean .item.social > a {
  font-size: 24px;
  width: 40px;
  height: 40px;
  line-height: 40px;
  display: inline-block;
  text-align: center;
  border-radius: 50%;
  border: 1px solid #ccc;
  margin-left: 10px;
  margin-top: 22px;
  color: inherit;
  opacity: 0.75;
}

.footer-clean .item.social > a:hover {
  opacity: 0.9;
}

@media (max-width:991px) {
  .footer-clean .item.social > a {
    margin-top: 40px;
  }
}

@media (max-width:767px) {
  .footer-clean .item.social > a {
    margin-top: 10px;
  }
}

.footer-clean .copyright {
  margin-top: 14px;
  margin-bottom: 0;
  font-size: 13px;
  opacity: 0.6;
}

</style>    

</head>
<body>
    <footer class="footer-clean" style="height: 235px;width: 100%;background: #fafbfe;">
        <hr style="color: var(--orange);height: 2px;background: #FD6F22;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-sm-4 col-md-3 item">
                    <h3>서비스</h3>
                    <ul>
                        <li>반려견 일지</li>
                        <li>병원정보</li>
                        <li>커뮤니티</li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 item">
                    <h3>안내</h3>
                    <ul>
                        <li>댕글?</li>
                        <li>오늘의 댕댕?</li>
                        <li>위치</li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 item">
                    <h3>이용방침</h3>
                    <ul>
                        <li>(준비중)</li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
                <div class="col-lg-3 item social">
                    <p class="copyright">오늘의 댕댕 © 2022</p>
                </div>
            </div>
        </div>
    </footer>
    
</body>
</html>