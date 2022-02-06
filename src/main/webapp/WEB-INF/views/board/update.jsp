<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    * {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #FAFBFE;
        color: #919CA7;
        font-weight: bold;
    }

    .wrap {
        width: 100%;
        margin: 0 auto;
        background-color: #FAFBFE;
        width: 1000px;
    }

    #header {
        height: 240px;
    }

    #writetitle {
        padding-top: 64px;
        padding-bottom: 35px;
        font-size: 25px;
        color: black;
        text-align: center;
    }

    #subject {
        border: 1px solid #D8D3D0;
        box-sizing: border-box;
        border-radius: 5px;
        height: 27px;
        width: 960px;
        margin-bottom: 10px;
        background-color: white;
    }

    #cancleBtn {
        background: #FD6F22;
        color: white;
        border-radius: 5px;
        height: 27px;
        border: 0px;
        outline: 0px;
        filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        float: right;
    }

    #writeBtn {
        border: 1px solid #FD6F22;
        background-color: white;
        box-sizing: border-box;
        border-radius: 5px;
        margin-left: 5px;
        width: 70px;
        height: 27px;
        filter: drop-shadow(4px 4px 4px rgba(0, 0, 0, 0.10));
        float: right;
    }

    #footer {
        height: 235px;
        clear:both;
    }
</style>

<!--에디터 api-->
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<body>
    <div id="header">
    </div>
    <div style="height: 105px;"></div>
    <div class="wrap">
        <p id="writetitle">글 수정하기</p>
        <form>
        제목 <input type="text" id="subject" />

        <textarea class="form-control" id="p_content"></textarea>
        <script type="text/javascript">
            CKEDITOR.replace('p_content', {
                height: 500,
                width: 1000 px
            });
        </script>

        <div class="container">
            <div class="content" style="width: 70%">

                <div class="row justify-content-md-center">
                    <div class="col_c" style="margin-bottom: 30px">
                        <div class="input-group">
                            <script type="text/javascript">
                                CKEDITOR.replace('p_content', {
                                    height: 500
                                });
                            </script>
                        </div>
                    </div>
                </div>


                <!--
      <div class="row justify-content-md-center">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
              </div>
              <div class="custom-file">
                  &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
              </div>
            </div>
      </div>
      
      <div class="row justify-content-md-center">
        <button type="submit" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold">
             등 록          
            </button>
        </div>
        -->

            </div>
            <button id="writeBtn" type="submit">수정하기</button>
            <button id="cancleBtn">취소</button>
        </div>
        </form>
    </div>
    <div id="footer"></div> 

</body>
</html>