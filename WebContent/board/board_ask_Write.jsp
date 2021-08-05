<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>

    <head>

        <title>Board_Content_Write</title>

    </head>
    
    <style type="text/css">
        
        *{
            padding: 0;
            margin: 0;
        }

        #maindiv{
            margin: 0 auto;
            width: 790px;
            margin-top: 100px;
        }

        #buttondiv{
            margin: 0 auto;
            width: 790px;
            height: 50px;
        }

        #buttons{
            float: right;
        }

        ul, li{
            list-style: none;
        }
		#title_textarea{
            border-radius: 5px 5px;
            width: 790px;
            height: 24px;
            resize: none;
            text-indent: 5px; /* 들여쓰기 5px*/
        }
        
        .hoverbtn{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.hoverbtn:hover{
  background:#fff;
  color:#1AAB8A;
}
.hoverbtn:before,.hoverbtn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.hoverbtn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.hoverbtn:hover:before,.hoverbtn:hover:after{
  width:100%;
  transition:800ms ease all;
}

    </style>


    <body>
        <div id="header">
            <jsp:include page="../MyhomepageHeader.jsp"></jsp:include>
        </div>
            <div id="maindiv">
            	<form action="board_ask_Write.mdts" method="post" name="write" enctype="multipart/form-data">
            	<!-- form에서 파일 또는 이미지를 전송하기 위해서는 enctype이 “multipart/form-data”로 설정되어 있어야 한다. 따라서, request.getParameter()로 데이터를 불러올 수 없게 된다.
				또한 enctype은 post방식에서만 존재하기 때문에 GET방식에서는 파일전송이 불가능하다. -->
                <ul>
                    
                    <li>제목</li>
                        <ul>
                        	<li><textarea id="title_textarea" name="b_ask_title" placeholder="제목을 입력하세요"></textarea></li>
                        </ul>
                    <li>내용</li>
                        <ul>
                           <li>
                           <textarea id="summernote_content" name="b_ask_content"></textarea>
                           </li>
                       </ul>
                    <li>첨부파일</li>
                       	<ul>
                       		<li>
                       			<input name="b_ask_file" type="file"/>
                       		</li>
                       	</ul>
                </ul>
        </form>
		<div id="buttondiv">
        <div id="buttons">
                <button id="write_cancel" class="hoverbtn">취소</button>
                <button id="write_confirm" class="hoverbtn">작성</button>
                </div>
           </div>                        
        </div>
            
        <div id="footer">
        <jsp:include page="../MyhomepageFooter.jsp"></jsp:include>
        </div>
    </body>

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


    <script type="text/javascript">

        window.onload = function(){

            document.getElementById("write_cancel").onclick = function(){
                history.back();
            }

            document.getElementById("write_confirm").onclick = function(){
                write.submit();
            }
        }

        $(document).ready(function() {

            $('#summernote_content').summernote({
                    placeholder: '내용을 작성하세요',
                    height: 400,                 // set editor height
                    minHeight: 400,             // set minimum height of editor
                    maxHeight: 400,             // set maximum height of editor
                    focus: false                  // set focus to editable area after initializing summernote
            });


        });


    </script>
    </html>