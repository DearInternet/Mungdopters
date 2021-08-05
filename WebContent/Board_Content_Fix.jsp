<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mypacks.DTO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="beancontent" class="mypacks.Announce_DAO"/>
<!DOCTYPE html>
<meta charset="UTF-8">

<html>

    <head>

        <title>Board_Content_Fix</title>

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

    <%
        ArrayList<DTO> cont = beancontent.select();
    %>

    <body>
        <div id="header">
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
        </div>
        
        <div id="maindiv">
            <form action="JSP_session_fix.jsp" method="post" name="fix">
                <ul>
                    <li>제목</li>
                        <ul>
                        <li><textarea id="title_textarea" name="board_title"><%= cont.get(Integer.parseInt(request.getParameter("contentnumedit"))).getB_announce_title() %></textarea></li>
                        </ul>
                    <li>내용</li>
                        <ul>
                            <li>
                            <textarea id="summernote_content" name="board_content"><%= cont.get(Integer.parseInt(request.getParameter("contentnumedit"))).getB_announce_content() %></textarea> 
                            </li>
                        </ul>
                </ul>
                <input type="hidden" name="board_photo" value="0">
                <input type="hidden" name="board_num" value="${param.contentnumedit}">
            </form>
            <div id="buttondiv">
                <div id="buttons">
                    <button id="board_fix_cancel" class="hoverbtn">취소</button>
                    <button id="board_fix_confirm" class="hoverbtn">작성</button>
                </div>
            </div>
        </div>      
            
            
        <div id="footer">
            <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
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

            document.getElementById("board_fix_cancel").onclick = function(){
                history.back();
            }

            document.getElementById("board_fix_confirm").onclick = function(){
                fix.submit();
            }
        }

        $(document).ready(function() {

            $('#summernote_content').summernote({
                    height: 400,                 // set editor height
                    minHeight: 400,             // set minimum height of editor
                    maxHeight: 400,             // set maximum height of editor
                    focus: false                  // set focus to editable area after initializing summernote
            });


        });


    </script>



</html>