<%@ page language="java" contentType="text/html; charset-utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mypacks.DTO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="beancontent" class="mypacks.Announce_DAO"/>
<!DOCTYPE html>
<meta charset="UTF-8">

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

    </style>

    <%
        ArrayList<DTO> cont = beancontent.select();
    %>

    <body>
        <div id="header">
            <jsp:include page="MyhomepageHeader.jsp"></jsp:include>
        </div>
            <div id="maindiv">
            	<form action="JSP_session_write.jsp" method="post" name="write">
                	<ul>      
                    <li>제목</li>
                        <ul>
                            <li><input type="text" name="board_title"></li>
                        </ul>
                    <li>내용
                    </li>
                        <ul>
                           <li>
                            <textarea name="board_content" rows="25" cols="100"></textarea> 
                           </li>
                       </ul>
                </ul>
                <input type="hidden" name="board_photo" value="0">
                </form>
                <div id="buttondiv">
                	<div id="buttons">
                    	<button id="board_write_cancel">취소</button>
                    	<button id="board_write_confirm">작성</button>
                	</div>
            	</div>
            </div>

            
        <div id="footer">
        <jsp:include page="MyhomepageFooter.jsp"></jsp:include>
        </div>
    </body>

    <script type="text/javascript">

        document.getElementById("board_write_cancel").onclick = function(){
            history.back();
        }

        document.getElementById("board_write_confirm").onclick = function(){
            write.submit();
        }
    </script>

</html>